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

    // AXI ethernet reset signals
    wire mmcm_rst;
    wire pma_reset;
    wire mmcm_locked;
    wire ref_clk;

    // global clocks & resets
    // TODO: replace with our MMCM
    axi_ethernet_0_clocks_resets example_clocks_resets
    (
        .clk_in_p          (gtrefclk_p     ),
        .clk_in_n          (gtrefclk_n     ),
        // asynchronous control/resets
        .sys_rst           (sys_rst        ),
        .soft_rst          (1'b0           ),
        .mmcm_locked_out   (mmcm_locked_out),

        //reset outputs
        .axi_lite_resetn   (axi_lite_resetn),
        .axis_rstn         (axis_rstn      ),
        .sys_out_rst       (sys_out_rst    ),

        // clock outputs
        .gtx_clk_bufg      (clkgen_gtx_clk ),
        .ref_clk_bufg      (ref_clk        ),
        .ref_clk_50_bufg   (ref_clk_50_bufg),
        .axis_clk_bufg     (axis_clk       ),
        .axi_lite_clk_bufg (axi_lite_clk   )
    );


    axi_ethernet_0_support_resets  axi_ethernet_support_resets
    (
        .mmcm_rst_out         (mmcm_rst         ),
        .pma_reset            (pma_reset        ),
        .locked               (mmcm_locked      ),
        .ref_clk              (ref_clk          ),
        .resetn               (s_axi_lite_resetn) 
    );


    // AXI ethernet clock signals
    wire pma_reset            ;
    wire userclk              ;
    wire userclk2             ;
    wire rxuserclk            ;
    wire rxuserclk2           ;
    wire gtref_clk            ;
    wire txoutclk             ;
    wire rxoutclk             ;
    wire gt0_pll0outclk_in    ;
    wire gt0_pll0outrefclk_in ;
    wire gt0_pll1outclk_in    ;
    wire gt0_pll1outrefclk_in ;
    wire gt0_pll0lock_in      ;
    wire gt0_pll0refclklost_in;
    wire gt0_pll0reset_out    ;
    wire gtref_clk_buf        ;

    // Instantiate the sharable clocking logic
    axi_ethernet_0_support_clocks axi_ethernet_support_clocking
    (
        .mgt_clk_p      (gtrefclk_p        ),
        .mgt_clk_n      (gtrefclk_n        ),
        .txoutclk       (txoutclk          ),
        .rxoutclk       (rxoutclk          ),
        .userclk        (userclk           ),
        .userclk2       (userclk2          ),
        .rxuserclk      (rxuserclk         ),
        .rxuserclk2     (rxuserclk2        ),
        .gtref_clk      (gtref_clk         ),
        .gtref_clk_bufg (gtref_clk_bufg    ),
        .locked         (mmcm_locked       ), 
        .reset          (mmcm_rst          )
    );

    axi_ethernet_0_support_gt_common   gt_common_logic
    (
        .gt0_pll0outclk         (gt0_pll0outclk    ),
        .gt0_pll0outrefclk      (gt0_pll0outrefclk ),
        .gt0_pll1outclk         (gt0_pll1outclk    ),
        .gt0_pll1outrefclk      (gt0_pll1outrefclk ),
        .gt0_pll0lock_out       (gt0_pll0lock      ),
        .gt0_pll0refclklost_out (gt0_pll0refclklost),
        .gt0_pll0reset_in       (gt0_pll0reset     ),
        .pma_reset_in           (pma_reset         ),
        .gt0_lockdetclk_in      (ref_clk           ),
        .gt0_gtrefclk0_in       (gtref_clk         ) 
    );

endmodule
