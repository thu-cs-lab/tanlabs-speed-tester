
`timescale 1 ns / 1 ps

module axi_ethernet_clock_wrapper (
    input  wire _s_axi_lite_clk       ,
    input  wire _s_axi_lite_resetn    ,
    input  wire _ref_clk              ,
    input  wire _glbl_rst             ,
    input  wire _mmcm_locked          ,
    input  wire _userclk              ,
    input  wire _userclk2             ,
    input  wire _rxuserclk            ,
    input  wire _rxuserclk2           ,
    input  wire _pma_reset            ,
    input  wire _gtref_clk            ,
    input  wire _gtref_clk_buf        ,
    input  wire _gt0_pll0outclk_in    ,
    input  wire _gt0_pll0outrefclk_in ,
    input  wire _gt0_pll1outclk_in    ,
    input  wire _gt0_pll1outrefclk_in ,
    input  wire _gt0_pll0lock_in      ,
    input  wire _gt0_pll0refclklost_in,
    output wire s_axi_lite_clk       ,
    output wire s_axi_lite_resetn    ,
    output wire ref_clk              ,
    output wire glbl_rst             ,
    output wire mmcm_locked          ,
    output wire userclk              ,
    output wire userclk2             ,
    output wire rxuserclk            ,
    output wire rxuserclk2           ,
    output wire pma_reset            ,
    output wire gtref_clk            ,
    output wire gtref_clk_buf        ,
    output wire gt0_pll0outclk_in    ,
    output wire gt0_pll0outrefclk_in ,
    output wire gt0_pll1outclk_in    ,
    output wire gt0_pll1outrefclk_in ,
    output wire gt0_pll0lock_in      ,
    output wire gt0_pll0refclklost_in
);

`define EVAL(A) A
`define CONNECT(PORT) assign PORT = `EVAL(_``PORT)

`CONNECT(s_axi_lite_clk       );
`CONNECT(s_axi_lite_resetn    );
`CONNECT(ref_clk              );
`CONNECT(glbl_rst             );
`CONNECT(mmcm_locked          );
`CONNECT(userclk              );
`CONNECT(userclk2             );
`CONNECT(rxuserclk            );
`CONNECT(rxuserclk2           );
`CONNECT(pma_reset            );
`CONNECT(gtref_clk            );
`CONNECT(gtref_clk_buf        );
`CONNECT(gt0_pll0outclk_in    );
`CONNECT(gt0_pll0outrefclk_in );
`CONNECT(gt0_pll1outclk_in    );
`CONNECT(gt0_pll1outrefclk_in );
`CONNECT(gt0_pll0lock_in      );
`CONNECT(gt0_pll0refclklost_in);

endmodule
