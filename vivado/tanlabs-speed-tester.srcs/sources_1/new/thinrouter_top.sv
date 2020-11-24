`timescale 1ns / 1ps

module thinrouter_top(
    input wire rst,

    input wire gtrefclk_p,
    input wire gtrefclk_n,

    inout wire [15:0] led,

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

    // PonyLink data pins
    inout wire[4:0] ponylink_data,

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

    // lower bits of led are used by Zynq
    wire [7:0] available_leds;
    assign led = {available_leds, {8{1'bZ}}};
    assign sfp_tx_disable = '0;

    tanlabs_speed_tester speed_tester_inst(
        .clk_50M,
        .rst,
        .gtrefclk_n,
        .gtrefclk_p,
        .ponylink_port_0(ponylink_data[0]),
        .ponylink_port_1(ponylink_data[1]),
        .ponylink_port_2(ponylink_data[2]),
        .ponylink_port_3(ponylink_data[3]),
        .ponylink_ctrl(ponylink_data[4]),
        .sfp_led,
        .leds(available_leds),
        .sfp_port_0_rxn(sfp_rx_n[0]),
        .sfp_port_0_rxp(sfp_rx_p[0]),
        .sfp_port_0_txn(sfp_tx_n[0]),
        .sfp_port_0_txp(sfp_tx_p[0]),
        .sfp_port_1_rxn(sfp_rx_n[1]),
        .sfp_port_1_rxp(sfp_rx_p[1]),
        .sfp_port_1_txn(sfp_tx_n[1]),
        .sfp_port_1_txp(sfp_tx_p[1]),
        .sfp_port_2_rxn(sfp_rx_n[2]),
        .sfp_port_2_rxp(sfp_rx_p[2]),
        .sfp_port_2_txn(sfp_tx_n[2]),
        .sfp_port_2_txp(sfp_tx_p[2]),
        .sfp_port_3_rxn(sfp_rx_n[3]),
        .sfp_port_3_rxp(sfp_rx_p[3]),
        .sfp_port_3_txn(sfp_tx_n[3]),
        .sfp_port_3_txp(sfp_tx_p[3]),
        .sfp_rx_los
     );

endmodule
