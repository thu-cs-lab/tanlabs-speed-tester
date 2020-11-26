`timescale 1ns / 1ps

`include "tester_common.svh"

module frame_checker_impl #(
    parameter DATA_WIDTH = 64 * 8,
    parameter ID_WIDTH = 3
) (
    input wire clk,
    input wire rst,
    // control signals
    output wire ready,
    input  wire start,
    input  wire stop,
    output wire port_result_t result,
    // AXIS output
    output wire [DATA_WIDTH - 1:0] axis_m_data,
    output wire [DATA_WIDTH / 8 - 1:0] axis_m_keep,
    output wire axis_m_last,
    output wire [DATA_WIDTH / 8 - 1:0] axis_m_user,
    output wire [ID_WIDTH - 1:0] axis_m_id,
    output wire axis_m_valid,
    input  wire axis_m_ready,
    // AXIS input (all testing frames filtered)
    input  wire [DATA_WIDTH - 1:0] axis_s_data,
    input  wire [DATA_WIDTH / 8 - 1:0] axis_s_keep,
    input  wire axis_s_last,
    input  wire [DATA_WIDTH / 8 - 1:0] axis_s_user,
    input  wire [ID_WIDTH - 1:0] axis_s_id,
    input  wire axis_s_valid,
    output wire axis_s_ready
);

    // test result
    port_result_t curr_result, next_result;
    assign result = curr_result;

    // reset result when starting counting or resetting
    assign ready = 1'b1;
    always_ff @(posedge clk) begin
        if (rst || start) begin
            curr_result <= '0;
        end else begin
            curr_result <= next_result;
        end
    end

    // count valid bytes in current beat
    wire [6:0] beat_size;
    assign beat_size = rst ? '0 : clz64(~axis_s_keep);
    wire full_beat;
    assign full_beat = rst ? '0 : beat_size == 7'd64;

    // connect non-handshake axi signals
    assign axis_m_data = axis_s_data;
    assign axis_m_keep = axis_s_keep;
    assign axis_m_last = axis_s_last;
    assign axis_m_user = axis_s_user;
    assign axis_m_id = axis_s_id;

    // cast data to ip header
    frame_header_t first_beat_header;
    assign first_beat_header = axis_s_data;

    // check testing flags
    logic is_first_test_beat, prev_test_beat, is_test_frame;
    assign is_test_frame = (!rst) && (is_first_test_beat || prev_test_beat);
    assign is_first_test_beat = (!rst) && axis_s_valid
        && (first_beat_header.eth_header.ether_type == u16_t'({<<8{16'h0800}}))
        && (first_beat_header.ip_header.proto == `TEST_FRAME_PROTO)
        && (first_beat_header.ip_header.tos == `TEST_FRAME_TOS)
        && (first_beat_header.ip_header.version == 4'd4)
        && (first_beat_header.ip_header.ihl == 4'd5);

    // dummy handshake to drop test frames
    wire axis_recv_ready;
    assign axis_recv_ready = (!rst) && (is_test_frame ? 1'b1 : axis_m_ready);
    assign axis_m_valid = (!rst) && (is_test_frame ? 1'b0 : axis_s_valid);
    assign axis_s_ready = axis_recv_ready;

    // handshake success
    wire beat_sent;
    assign beat_sent = axis_s_valid && axis_recv_ready;
    
    // mark whole frame as test
    always_ff @(posedge clk) begin
        if (rst) begin
            prev_test_beat <= 1'b0;
        end else begin
            if (beat_sent) begin
                if (is_first_test_beat) prev_test_beat <= 1'b1;
                if (axis_s_last) prev_test_beat <= 1'b0;
            end
        end
    end

    // recover LFSR sequence from id
    u16_t next_lfsr, lfsr;
    assign lfsr = first_beat_header.ip_header.id;
    assign next_lfsr = {lfsr[0] ^ lfsr[2] ^ lfsr[3] ^ lfsr[5], lfsr[15:1]};
    u16_t random_content_part_lfsr;
    lfsr16 lfsr_content_inst(
        .clk,
        .rst,
        .cen(beat_sent),
        .wen(is_first_test_beat),
        .din(next_lfsr), // set to next lfsr value to check in the next beat
        .dout(random_content_part_lfsr)
    );

    u16_t random_content_part;
    assign random_content_part = is_first_test_beat ? first_beat_header.ip_header.id : random_content_part_lfsr;

    // random content of a full beat
    wire [DATA_WIDTH-1:0] random_content;
    assign random_content = {DATA_WIDTH / $bits(random_content_part){random_content_part}};

    // calculate checksum
    u16_t checksum;
    ip_header_checksum checksum_inst(
        .ip_header(first_beat_header.ip_header),
        .checksum
    );

    // byte matching of whole beat
    wire [DATA_WIDTH / 8 - 1:0] full_match;
    generate
        for (genvar i = 0; i < DATA_WIDTH / 8; ++i) begin
            assign full_match[i] = (!rst) && axis_s_data[8*i +: 8] == random_content[8*i +: 8];
        end
    endgenerate

    // generate mask for data that needs to be checked
    logic [DATA_WIDTH / 8 - 1:0] match_mask;
    always_comb begin
        if (rst || !axis_s_valid) match_mask = '0;
        else begin
            match_mask = axis_m_keep; // keep only valid bytes in AXIS data
            if (is_first_test_beat) begin
                match_mask = match_mask & ~64'hFFFFF; // mask IP header (20 bytes) when comparing
            end
        end
    end

    // check if content is correct in current beat
    wire content_correct;
    assign content_correct = (!rst) && ~(full_match | ~match_mask) == '0 && (axis_s_user == '0);

    // check beats correctness & size
    logic current_beat_correct, beats_correct, prev_beats_correct;
    u16_t beat_size_sum, prev_beat_size_sum;
    // store old results
    always_ff @(posedge clk) begin
        if (rst) begin
            prev_beats_correct <= 1'b0;
            prev_beat_size_sum <= '0;
        end else begin
            if (beat_sent) begin
                prev_beats_correct <= beats_correct;
                prev_beat_size_sum <= beat_size_sum;
            end
        end
    end
    // check current beat (additionally check checksum in first test beat)
    always_comb begin
        if (rst) begin
            current_beat_correct = 1'b0;
            beats_correct = 1'b0;
            beat_size_sum = '0;
        end
        else begin
            if (is_first_test_beat) begin
                current_beat_correct = (checksum == first_beat_header.ip_header.checksum) && content_correct;
                beats_correct = current_beat_correct;
                beat_size_sum = beat_size;
            end else begin
                current_beat_correct = content_correct;
                beats_correct = prev_beats_correct && current_beat_correct;
                beat_size_sum = prev_beat_size_sum + beat_size;
            end    
        end
    end

    // accumulate test frame size
    always_comb begin
        if (rst) begin
            next_result = '0;
        end else begin
            next_result = curr_result;
            if (is_test_frame && beat_sent && axis_s_last) begin
                if (beats_correct) begin
                    next_result.recv_bytes = curr_result.recv_bytes + beat_size_sum;
                    next_result.recv_frames = curr_result.recv_frames + 1'b1;
                end else begin
                    next_result.err_bytes = curr_result.err_bytes + beat_size_sum;
                    next_result.err_frames = curr_result.err_frames + 1'b1;
                end
            end
        end
    end
    


endmodule
