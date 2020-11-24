`timescale 1ns / 1ps

module frame_checker #(
    parameter DATA_WIDTH = 64 * 8,
    parameter ID_WIDTH = 3
) (
    input wire clk,
    input wire rst,
    // control signals
    output wire ready,
    input  wire start,
    input  wire stop,
    output wire [127:0] result,
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

    frame_checker_impl #(
        .DATA_WIDTH(DATA_WIDTH),
        .ID_WIDTH(ID_WIDTH)
    ) frame_checker_inst (
        .clk(clk),
        .rst(rst),
        .ready(ready),
        .start(start),
        .stop(stop),
        .result(result),
        .axis_m_data(axis_m_data),
        .axis_m_keep(axis_m_keep),
        .axis_m_last(axis_m_last),
        .axis_m_user(axis_m_user),
        .axis_m_id(axis_m_id),
        .axis_m_valid(axis_m_valid),
        .axis_m_ready(axis_m_ready),
        .axis_s_data(axis_s_data),
        .axis_s_keep(axis_s_keep),
        .axis_s_last(axis_s_last),
        .axis_s_user(axis_s_user),
        .axis_s_id(axis_s_id),
        .axis_s_valid(axis_s_valid),
        .axis_s_ready(axis_s_ready)
    );

endmodule
