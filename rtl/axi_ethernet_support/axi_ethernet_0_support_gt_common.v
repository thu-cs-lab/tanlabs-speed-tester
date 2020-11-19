//----------------------------------------------------------------------------------------------------------------------
// Title      : Verilog Example Level Module
// File       : axi_ethernet_0_support_gt_common.v
// Author     : Xilinx Inc.
// ########################################################################################################################
// ##
// # (c) Copyright 2012-2016 Xilinx, Inc. All rights reserved.
// #
// # This file contains confidential and proprietary information of Xilinx, Inc. and is protected under U.S. and
// # international copyright and other intellectual property laws. 
// #
// # DISCLAIMER
// # This disclaimer is not a license and does not grant any rights to the materials distributed herewith. Except as
// # otherwise provided in a valid license issued to you by Xilinx, and to the maximum extent permitted by applicable law:
// # (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES AND
// # CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// # INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and (2) Xilinx shall not be liable (whether in contract or tort,
// # including negligence, or under any other theory of liability) for any loss or damage of any kind or nature related to,
// # arising under or in connection with these materials, including for any direct, or any indirect, special, incidental, or
// # consequential loss or damage (including loss of data, profits, goodwill, or any type of loss or damage suffered as a
// # result of any action brought by a third party) even if such damage or loss was reasonably foreseeable or Xilinx had
// # been advised of the possibility of the same.
// #
// # CRITICAL APPLICATIONS
// # Xilinx products are not designed or intended to be fail-safe, or for use in any application requiring fail-safe
// # performance, such as life-support or safety devices or systems, Class III medical devices, nuclear facilities,
// # applications related to the deployment of airbags, or any other applications that could lead to death, personal injury,
// # or severe property or environmental damage (individually and collectively, "Critical Applications"). Customer assumes
// # the sole risk and liability of any use of Xilinx products in Critical Applications, subject only to applicable laws and
// # regulations governing limitations on product liability.
// #
// # THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS PART OF THIS FILE AT ALL TIMES.
// #
// ########################################################################################################################
// Description: This module contains gt common of AXI Ethernet IP Example Design.
//              It contains other resources required for an example.
//----------------------------------------------------------------------------------------------------------------------

`timescale 1ps/1ps

module axi_ethernet_0_support_gt_common (
    output    gt0_pll0outclk         , 
    output    gt0_pll0outrefclk      , 
    output    gt0_pll1outclk         , 
    output    gt0_pll1outrefclk      , 
    output    gt0_pll0lock_out       , 
    output    gt0_pll0refclklost_out , 
    input     gt0_pll0reset_in       , 
    input     pma_reset_in           , 
    input     gt0_lockdetclk_in      , 
    input     gt0_gtrefclk0_in
);

localparam   WRAPPER_SIM_GTRESET_SPEEDUP    =   "TRUE";        


wire pll_rst;
assign pll_rst = pma_reset_in || gt0_pll0reset_in;

GTPE2_COMMON 
#(
    .SIM_RESET_SPEEDUP  (WRAPPER_SIM_GTRESET_SPEEDUP),
    .SIM_PLL0REFCLK_SEL (3'b001                     ),
    .SIM_PLL1REFCLK_SEL (3'b001                     ),
    .SIM_VERSION        ("2.0"                      ),

    .PLL0_FBDIV         (4                          ),
    .PLL0_FBDIV_45      (5                          ),
    .PLL0_REFCLK_DIV    (1                          ),
    .PLL1_FBDIV         (1                          ),
    .PLL1_FBDIV_45      (4                          ),
    .PLL1_REFCLK_DIV    (1                          ),

    .BIAS_CFG           (64'h0000000000050001       ),
    .COMMON_CFG         (32'h00000000               ),
    .PLL0_CFG           (27'h01F03DC                ),
    .PLL0_DMON_CFG      (1'b0                       ),
    .PLL0_INIT_CFG      (24'h00001E                 ),
    .PLL0_LOCK_CFG      (9'h1E8                     ),
    .PLL1_CFG           (27'h01F03DC                ),
    .PLL1_DMON_CFG      (1'b0                       ),
    .PLL1_INIT_CFG      (24'h00001E                 ),
    .PLL1_LOCK_CFG      (9'h1E8                     ),
    .PLL_CLKOUT_CFG     (8'h0                       ),
    .RSVD_ATTR0         (16'h0                      ),
    .RSVD_ATTR1         (16'h0                      ) 
)
gtpe2_common_i 
(
    .BGBYPASSB      (1                     ),
    .BGMONITORENB   (1                     ),
    .BGPDB          (1                     ),
    .BGRCALOVRD     (5'b11111              ),
    .BGRCALOVRDENB  (1                     ),
    .GTREFCLK0      (gt0_gtrefclk0_in      ),
    .PLL0LOCK       (gt0_pll0lock_out      ),
    .PLL0LOCKDETCLK (gt0_lockdetclk_in     ),
    .PLL0LOCKEN     (1                     ),
    .PLL0OUTCLK     (gt0_pll0outclk        ),
    .PLL0OUTREFCLK  (gt0_pll0outrefclk     ),
    .PLL0PD         (0                     ),
    .PLL0REFCLKLOST (gt0_pll0refclklost_out),
    .PLL0REFCLKSEL  (1                     ),
    .PLL0RESET      (pll_rst               ),
    .PLL1LOCKEN     (1                     ),
    .PLL1OUTCLK     (gt0_pll1outclk        ),
    .PLL1OUTREFCLK  (gt0_pll1outrefclk     ),
    .PLL1PD         (1                     ),
    .PLL1REFCLKSEL  (1                     ),
    .RCALENB        (1                     ) 
);


endmodule 
