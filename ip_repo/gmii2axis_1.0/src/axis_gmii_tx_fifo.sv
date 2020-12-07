module axis_gmii_tx_fifo #(
    parameter ENABLE_PADDING = 1,
    parameter MIN_FRAME_LENGTH = 64,
    parameter USER_WIDTH = 1
)(
    input  wire       clk,
    input  wire       rst,

    /*
     * AXI input
     */
    input  wire [7:0]            s_axis_tdata,
    input  wire                  s_axis_tvalid,
    output wire                  s_axis_tready,
    input  wire                  s_axis_tlast,
    input  wire [USER_WIDTH-1:0] s_axis_tuser,

    /*
     * GMII output
     */
    output wire [7:0] gmii_txd,
    output wire       gmii_tx_en,
    output wire       gmii_tx_er,

    /*
     * Status
     */
    output wire       start_packet,
    output wire       error_underflow
);

typedef enum logic [2:0] {
    IDLE, RECV, TRANS
} state_t;

wire prog_full;

wire [7:0]            fifo_axis_tdata;
wire                  fifo_axis_tvalid;
wire                  fifo_axis_tready;
wire                  fifo_axis_tlast;
wire [USER_WIDTH-1:0] fifo_axis_tuser;

wire status_overflow;
wire status_bad_frame;
wire status_good_frame;

axis_fifo #(
    .DEPTH (1024),
    .DATA_WIDTH (8),
    .KEEP_ENABLE (0),
    .LAST_ENABLE (1),
    .ID_ENABLE (0),
    .DEST_ENABLE (0),
    .USER_ENABLE (1),
    .USER_WIDTH (USER_WIDTH),
    .PIPELINE_OUTPUT (1),
    .FRAME_FIFO (1)
) u_axis_fifo (
	.clk               (clk               ),
    .rst               (rst               ),
    .s_axis_tdata      (s_axis_tdata      ),
    .s_axis_tvalid     (s_axis_tvalid     ),
    .s_axis_tready     (s_axis_tready     ),
    .s_axis_tlast      (s_axis_tlast      ),
    .s_axis_tuser      (s_axis_tuser      ),
    .m_axis_tdata      (fifo_axis_tdata   ),
    .m_axis_tvalid     (fifo_axis_tvalid  ),
    .m_axis_tready     (fifo_axis_tready  ),
    .m_axis_tlast      (fifo_axis_tlast   ),
    .m_axis_tuser      (fifo_axis_tuser   ),
    .status_overflow   (status_overflow   ),
    .status_bad_frame  (status_bad_frame  ),
    .status_good_frame (status_good_frame )
);

axis_gmii_tx #(
    .DATA_WIDTH (8),
    .ENABLE_PADDING (ENABLE_PADDING),
    .MIN_FRAME_LENGTH (MIN_FRAME_LENGTH),
    .PTP_TS_ENABLE (0),
    .USER_WIDTH (USER_WIDTH)
) u_axis_gmii_tx (
	.clk (clk),
    .rst (rst),
    .s_axis_tdata (fifo_axis_tdata),
    .s_axis_tvalid (fifo_axis_tvalid),
    .s_axis_tready (fifo_axis_tready),
    .s_axis_tlast (fifo_axis_tlast),
    .s_axis_tuser (fifo_axis_tuser),
    .gmii_txd (gmii_txd),
    .gmii_tx_en (gmii_tx_en),
    .gmii_tx_er (gmii_tx_er),
    .ptp_ts ('0),
    .m_axis_ptp_ts (),
    .m_axis_ptp_ts_tag (),
    .m_axis_ptp_ts_valid (),
    .clk_enable ('1),
    .mii_select ('1),
    .ifg_delay ('d12),
    .start_packet,
    .error_underflow
);

endmodule