`timescale 1ns / 1ps

`include "tester_common.svh"

typedef enum {
    STATE_IDLE, STATE_SENDING
} generator_state_t;

module frame_generator_impl #(
    parameter DATA_WIDTH = 64 * 8,
    parameter ID_WIDTH = 3
) (
    input wire clk,
    input wire rst,
    // control signals
    output wire ready,
    input  wire start,
    input  wire stop,
    input  wire port_config_t port_config,
    // AXIS output
    output logic [DATA_WIDTH - 1:0] axis_m_data,
    output logic [DATA_WIDTH / 8 - 1:0] axis_m_keep,
    output logic axis_m_last,
    output logic [DATA_WIDTH / 8 - 1:0] axis_m_user,
    output logic [ID_WIDTH - 1:0] axis_m_id,
    output logic axis_m_valid,
    input  wire axis_m_ready
);

    generator_state_t state, next_state;

    always_ff @(posedge clk) begin
        if (rst) begin
            state <= STATE_IDLE;
        end else begin
            state <= next_state;
        end
    end

    port_config_t current_config;
    frame_size_t remain_size;
    logic first_beat, last_beat;
    u16_t random_seed;

    assign ready = !rst && state == STATE_IDLE;
    assign last_beat = remain_size <= 64;

    
    // generate random ID in IP header
    wire [15:0] random_id;
    lfsr16 lfsr_id_inst(
        .clk,
        .rst,
        .cen(1'b1),
        .wen(1'b0),
        .dout(random_id)
    );



    // generate content in IP frame
    wire set_seed, next_random;
    // set random seed when generating a new frame
    assign set_seed = !rst && ((state == STATE_IDLE && next_state == STATE_SENDING) || (state == STATE_SENDING && axis_m_ready && last_beat));
    // go to next random number after each beat
    assign next_random = !rst && (set_seed || (state == STATE_SENDING && axis_m_ready));
    wire [15:0] random_content_part;
    lfsr16 lfsr_content_inst(
        .clk,
        .rst,
        .cen(next_random),
        .wen(set_seed),
        .din(random_id),
        .dout(random_content_part)
    );

    wire [DATA_WIDTH-1:0] random_content;
    assign random_content = {DATA_WIDTH / $bits(random_content_part){random_content_part}};
    

    // frame header
    frame_header_t first_beat_header;
    u16_t ip_length;


    // calculate checksum
    u16_t checksum;
    localparam checksum_num = $bits(ip_header_t) / 16;
    logic [23:0] checksum_imm[checksum_num:0];
    generate
        assign checksum_imm[0] = '0;
        for (genvar i = 0; i < checksum_num; i += 16) begin
            if (i != 5)
                assign checksum_imm[i + 1] = checksum_imm[i] + first_beat_header.ip_header[16 * i +: 16];
            else // skip checksum field
                assign checksum_imm[i + 1] = checksum_imm[i];
        end
    endgenerate
    logic [23:0] checksum_wrap;
    // wrap around twice for possible overflow
    assign checksum_wrap = checksum_imm[checksum_num][15:0] + checksum_imm[checksum_num][24:16];
    assign checksum = ~(checksum_wrap[15:0] + checksum_wrap[24:16]);
    

    // fill in other infomation
    always_comb begin
        first_beat_header = 'b0;
        if (!rst) begin
            // IP header
            first_beat_header.ip_header.version = 4'd4;
            first_beat_header.ip_header.ihl = 4'd5;
            first_beat_header.ip_header.tos = `TEST_FRAME_TOS;
            first_beat_header.ip_header.length = {<<8{ip_length}};
            first_beat_header.ip_header.id = random_seed; // random_id from last cycle
            first_beat_header.ip_header.ttl = 8'd64;
            first_beat_header.ip_header.proto = `TEST_FRAME_PROTO;
            first_beat_header.ip_header.src_addr = current_config.src_ip;
            first_beat_header.ip_header.dst_addr = current_config.dst_ip;
            first_beat_header.ip_header.checksum = checksum;
            // ethernet header
            first_beat_header.eth_header.ether_type = {<<8{16'h0800}}; // IP
            first_beat_header.eth_header.src_mac = current_config.src_mac;
            first_beat_header.eth_header.dst_mac = current_config.dst_mac;
        end
    end


    // AXIS signals
    assign axis_m_valid = !rst && state == STATE_SENDING;
    assign axis_m_last = !rst && last_beat;
    assign axis_m_user = '0;
    assign axis_m_id = '0;

    
    // set AXIS tdata
    always_comb begin
        if (rst) begin
            axis_m_data = '0;
        end else begin
            // fill with repeated LSFR result
            axis_m_data = random_content;
            if (first_beat) begin
                axis_m_data[$bits(frame_header_t)-1:0] = first_beat_header;
            end
        end
    end


    // set AXIS tkeep (byte mask)
    always_comb begin
        if (rst) begin
            axis_m_keep = '0;
        end else begin
            if (remain_size >= 64) begin
                axis_m_keep = ~64'b0;
            end else begin
                axis_m_keep = (~64'b0) >> (64 - remain_size);
            end
        end
    end


    // stopping control
    logic prev_stop;
    wire need_stop;
    assign need_stop = stop || prev_stop;

    logic need_start;
    assign need_start = start && port_config.enable;


    // state transition
    always_comb begin
        next_state = state;
        case (state)
            STATE_IDLE: begin
                if (need_start) begin
                    next_state = STATE_SENDING;
                end
            end
            STATE_SENDING: begin
                // stop after finishing current frame
                if (axis_m_ready && last_beat && need_stop) begin
                    next_state = STATE_IDLE;
                end
            end
        endcase
    end

    always_ff @(posedge clk) begin
        if (rst) begin
            current_config <= '0;
            remain_size <= '0;
            ip_length <= '0;
            first_beat <= 1'b0;
            random_seed <= '0;
            prev_stop <= 1'b0;
        end else begin
            if (stop) prev_stop <= stop;
            case (state)
                STATE_IDLE: begin
                    if (need_start) begin
                        // initialize generator
                        current_config <= port_config;
                        remain_size <= port_config.frame_size;
                        ip_length <= port_config.frame_size - $bits(eth_header_t) / 8;
                        random_seed <= random_id;
                        first_beat <= 1'b1;
                    end
                end
                STATE_SENDING: begin
                    if (axis_m_ready) begin
                        // current beat is sent
                        first_beat <= 1'b0;
                        if (!last_beat) begin
                            // go to next beat
                            remain_size <= remain_size - 64;
                        end else begin
                            // current frame is finished, go to next frame
                            first_beat <= 1'b1;
                            random_seed <= random_id;
                            remain_size <= port_config.frame_size;
                        end
                    end
                end
            endcase
        end
    end

endmodule
