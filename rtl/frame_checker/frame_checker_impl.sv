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

    

endmodule
