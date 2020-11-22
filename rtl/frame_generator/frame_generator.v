`timescale 1ns / 1ps

// Verilog wrapper of frame_generator_impl
module frame_generator #(
    parameter DATA_WIDTH = 64 * 8,
    parameter ID_WIDTH = 3
) (
    input wire clk,
    input wire rst,
    // control signals
    output wire ready,
    input  wire start,
    input  wire stop,
    input  wire [191:0] port_config,
    // AXIS output
    output wire [DATA_WIDTH - 1:0] axis_m_data,
    output wire [DATA_WIDTH / 8 - 1:0] axis_m_keep,
    output wire axis_m_last,
    output wire [DATA_WIDTH / 8 - 1:0] axis_m_user,
    output wire [ID_WIDTH - 1:0] axis_m_id,
    output wire axis_m_valid,
    input  wire axis_m_ready
);

    frame_generator_impl #(
        .DATA_WIDTH(DATA_WIDTH),
        .ID_WIDTH(ID_WIDTH)
    ) frame_generator_inst (
        .clk(clk),
        .rst(rst),
        .ready(ready),
        .start(start),
        .stop(stop),
        .port_config(port_config),
        .axis_m_data(axis_m_data),
        .axis_m_keep(axis_m_keep),
        .axis_m_last(axis_m_last),
        .axis_m_user(axis_m_user),
        .axis_m_id(axis_m_id),
        .axis_m_valid(axis_m_valid),
        .axis_m_ready(axis_m_read)
    );

endmodule
