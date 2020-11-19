//----------------------------------------------------------------------------------------------------------------------
// Title      : Verilog Example Level Module
// File       : axi_ethernet_0_support_clocks.v
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
// Description: This generates clocks for PCS PMA of AXI Ethernet IP.
//              It contains other resources required for an example.
//----------------------------------------------------------------------------------------------------------------------
`timescale 1ps/1ps
module axi_ethernet_0_support_clocks (
    // Clock in ports
    input     mgt_clk_p      , 
    input     mgt_clk_n      , 
    input     txoutclk       , // txoutclk from GT transceiver.
    input     rxoutclk       , // rxoutclk from GT transceiver.
    // Clock out ports
    output    userclk        , // for GT PMA reference clock
    output    userclk2       , // 125MHz clock for core reference clock.
    output    rxuserclk      , // for GT PMA reference clock
    output    rxuserclk2     , // 125MHz clock for core reference clock.
    output    gtref_clk      , // gtrefclk routed through an IBUFG.
    output    gtref_clk_bufg , // gtrefclk routed through an IBUFG.
    output    locked    ,
    input     reset   
);

// IBUFDS on the input differential clock.
IBUFDS_GTE2 ibufds_gtrefclk ( .I (mgt_clk_p), .IB (mgt_clk_n), .CEB (1'b0), .O (gtref_clk), .ODIV2 ());
BUFG bufg_gtref_clk (.I (gtref_clk), .O(gtref_clk_bufg ));
BUFG bufg_txoutclk (.I (txoutclk), .O(txoutclk_bufg ));
BUFG bufg_userclk2 (.I (clkout0 ), .O(userclk2      ));
BUFG bufg_userclk  (.I (clkout1 ), .O(userclk       ));
BUFG clkf_buf (.I(mmcm_clkfbout), .O(mmcm_clkfbout_buf));

MMCME2_ADV 
#(
    .BANDWIDTH            ("OPTIMIZED"),
    .CLKOUT4_CASCADE      ("FALSE"    ),
    .COMPENSATION         ("ZHOLD"    ),
    .STARTUP_WAIT         ("FALSE"    ),
    .DIVCLK_DIVIDE        (1          ),
    .CLKFBOUT_MULT_F      (16.0      ),
    .CLKFBOUT_PHASE       (0.000      ),
    .CLKFBOUT_USE_FINE_PS ("FALSE"    ),
    .CLKOUT0_DIVIDE_F     (8.0       ),
    .CLKOUT0_PHASE        (0.000      ),
    .CLKOUT0_DUTY_CYCLE   (0.5        ),
    .CLKOUT0_USE_FINE_PS  ("FALSE"    ),
    .CLKOUT1_DIVIDE       (16.0      ),
    .CLKOUT1_PHASE        (0.000      ),
    .CLKOUT1_DUTY_CYCLE   (0.5        ),
    .CLKOUT1_USE_FINE_PS  ("FALSE"    ),
    .CLKIN1_PERIOD        (16.0      ),
    .REF_JITTER1          (0.010      ) 
) 
mmcm_adv_inst 
(
    .CLKFBIN  (mmcm_clkfbout_buf),
    .CLKFBOUT (mmcm_clkfbout    ),
    .CLKOUT0  (clkout0          ),
    .CLKOUT1  (clkout1          ),
    .CLKIN1   (txoutclk_bufg    ),
    .CLKIN2   (1'b0             ),
    .CLKINSEL (1'b1             ),
    .DADDR    (7'h0             ),
    .DCLK     (1'b0             ),
    .DEN      (1'b0             ),
    .DI       (16'h0            ),
    .DWE      (1'b0             ),
    .PSCLK    (1'b0             ),
    .PSEN     (1'b0             ),
    .PSINCDEC (1'b0             ),
    .LOCKED   (locked           ),
    .PWRDWN   (1'b0             ),
    .RST      (reset            ) 
);

wire rxoutclk_buf;

BUFG    rxrecclkbufg    ( .I(rxoutclk), .O(rxoutclk_buf));

assign rxuserclk2 = rxoutclk_buf;
assign rxuserclk  = rxoutclk_buf;


endmodule 
