`timescale 1ns / 1ps

module thinrouter_top(
    input wire RST,

    input wire gtrefclk_p,
    input wire gtrefclk_n,

    output wire [15:0] led,

    // SFP:
    // +-+-+
    // |0|2|
    // +-+-+
    // |1|3|
    // +-+-+
    input wire [3:0] sfp_rx_los,
    input wire [3:0] sfp_rx_p,
    input wire [3:0] sfp_rx_n,
    output wire [3:0] sfp_tx_disable,
    output wire [3:0] sfp_tx_p,
    output wire [3:0] sfp_tx_n,
    output wire [7:0] sfp_led,  // 0 1  2 3  4 5  6 7

    // unused.
    input wire sfp_sda,
    input wire sfp_scl,

    /// below are signals from thinpad_top

    // clocks
    input wire clk_50M,
    input wire clk_11M0592,

    // GPIOs
    input  wire BTN, // manual clock
    input  wire[3:0]  touch_btn,
    input  wire[15:0] dip_sw,
    output wire[7:0]  dpy0,
    output wire[7:0]  dpy1,

    // CPLD serial (unused)
    output wire uart_rdn,
    output wire uart_wrn,
    input wire uart_dataready,
    input wire uart_tbre,
    input wire uart_tsre,

    // BaseRAM
    inout wire[31:0] base_ram_data,
    output wire[19:0] base_ram_addr,
    output wire[3:0] base_ram_be_n,
    output wire base_ram_ce_n,
    output wire base_ram_oe_n,
    output wire base_ram_we_n,

    // ExtRAM
    inout wire[31:0] ext_ram_data,
    output wire[19:0] ext_ram_addr,
    output wire[3:0] ext_ram_be_n,
    output wire ext_ram_ce_n,
    output wire ext_ram_oe_n,
    output wire ext_ram_we_n,

    // UART
    output wire txd,
    input  wire rxd,

    // Flash (JS28F640)
    output wire [22:0]flash_a,
    inout  wire [15:0]flash_d,
    output wire flash_rp_n,
    output wire flash_vpen,
    output wire flash_ce_n,
    output wire flash_oe_n,
    output wire flash_we_n,
    output wire flash_byte_n,

    // HDMI output
    output wire[2:0] video_red,
    output wire[2:0] video_green,
    output wire[1:0] video_blue,
    output wire video_hsync,
    output wire video_vsync,
    output wire video_clk,
    output wire video_de
);


endmodule
