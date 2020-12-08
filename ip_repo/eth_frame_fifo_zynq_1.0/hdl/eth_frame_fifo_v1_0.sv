
`timescale 1 ns / 1 ps

module eth_frame_fifo_v1_0 #(
    parameter DEPTH = 8192,
    parameter USER_WIDTH = 1,
    parameter ALWAYS_READY = 1,
    parameter DROP_BAD_FRAME = 0
) (
    input  wire clk,
    input  wire reset,

    input  wire [7:0] s_data,
    input  wire s_last,
    input  wire [USER_WIDTH-1:0] s_user,
    input  wire s_valid,
    output wire s_ready,

    output wire [7:0] m_data,
    output wire m_last,
    output wire [USER_WIDTH-1:0] m_user,
    output wire m_valid,
    input  wire m_ready
);

wire status_overflow;
wire status_bad_frame;
wire status_good_frame;

axis_fifo #(
    .DEPTH (DEPTH),
    .DATA_WIDTH (8),
    .KEEP_ENABLE (0),
    .LAST_ENABLE (1),
    .ID_ENABLE (0),
    .DEST_ENABLE (0),
    .USER_ENABLE (1),
    .USER_WIDTH (USER_WIDTH),
    .PIPELINE_OUTPUT (1),
    .FRAME_FIFO (1),
    .DROP_BAD_FRAME (DROP_BAD_FRAME),
    .DROP_WHEN_FULL (ALWAYS_READY)
) u_axis_fifo (
	.clk               (clk      ),
    .rst               (rst      ),
    .s_axis_tdata      (s_data   ),
    .s_axis_tvalid     (s_valid  ),
    .s_axis_tready     (s_ready  ),
    .s_axis_tlast      (s_last   ),
    .s_axis_tuser      (s_user   ),
    .m_axis_tdata      (m_data   ),
    .m_axis_tvalid     (m_valid  ),
    .m_axis_tready     (m_ready  ),
    .m_axis_tlast      (m_last   ),
    .m_axis_tuser      (m_user   ),
    .status_overflow   (status_overflow   ),
    .status_bad_frame  (status_bad_frame  ),
    .status_good_frame (status_good_frame )
);

endmodule