
`timescale 1 ns / 1 ps

module eth_frame_fifo_v1_0 #(
    parameter ENABLE = 1,
    parameter DATA_WIDTH = 64,
    parameter ID_WIDTH = 3
) (
    input  wire clk,
    input  wire reset,

    input  wire [DATA_WIDTH - 1:0] s_data,
    input  wire [DATA_WIDTH / 8 - 1:0] s_keep,
    input  wire s_last,
    input  wire [DATA_WIDTH / 8 - 1:0] s_user,
    input  wire [ID_WIDTH - 1:0] s_id,
    input  wire s_valid,
    output wire s_ready,

    output wire [DATA_WIDTH - 1:0] m_data,
    output wire [DATA_WIDTH / 8 - 1:0] m_keep,
    output wire m_last,
    output wire [DATA_WIDTH / 8 - 1:0] m_user,
    output wire [ID_WIDTH - 1:0] m_id,
    output wire m_valid,
    input  wire m_ready
);

frame_datapath_fifo #(
    .ENABLE (ENABLE),
    .DATA_WIDTH (DATA_WIDTH),
    .ID_WIDTH (ID_WIDTH)
) u_fifo (
    .eth_clk (clk),
    .reset,

    .s_data,
    .s_keep,
    .s_last,
    .s_user,
    .s_id,
    .s_valid,
    .s_ready,

    .m_data,
    .m_keep,
    .m_last,
    .m_user,
    .m_id,
    .m_valid,
    .m_ready
);


endmodule