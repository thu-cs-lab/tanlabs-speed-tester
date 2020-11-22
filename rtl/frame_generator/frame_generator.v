`timescale 1ns / 1ps

module frame_generator #(
    parameter DATA_WIDTH = 64,
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

endmodule
