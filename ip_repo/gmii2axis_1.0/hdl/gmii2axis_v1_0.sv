`timescale 1 ns / 1 ps

module gmii2axis_v1_0 #
(
	parameter USER_WIDTH = 1
) (
    input  wire clk,
    input  wire rst,

    /*
     * GMII slave
     */
    output wire [7:0] gmii_txd,
    output wire       gmii_tx_en,
    output wire       gmii_tx_er,
    input  wire [7:0] gmii_rxd,
    input  wire       gmii_rx_dv,
    input  wire       gmii_rx_er,

    /*
     * AXI input
     */
    input  wire [7:0]            s_axis_tdata,
    input  wire                  s_axis_tvalid,
    output wire                  s_axis_tready,
    input  wire                  s_axis_tlast,
    input  wire [USER_WIDTH-1:0] s_axis_tuser,

    /*
     * AXI output
     */
    output wire [7:0]            m_axis_tdata,
    output wire                  m_axis_tvalid,
    output wire                  m_axis_tlast,
    output wire [USER_WIDTH-1:0] m_axis_tuser,

	/*
	 * Status Vector
	*/
	output wire [4:0] status_vector
);

wire tx_start_packet;
wire tx_error_underflow;
wire rx_start_packet;
wire rx_error_bad_frame;
wire rx_error_bad_fcs;

assign status_vector = {
	rx_error_bad_fcs, rx_error_bad_frame, rx_start_packet,
	tx_error_underflow, tx_start_packet
};

axis_gmii_tx #(
    .USER_WIDTH (USER_WIDTH)
) u_gmii_tx (
    .clk,
    .rst,
    .s_axis_tdata,
    .s_axis_tvalid,
    .s_axis_tready,
    .s_axis_tlast,
    .s_axis_tuser,
    .gmii_txd,
    .gmii_tx_en,
    .gmii_tx_er,
    .ptp_ts ('0),
    .clk_enable ('1),
    .mii_select ('1),
    .ifg_delay ('d12),
    .start_packet (tx_start_packet),
    .error_underflow (tx_error_underflow)
);

axis_gmii_rx #(
    .USER_WIDTH (USER_WIDTH)
) u_gmii_rx (
    .clk,
    .rst,
    .gmii_rxd,
    .gmii_rx_dv,
    .gmii_rx_er,
    .m_axis_tdata,
    .m_axis_tvalid,
    .m_axis_tlast,
    .m_axis_tuser,
    .ptp_ts ('0),
    .clk_enable ('1),
    .mii_select ('1),
    .start_packet (rx_start_packet),
    .error_bad_frame (rx_error_bad_frame),
    .error_bad_fcs (rx_error_bad_fcs)
);

endmodule
