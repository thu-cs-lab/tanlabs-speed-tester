//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
//Date        : Tue Dec  8 00:15:22 2020
//Host        : cslab-i9 running 64-bit Debian GNU/Linux 10 (buster)
//Command     : generate_target test_logic_single_port.bd
//Design      : test_logic_single_port
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module axi_ethernet_inner_imp_10ZZ3JK
   (ethernet_clks_glbl_rst,
    ethernet_clks_gt0_pll0lock_in,
    ethernet_clks_gt0_pll0outclk_in,
    ethernet_clks_gt0_pll0outrefclk_in,
    ethernet_clks_gt0_pll0refclklost_in,
    ethernet_clks_gt0_pll1outclk_in,
    ethernet_clks_gt0_pll1outrefclk_in,
    ethernet_clks_gtref_clk,
    ethernet_clks_gtref_clk_buf,
    ethernet_clks_mmcm_locked,
    ethernet_clks_pma_reset,
    ethernet_clks_ref_clk,
    ethernet_clks_rxuserclk,
    ethernet_clks_rxuserclk2,
    ethernet_clks_s_axi_lite_clk,
    ethernet_clks_s_axi_lite_resetn,
    ethernet_clks_userclk,
    ethernet_clks_userclk2,
    gt0_pll0reset_out,
    m_axis_rx_tdata,
    m_axis_rx_tlast,
    m_axis_rx_tuser,
    m_axis_rx_tvalid,
    rx_mac_aclk,
    rx_reset,
    rxoutclk,
    s_axis_tx_tdata,
    s_axis_tx_tlast,
    s_axis_tx_tready,
    s_axis_tx_tuser,
    s_axis_tx_tvalid,
    sfp_rxn,
    sfp_rxp,
    sfp_txn,
    sfp_txp,
    signal_detect,
    tx_mac_aclk,
    tx_reset,
    txoutclk);
  input ethernet_clks_glbl_rst;
  input ethernet_clks_gt0_pll0lock_in;
  input ethernet_clks_gt0_pll0outclk_in;
  input ethernet_clks_gt0_pll0outrefclk_in;
  input ethernet_clks_gt0_pll0refclklost_in;
  input ethernet_clks_gt0_pll1outclk_in;
  input ethernet_clks_gt0_pll1outrefclk_in;
  input ethernet_clks_gtref_clk;
  input ethernet_clks_gtref_clk_buf;
  input ethernet_clks_mmcm_locked;
  input ethernet_clks_pma_reset;
  input ethernet_clks_ref_clk;
  input ethernet_clks_rxuserclk;
  input ethernet_clks_rxuserclk2;
  input ethernet_clks_s_axi_lite_clk;
  input ethernet_clks_s_axi_lite_resetn;
  input ethernet_clks_userclk;
  input ethernet_clks_userclk2;
  output gt0_pll0reset_out;
  output [7:0]m_axis_rx_tdata;
  output m_axis_rx_tlast;
  output [0:0]m_axis_rx_tuser;
  output m_axis_rx_tvalid;
  output rx_mac_aclk;
  output rx_reset;
  output rxoutclk;
  input [7:0]s_axis_tx_tdata;
  input s_axis_tx_tlast;
  output s_axis_tx_tready;
  input [0:0]s_axis_tx_tuser;
  input s_axis_tx_tvalid;
  input sfp_rxn;
  input sfp_rxp;
  output sfp_txn;
  output sfp_txp;
  input signal_detect;
  output tx_mac_aclk;
  output tx_reset;
  output txoutclk;

  wire Conn1_glbl_rst;
  wire Conn1_gt0_pll0lock_in;
  wire Conn1_gt0_pll0outclk_in;
  wire Conn1_gt0_pll0outrefclk_in;
  wire Conn1_gt0_pll0refclklost_in;
  wire Conn1_gt0_pll1outclk_in;
  wire Conn1_gt0_pll1outrefclk_in;
  wire Conn1_gtref_clk;
  wire Conn1_gtref_clk_buf;
  wire Conn1_mmcm_locked;
  wire Conn1_pma_reset;
  wire Conn1_ref_clk;
  wire Conn1_rxuserclk;
  wire Conn1_rxuserclk2;
  wire Conn1_s_axi_lite_clk;
  wire Conn1_s_axi_lite_resetn;
  wire Conn1_userclk;
  wire Conn1_userclk2;
  wire axi_ethernet_0_sfp_RXN;
  wire axi_ethernet_0_sfp_RXP;
  wire axi_ethernet_0_sfp_TXN;
  wire axi_ethernet_0_sfp_TXP;
  wire axi_ethernet_clock_w_0_glbl_rst;
  wire axi_ethernet_clock_w_0_gt0_pll0lock_in;
  wire axi_ethernet_clock_w_0_gt0_pll0outclk_in;
  wire axi_ethernet_clock_w_0_gt0_pll0outrefclk_in;
  wire axi_ethernet_clock_w_0_gt0_pll0refclklost_in;
  wire axi_ethernet_clock_w_0_gt0_pll1outclk_in;
  wire axi_ethernet_clock_w_0_gt0_pll1outrefclk_in;
  wire axi_ethernet_clock_w_0_gtref_clk;
  wire axi_ethernet_clock_w_0_gtref_clk_buf;
  wire axi_ethernet_clock_w_0_mmcm_locked;
  wire axi_ethernet_clock_w_0_pma_reset;
  wire axi_ethernet_clock_w_0_ref_clk;
  wire axi_ethernet_clock_w_0_rxuserclk;
  wire axi_ethernet_clock_w_0_rxuserclk2;
  wire axi_ethernet_clock_w_0_s_axi_lite_clk;
  wire axi_ethernet_clock_w_0_s_axi_lite_resetn;
  wire axi_ethernet_clock_w_0_userclk;
  wire axi_ethernet_clock_w_0_userclk2;
  wire [7:0]ponylink_to_zynq_axis_out_TDATA;
  wire ponylink_to_zynq_axis_out_TLAST;
  wire ponylink_to_zynq_axis_out_TREADY;
  wire [0:0]ponylink_to_zynq_axis_out_TUSER;
  wire ponylink_to_zynq_axis_out_TVALID;
  wire sfp_ethernet_gt0_pll0reset_out;
  wire [7:0]sfp_ethernet_m_axis_rx_TDATA;
  wire sfp_ethernet_m_axis_rx_TLAST;
  wire sfp_ethernet_m_axis_rx_TUSER;
  wire sfp_ethernet_m_axis_rx_TVALID;
  wire sfp_ethernet_rx_mac_aclk;
  wire sfp_ethernet_rx_reset;
  wire sfp_ethernet_rxoutclk;
  wire sfp_ethernet_tx_mac_aclk;
  wire sfp_ethernet_tx_reset;
  wire sfp_ethernet_txoutclk;
  wire signal_detect_1;
  wire [7:0]xlconstant_0_dout;

  assign Conn1_glbl_rst = ethernet_clks_glbl_rst;
  assign Conn1_gt0_pll0lock_in = ethernet_clks_gt0_pll0lock_in;
  assign Conn1_gt0_pll0outclk_in = ethernet_clks_gt0_pll0outclk_in;
  assign Conn1_gt0_pll0outrefclk_in = ethernet_clks_gt0_pll0outrefclk_in;
  assign Conn1_gt0_pll0refclklost_in = ethernet_clks_gt0_pll0refclklost_in;
  assign Conn1_gt0_pll1outclk_in = ethernet_clks_gt0_pll1outclk_in;
  assign Conn1_gt0_pll1outrefclk_in = ethernet_clks_gt0_pll1outrefclk_in;
  assign Conn1_gtref_clk = ethernet_clks_gtref_clk;
  assign Conn1_gtref_clk_buf = ethernet_clks_gtref_clk_buf;
  assign Conn1_mmcm_locked = ethernet_clks_mmcm_locked;
  assign Conn1_pma_reset = ethernet_clks_pma_reset;
  assign Conn1_ref_clk = ethernet_clks_ref_clk;
  assign Conn1_rxuserclk = ethernet_clks_rxuserclk;
  assign Conn1_rxuserclk2 = ethernet_clks_rxuserclk2;
  assign Conn1_s_axi_lite_clk = ethernet_clks_s_axi_lite_clk;
  assign Conn1_s_axi_lite_resetn = ethernet_clks_s_axi_lite_resetn;
  assign Conn1_userclk = ethernet_clks_userclk;
  assign Conn1_userclk2 = ethernet_clks_userclk2;
  assign axi_ethernet_0_sfp_RXN = sfp_rxn;
  assign axi_ethernet_0_sfp_RXP = sfp_rxp;
  assign gt0_pll0reset_out = sfp_ethernet_gt0_pll0reset_out;
  assign m_axis_rx_tdata[7:0] = sfp_ethernet_m_axis_rx_TDATA;
  assign m_axis_rx_tlast = sfp_ethernet_m_axis_rx_TLAST;
  assign m_axis_rx_tuser[0] = sfp_ethernet_m_axis_rx_TUSER;
  assign m_axis_rx_tvalid = sfp_ethernet_m_axis_rx_TVALID;
  assign ponylink_to_zynq_axis_out_TDATA = s_axis_tx_tdata[7:0];
  assign ponylink_to_zynq_axis_out_TLAST = s_axis_tx_tlast;
  assign ponylink_to_zynq_axis_out_TUSER = s_axis_tx_tuser[0];
  assign ponylink_to_zynq_axis_out_TVALID = s_axis_tx_tvalid;
  assign rx_mac_aclk = sfp_ethernet_rx_mac_aclk;
  assign rx_reset = sfp_ethernet_rx_reset;
  assign rxoutclk = sfp_ethernet_rxoutclk;
  assign s_axis_tx_tready = ponylink_to_zynq_axis_out_TREADY;
  assign sfp_txn = axi_ethernet_0_sfp_TXN;
  assign sfp_txp = axi_ethernet_0_sfp_TXP;
  assign signal_detect_1 = signal_detect;
  assign tx_mac_aclk = sfp_ethernet_tx_mac_aclk;
  assign tx_reset = sfp_ethernet_tx_reset;
  assign txoutclk = sfp_ethernet_txoutclk;
  test_logic_single_port_axi_ethernet_clock_w_0_8 axi_ethernet_clock_w_0
       (._glbl_rst(Conn1_glbl_rst),
        ._gt0_pll0lock_in(Conn1_gt0_pll0lock_in),
        ._gt0_pll0outclk_in(Conn1_gt0_pll0outclk_in),
        ._gt0_pll0outrefclk_in(Conn1_gt0_pll0outrefclk_in),
        ._gt0_pll0refclklost_in(Conn1_gt0_pll0refclklost_in),
        ._gt0_pll1outclk_in(Conn1_gt0_pll1outclk_in),
        ._gt0_pll1outrefclk_in(Conn1_gt0_pll1outrefclk_in),
        ._gtref_clk(Conn1_gtref_clk),
        ._gtref_clk_buf(Conn1_gtref_clk_buf),
        ._mmcm_locked(Conn1_mmcm_locked),
        ._pma_reset(Conn1_pma_reset),
        ._ref_clk(Conn1_ref_clk),
        ._rxuserclk(Conn1_rxuserclk),
        ._rxuserclk2(Conn1_rxuserclk2),
        ._s_axi_lite_clk(Conn1_s_axi_lite_clk),
        ._s_axi_lite_resetn(Conn1_s_axi_lite_resetn),
        ._userclk(Conn1_userclk),
        ._userclk2(Conn1_userclk2),
        .glbl_rst(axi_ethernet_clock_w_0_glbl_rst),
        .gt0_pll0lock_in(axi_ethernet_clock_w_0_gt0_pll0lock_in),
        .gt0_pll0outclk_in(axi_ethernet_clock_w_0_gt0_pll0outclk_in),
        .gt0_pll0outrefclk_in(axi_ethernet_clock_w_0_gt0_pll0outrefclk_in),
        .gt0_pll0refclklost_in(axi_ethernet_clock_w_0_gt0_pll0refclklost_in),
        .gt0_pll1outclk_in(axi_ethernet_clock_w_0_gt0_pll1outclk_in),
        .gt0_pll1outrefclk_in(axi_ethernet_clock_w_0_gt0_pll1outrefclk_in),
        .gtref_clk(axi_ethernet_clock_w_0_gtref_clk),
        .gtref_clk_buf(axi_ethernet_clock_w_0_gtref_clk_buf),
        .mmcm_locked(axi_ethernet_clock_w_0_mmcm_locked),
        .pma_reset(axi_ethernet_clock_w_0_pma_reset),
        .ref_clk(axi_ethernet_clock_w_0_ref_clk),
        .rxuserclk(axi_ethernet_clock_w_0_rxuserclk),
        .rxuserclk2(axi_ethernet_clock_w_0_rxuserclk2),
        .s_axi_lite_clk(axi_ethernet_clock_w_0_s_axi_lite_clk),
        .s_axi_lite_resetn(axi_ethernet_clock_w_0_s_axi_lite_resetn),
        .userclk(axi_ethernet_clock_w_0_userclk),
        .userclk2(axi_ethernet_clock_w_0_userclk2));
  test_logic_single_port_sfp_ethernet_7 sfp_ethernet
       (.glbl_rst(axi_ethernet_clock_w_0_glbl_rst),
        .gt0_pll0lock_in(axi_ethernet_clock_w_0_gt0_pll0lock_in),
        .gt0_pll0outclk_in(axi_ethernet_clock_w_0_gt0_pll0outclk_in),
        .gt0_pll0outrefclk_in(axi_ethernet_clock_w_0_gt0_pll0outrefclk_in),
        .gt0_pll0refclklost_in(axi_ethernet_clock_w_0_gt0_pll0refclklost_in),
        .gt0_pll0reset_out(sfp_ethernet_gt0_pll0reset_out),
        .gt0_pll1outclk_in(axi_ethernet_clock_w_0_gt0_pll1outclk_in),
        .gt0_pll1outrefclk_in(axi_ethernet_clock_w_0_gt0_pll1outrefclk_in),
        .gtref_clk(axi_ethernet_clock_w_0_gtref_clk),
        .gtref_clk_buf(axi_ethernet_clock_w_0_gtref_clk_buf),
        .m_axis_rx_tdata(sfp_ethernet_m_axis_rx_TDATA),
        .m_axis_rx_tlast(sfp_ethernet_m_axis_rx_TLAST),
        .m_axis_rx_tuser(sfp_ethernet_m_axis_rx_TUSER),
        .m_axis_rx_tvalid(sfp_ethernet_m_axis_rx_TVALID),
        .mmcm_locked(axi_ethernet_clock_w_0_mmcm_locked),
        .pma_reset(axi_ethernet_clock_w_0_pma_reset),
        .ref_clk(axi_ethernet_clock_w_0_ref_clk),
        .rx_mac_aclk(sfp_ethernet_rx_mac_aclk),
        .rx_reset(sfp_ethernet_rx_reset),
        .rxoutclk(sfp_ethernet_rxoutclk),
        .rxuserclk(axi_ethernet_clock_w_0_rxuserclk),
        .rxuserclk2(axi_ethernet_clock_w_0_rxuserclk2),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bready(1'b0),
        .s_axi_lite_clk(axi_ethernet_clock_w_0_s_axi_lite_clk),
        .s_axi_lite_resetn(axi_ethernet_clock_w_0_s_axi_lite_resetn),
        .s_axi_rready(1'b0),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .s_axis_pause_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axis_pause_tvalid(1'b0),
        .s_axis_tx_tdata(ponylink_to_zynq_axis_out_TDATA),
        .s_axis_tx_tlast(ponylink_to_zynq_axis_out_TLAST),
        .s_axis_tx_tready(ponylink_to_zynq_axis_out_TREADY),
        .s_axis_tx_tuser(ponylink_to_zynq_axis_out_TUSER),
        .s_axis_tx_tvalid(ponylink_to_zynq_axis_out_TVALID),
        .sfp_rxn(axi_ethernet_0_sfp_RXN),
        .sfp_rxp(axi_ethernet_0_sfp_RXP),
        .sfp_txn(axi_ethernet_0_sfp_TXN),
        .sfp_txp(axi_ethernet_0_sfp_TXP),
        .signal_detect(signal_detect_1),
        .tx_ifg_delay(xlconstant_0_dout),
        .tx_mac_aclk(sfp_ethernet_tx_mac_aclk),
        .tx_reset(sfp_ethernet_tx_reset),
        .txoutclk(sfp_ethernet_txoutclk),
        .userclk(axi_ethernet_clock_w_0_userclk),
        .userclk2(axi_ethernet_clock_w_0_userclk2));
  test_logic_single_port_xlconstant_0_12 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule

module controller_rst_sync_imp_1C5CXKN
   (clk,
    rst_in,
    rst_n_out,
    rst_out);
  input clk;
  input rst_in;
  output [0:0]rst_n_out;
  output rst_out;

  wire controller_rst_1;
  wire ponylink_clk;
  wire [0:0]ponylink_rst_n_Res;
  wire rx_reset_sync1_reset_out;

  assign controller_rst_1 = rst_in;
  assign ponylink_clk = clk;
  assign rst_n_out[0] = ponylink_rst_n_Res;
  assign rst_out = rx_reset_sync1_reset_out;
  test_logic_single_port_ponylink_rst_n_9 ponylink_rst_n
       (.Op1(rx_reset_sync1_reset_out),
        .Res(ponylink_rst_n_Res));
  test_logic_single_port_ponylink_rst_sync_1 ponylink_rst_sync
       (.clk(ponylink_clk),
        .reset_in(controller_rst_1),
        .reset_out(rx_reset_sync1_reset_out));
endmodule

module m00_couplers_imp_1S0P32
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tuser,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tid,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tstrb,
    S_AXIS_tuser,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [7:0]M_AXIS_tdata;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output [0:0]M_AXIS_tuser;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [7:0]S_AXIS_tdata;
  input [2:0]S_AXIS_tid;
  input [0:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input [0:0]S_AXIS_tstrb;
  input [0:0]S_AXIS_tuser;
  input S_AXIS_tvalid;

  wire [31:0]AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT;
  wire [31:0]AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT;
  wire S_AXIS_ACLK;
  wire S_AXIS_ARESETN;
  wire [7:0]auto_ss_k_to_auto_ss_slidr_TDATA;
  wire [2:0]auto_ss_k_to_auto_ss_slidr_TID;
  wire auto_ss_k_to_auto_ss_slidr_TLAST;
  wire auto_ss_k_to_auto_ss_slidr_TREADY;
  wire [0:0]auto_ss_k_to_auto_ss_slidr_TSTRB;
  wire [0:0]auto_ss_k_to_auto_ss_slidr_TUSER;
  wire auto_ss_k_to_auto_ss_slidr_TVALID;
  wire [7:0]auto_ss_slidr_to_m00_couplers_TDATA;
  wire auto_ss_slidr_to_m00_couplers_TLAST;
  wire auto_ss_slidr_to_m00_couplers_TREADY;
  wire [0:0]auto_ss_slidr_to_m00_couplers_TUSER;
  wire auto_ss_slidr_to_m00_couplers_TVALID;
  wire [7:0]m00_couplers_to_m00_data_fifo_TDATA;
  wire [2:0]m00_couplers_to_m00_data_fifo_TID;
  wire [0:0]m00_couplers_to_m00_data_fifo_TKEEP;
  wire m00_couplers_to_m00_data_fifo_TLAST;
  wire m00_couplers_to_m00_data_fifo_TREADY;
  wire [0:0]m00_couplers_to_m00_data_fifo_TSTRB;
  wire [0:0]m00_couplers_to_m00_data_fifo_TUSER;
  wire m00_couplers_to_m00_data_fifo_TVALID;
  wire [7:0]m00_data_fifo_to_auto_ss_k_TDATA;
  wire [2:0]m00_data_fifo_to_auto_ss_k_TID;
  wire [0:0]m00_data_fifo_to_auto_ss_k_TKEEP;
  wire m00_data_fifo_to_auto_ss_k_TLAST;
  wire m00_data_fifo_to_auto_ss_k_TREADY;
  wire [0:0]m00_data_fifo_to_auto_ss_k_TSTRB;
  wire [0:0]m00_data_fifo_to_auto_ss_k_TUSER;
  wire m00_data_fifo_to_auto_ss_k_TVALID;

  assign M_AXIS_tdata[7:0] = auto_ss_slidr_to_m00_couplers_TDATA;
  assign M_AXIS_tlast = auto_ss_slidr_to_m00_couplers_TLAST;
  assign M_AXIS_tuser[0] = auto_ss_slidr_to_m00_couplers_TUSER;
  assign M_AXIS_tvalid = auto_ss_slidr_to_m00_couplers_TVALID;
  assign S_AXIS_tready = m00_couplers_to_m00_data_fifo_TREADY;
  assign auto_ss_slidr_to_m00_couplers_TREADY = M_AXIS_tready;
  assign m00_couplers_to_m00_data_fifo_TDATA = S_AXIS_tdata[7:0];
  assign m00_couplers_to_m00_data_fifo_TID = S_AXIS_tid[2:0];
  assign m00_couplers_to_m00_data_fifo_TKEEP = S_AXIS_tkeep[0];
  assign m00_couplers_to_m00_data_fifo_TLAST = S_AXIS_tlast;
  assign m00_couplers_to_m00_data_fifo_TSTRB = S_AXIS_tstrb[0];
  assign m00_couplers_to_m00_data_fifo_TUSER = S_AXIS_tuser[0];
  assign m00_couplers_to_m00_data_fifo_TVALID = S_AXIS_tvalid;
  test_logic_single_port_auto_ss_k_8 auto_ss_k
       (.aclk(S_AXIS_ACLK),
        .aresetn(S_AXIS_ARESETN),
        .m_axis_tdata(auto_ss_k_to_auto_ss_slidr_TDATA),
        .m_axis_tid(auto_ss_k_to_auto_ss_slidr_TID),
        .m_axis_tlast(auto_ss_k_to_auto_ss_slidr_TLAST),
        .m_axis_tready(auto_ss_k_to_auto_ss_slidr_TREADY),
        .m_axis_tstrb(auto_ss_k_to_auto_ss_slidr_TSTRB),
        .m_axis_tuser(auto_ss_k_to_auto_ss_slidr_TUSER),
        .m_axis_tvalid(auto_ss_k_to_auto_ss_slidr_TVALID),
        .s_axis_tdata(m00_data_fifo_to_auto_ss_k_TDATA),
        .s_axis_tid(m00_data_fifo_to_auto_ss_k_TID),
        .s_axis_tkeep(m00_data_fifo_to_auto_ss_k_TKEEP),
        .s_axis_tlast(m00_data_fifo_to_auto_ss_k_TLAST),
        .s_axis_tready(m00_data_fifo_to_auto_ss_k_TREADY),
        .s_axis_tstrb(m00_data_fifo_to_auto_ss_k_TSTRB),
        .s_axis_tuser(m00_data_fifo_to_auto_ss_k_TUSER),
        .s_axis_tvalid(m00_data_fifo_to_auto_ss_k_TVALID));
  test_logic_single_port_auto_ss_slidr_4 auto_ss_slidr
       (.aclk(S_AXIS_ACLK),
        .aresetn(S_AXIS_ARESETN),
        .m_axis_tdata(auto_ss_slidr_to_m00_couplers_TDATA),
        .m_axis_tlast(auto_ss_slidr_to_m00_couplers_TLAST),
        .m_axis_tready(auto_ss_slidr_to_m00_couplers_TREADY),
        .m_axis_tuser(auto_ss_slidr_to_m00_couplers_TUSER),
        .m_axis_tvalid(auto_ss_slidr_to_m00_couplers_TVALID),
        .s_axis_tdata(auto_ss_k_to_auto_ss_slidr_TDATA),
        .s_axis_tid(auto_ss_k_to_auto_ss_slidr_TID),
        .s_axis_tlast(auto_ss_k_to_auto_ss_slidr_TLAST),
        .s_axis_tready(auto_ss_k_to_auto_ss_slidr_TREADY),
        .s_axis_tstrb(auto_ss_k_to_auto_ss_slidr_TSTRB),
        .s_axis_tuser(auto_ss_k_to_auto_ss_slidr_TUSER),
        .s_axis_tvalid(auto_ss_k_to_auto_ss_slidr_TVALID));
  test_logic_single_port_m00_data_fifo_0 m00_data_fifo
       (.axis_rd_data_count(AXIS_RD_DATA_COUNT_to_S_AXIS_RD_DATA_COUNT),
        .axis_wr_data_count(AXIS_WR_DATA_COUNT_to_S_AXIS_WR_DATA_COUNT),
        .m_axis_tdata(m00_data_fifo_to_auto_ss_k_TDATA),
        .m_axis_tid(m00_data_fifo_to_auto_ss_k_TID),
        .m_axis_tkeep(m00_data_fifo_to_auto_ss_k_TKEEP),
        .m_axis_tlast(m00_data_fifo_to_auto_ss_k_TLAST),
        .m_axis_tready(m00_data_fifo_to_auto_ss_k_TREADY),
        .m_axis_tstrb(m00_data_fifo_to_auto_ss_k_TSTRB),
        .m_axis_tuser(m00_data_fifo_to_auto_ss_k_TUSER),
        .m_axis_tvalid(m00_data_fifo_to_auto_ss_k_TVALID),
        .s_axis_aclk(S_AXIS_ACLK),
        .s_axis_aresetn(S_AXIS_ARESETN),
        .s_axis_tdata(m00_couplers_to_m00_data_fifo_TDATA),
        .s_axis_tid(m00_couplers_to_m00_data_fifo_TID),
        .s_axis_tkeep(m00_couplers_to_m00_data_fifo_TKEEP),
        .s_axis_tlast(m00_couplers_to_m00_data_fifo_TLAST),
        .s_axis_tready(m00_couplers_to_m00_data_fifo_TREADY),
        .s_axis_tstrb(m00_couplers_to_m00_data_fifo_TSTRB),
        .s_axis_tuser(m00_couplers_to_m00_data_fifo_TUSER),
        .s_axis_tvalid(m00_couplers_to_m00_data_fifo_TVALID));
endmodule

module ponylink_rst_sync_imp_1DHYSZS
   (clk,
    rst_n_in,
    rst_n_out);
  input clk;
  input [0:0]rst_n_in;
  output [0:0]rst_n_out;

  wire ponylink_clk;
  wire [0:0]ponylink_rst_n_Res;
  wire [0:0]ponylink_to_zynq_resetn_out;
  wire rx_reset_sync1_reset_out;
  wire [0:0]util_vector_logic_0_Res1;

  assign ponylink_clk = clk;
  assign ponylink_to_zynq_resetn_out = rst_n_in[0];
  assign rst_n_out[0] = ponylink_rst_n_Res;
  test_logic_single_port_ponylink_rst_async_6 ponylink_rst_async
       (.Op1(ponylink_to_zynq_resetn_out),
        .Res(util_vector_logic_0_Res1));
  test_logic_single_port_ponylink_rst_n_10 ponylink_rst_n
       (.Op1(rx_reset_sync1_reset_out),
        .Res(ponylink_rst_n_Res));
  test_logic_single_port_rx_reset_sync_1 ponylink_rst_sync
       (.clk(ponylink_clk),
        .reset_in(util_vector_logic_0_Res1),
        .reset_out(rx_reset_sync1_reset_out));
endmodule

module s00_couplers_imp_19I57HK
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tid,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tuser,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tlast,
    S_AXIS_tuser,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [511:0]M_AXIS_tdata;
  output [2:0]M_AXIS_tid;
  output [63:0]M_AXIS_tkeep;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output [63:0]M_AXIS_tuser;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [7:0]S_AXIS_tdata;
  input S_AXIS_tlast;
  input [0:0]S_AXIS_tuser;
  input S_AXIS_tvalid;

  wire M_AXIS_ACLK_1;
  wire M_AXIS_ARESETN_1;
  wire S_AXIS_ACLK_1;
  wire S_AXIS_ARESETN_1;
  wire [511:0]auto_cc_to_auto_ss_slid_TDATA;
  wire [63:0]auto_cc_to_auto_ss_slid_TKEEP;
  wire auto_cc_to_auto_ss_slid_TLAST;
  wire auto_cc_to_auto_ss_slid_TREADY;
  wire [63:0]auto_cc_to_auto_ss_slid_TUSER;
  wire auto_cc_to_auto_ss_slid_TVALID;
  wire [7:0]auto_ss_si_r_to_auto_us_TDATA;
  wire auto_ss_si_r_to_auto_us_TLAST;
  wire auto_ss_si_r_to_auto_us_TREADY;
  wire [0:0]auto_ss_si_r_to_auto_us_TUSER;
  wire auto_ss_si_r_to_auto_us_TVALID;
  wire [511:0]auto_ss_slid_to_s00_couplers_TDATA;
  wire [2:0]auto_ss_slid_to_s00_couplers_TID;
  wire [63:0]auto_ss_slid_to_s00_couplers_TKEEP;
  wire auto_ss_slid_to_s00_couplers_TLAST;
  wire auto_ss_slid_to_s00_couplers_TREADY;
  wire [63:0]auto_ss_slid_to_s00_couplers_TUSER;
  wire auto_ss_slid_to_s00_couplers_TVALID;
  wire [511:0]auto_us_to_auto_cc_TDATA;
  wire [63:0]auto_us_to_auto_cc_TKEEP;
  wire auto_us_to_auto_cc_TLAST;
  wire auto_us_to_auto_cc_TREADY;
  wire [63:0]auto_us_to_auto_cc_TUSER;
  wire auto_us_to_auto_cc_TVALID;
  wire [7:0]s00_couplers_to_auto_ss_si_r_TDATA;
  wire s00_couplers_to_auto_ss_si_r_TLAST;
  wire [0:0]s00_couplers_to_auto_ss_si_r_TUSER;
  wire s00_couplers_to_auto_ss_si_r_TVALID;

  assign M_AXIS_ACLK_1 = M_AXIS_ACLK;
  assign M_AXIS_ARESETN_1 = M_AXIS_ARESETN;
  assign M_AXIS_tdata[511:0] = auto_ss_slid_to_s00_couplers_TDATA;
  assign M_AXIS_tid[2:0] = auto_ss_slid_to_s00_couplers_TID;
  assign M_AXIS_tkeep[63:0] = auto_ss_slid_to_s00_couplers_TKEEP;
  assign M_AXIS_tlast = auto_ss_slid_to_s00_couplers_TLAST;
  assign M_AXIS_tuser[63:0] = auto_ss_slid_to_s00_couplers_TUSER;
  assign M_AXIS_tvalid = auto_ss_slid_to_s00_couplers_TVALID;
  assign S_AXIS_ACLK_1 = S_AXIS_ACLK;
  assign S_AXIS_ARESETN_1 = S_AXIS_ARESETN;
  assign auto_ss_slid_to_s00_couplers_TREADY = M_AXIS_tready;
  assign s00_couplers_to_auto_ss_si_r_TDATA = S_AXIS_tdata[7:0];
  assign s00_couplers_to_auto_ss_si_r_TLAST = S_AXIS_tlast;
  assign s00_couplers_to_auto_ss_si_r_TUSER = S_AXIS_tuser[0];
  assign s00_couplers_to_auto_ss_si_r_TVALID = S_AXIS_tvalid;
  test_logic_single_port_auto_cc_17 auto_cc
       (.m_axis_aclk(M_AXIS_ACLK_1),
        .m_axis_aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_cc_to_auto_ss_slid_TDATA),
        .m_axis_tkeep(auto_cc_to_auto_ss_slid_TKEEP),
        .m_axis_tlast(auto_cc_to_auto_ss_slid_TLAST),
        .m_axis_tready(auto_cc_to_auto_ss_slid_TREADY),
        .m_axis_tuser(auto_cc_to_auto_ss_slid_TUSER),
        .m_axis_tvalid(auto_cc_to_auto_ss_slid_TVALID),
        .s_axis_aclk(S_AXIS_ACLK_1),
        .s_axis_aresetn(S_AXIS_ARESETN_1),
        .s_axis_tdata(auto_us_to_auto_cc_TDATA),
        .s_axis_tkeep(auto_us_to_auto_cc_TKEEP),
        .s_axis_tlast(auto_us_to_auto_cc_TLAST),
        .s_axis_tready(auto_us_to_auto_cc_TREADY),
        .s_axis_tuser(auto_us_to_auto_cc_TUSER),
        .s_axis_tvalid(auto_us_to_auto_cc_TVALID));
  test_logic_single_port_auto_ss_si_r_4 auto_ss_si_r
       (.aclk(S_AXIS_ACLK_1),
        .aresetn(S_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_si_r_to_auto_us_TDATA),
        .m_axis_tlast(auto_ss_si_r_to_auto_us_TLAST),
        .m_axis_tready(auto_ss_si_r_to_auto_us_TREADY),
        .m_axis_tuser(auto_ss_si_r_to_auto_us_TUSER),
        .m_axis_tvalid(auto_ss_si_r_to_auto_us_TVALID),
        .s_axis_tdata(s00_couplers_to_auto_ss_si_r_TDATA),
        .s_axis_tlast(s00_couplers_to_auto_ss_si_r_TLAST),
        .s_axis_tuser(s00_couplers_to_auto_ss_si_r_TUSER),
        .s_axis_tvalid(s00_couplers_to_auto_ss_si_r_TVALID));
  test_logic_single_port_auto_ss_slid_18 auto_ss_slid
       (.aclk(M_AXIS_ACLK_1),
        .aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_slid_to_s00_couplers_TDATA),
        .m_axis_tid(auto_ss_slid_to_s00_couplers_TID),
        .m_axis_tkeep(auto_ss_slid_to_s00_couplers_TKEEP),
        .m_axis_tlast(auto_ss_slid_to_s00_couplers_TLAST),
        .m_axis_tready(auto_ss_slid_to_s00_couplers_TREADY),
        .m_axis_tuser(auto_ss_slid_to_s00_couplers_TUSER),
        .m_axis_tvalid(auto_ss_slid_to_s00_couplers_TVALID),
        .s_axis_tdata(auto_cc_to_auto_ss_slid_TDATA),
        .s_axis_tkeep(auto_cc_to_auto_ss_slid_TKEEP),
        .s_axis_tlast(auto_cc_to_auto_ss_slid_TLAST),
        .s_axis_tready(auto_cc_to_auto_ss_slid_TREADY),
        .s_axis_tuser(auto_cc_to_auto_ss_slid_TUSER),
        .s_axis_tvalid(auto_cc_to_auto_ss_slid_TVALID));
  test_logic_single_port_auto_us_8 auto_us
       (.aclk(S_AXIS_ACLK_1),
        .aresetn(S_AXIS_ARESETN_1),
        .m_axis_tdata(auto_us_to_auto_cc_TDATA),
        .m_axis_tkeep(auto_us_to_auto_cc_TKEEP),
        .m_axis_tlast(auto_us_to_auto_cc_TLAST),
        .m_axis_tready(auto_us_to_auto_cc_TREADY),
        .m_axis_tuser(auto_us_to_auto_cc_TUSER),
        .m_axis_tvalid(auto_us_to_auto_cc_TVALID),
        .s_axis_tdata(auto_ss_si_r_to_auto_us_TDATA),
        .s_axis_tlast(auto_ss_si_r_to_auto_us_TLAST),
        .s_axis_tready(auto_ss_si_r_to_auto_us_TREADY),
        .s_axis_tuser(auto_ss_si_r_to_auto_us_TUSER),
        .s_axis_tvalid(auto_ss_si_r_to_auto_us_TVALID));
endmodule

module s00_couplers_imp_1WD6HZJ
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tuser,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tid,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tuser,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [7:0]M_AXIS_tdata;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output [0:0]M_AXIS_tuser;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [63:0]S_AXIS_tdata;
  input [2:0]S_AXIS_tid;
  input [7:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input [7:0]S_AXIS_tuser;
  input S_AXIS_tvalid;

  wire M_AXIS_ACLK_1;
  wire M_AXIS_ARESETN_1;
  wire S_AXIS_ACLK_1;
  wire S_AXIS_ARESETN_1;
  wire [63:0]auto_cc_to_auto_ds_TDATA;
  wire [2:0]auto_cc_to_auto_ds_TID;
  wire [7:0]auto_cc_to_auto_ds_TKEEP;
  wire auto_cc_to_auto_ds_TLAST;
  wire auto_cc_to_auto_ds_TREADY;
  wire [7:0]auto_cc_to_auto_ds_TUSER;
  wire auto_cc_to_auto_ds_TVALID;
  wire [7:0]auto_ds_to_auto_ss_k_TDATA;
  wire [2:0]auto_ds_to_auto_ss_k_TID;
  wire [0:0]auto_ds_to_auto_ss_k_TKEEP;
  wire auto_ds_to_auto_ss_k_TLAST;
  wire auto_ds_to_auto_ss_k_TREADY;
  wire [0:0]auto_ds_to_auto_ss_k_TUSER;
  wire auto_ds_to_auto_ss_k_TVALID;
  wire [7:0]auto_ss_k_to_auto_ss_slid_TDATA;
  wire [2:0]auto_ss_k_to_auto_ss_slid_TID;
  wire auto_ss_k_to_auto_ss_slid_TLAST;
  wire auto_ss_k_to_auto_ss_slid_TREADY;
  wire [0:0]auto_ss_k_to_auto_ss_slid_TUSER;
  wire auto_ss_k_to_auto_ss_slid_TVALID;
  wire [7:0]auto_ss_slid_to_s00_couplers_TDATA;
  wire auto_ss_slid_to_s00_couplers_TLAST;
  wire auto_ss_slid_to_s00_couplers_TREADY;
  wire [0:0]auto_ss_slid_to_s00_couplers_TUSER;
  wire auto_ss_slid_to_s00_couplers_TVALID;
  wire [63:0]s00_couplers_to_auto_cc_TDATA;
  wire [2:0]s00_couplers_to_auto_cc_TID;
  wire [7:0]s00_couplers_to_auto_cc_TKEEP;
  wire s00_couplers_to_auto_cc_TLAST;
  wire s00_couplers_to_auto_cc_TREADY;
  wire [7:0]s00_couplers_to_auto_cc_TUSER;
  wire s00_couplers_to_auto_cc_TVALID;

  assign M_AXIS_ACLK_1 = M_AXIS_ACLK;
  assign M_AXIS_ARESETN_1 = M_AXIS_ARESETN;
  assign M_AXIS_tdata[7:0] = auto_ss_slid_to_s00_couplers_TDATA;
  assign M_AXIS_tlast = auto_ss_slid_to_s00_couplers_TLAST;
  assign M_AXIS_tuser[0] = auto_ss_slid_to_s00_couplers_TUSER;
  assign M_AXIS_tvalid = auto_ss_slid_to_s00_couplers_TVALID;
  assign S_AXIS_ACLK_1 = S_AXIS_ACLK;
  assign S_AXIS_ARESETN_1 = S_AXIS_ARESETN;
  assign S_AXIS_tready = s00_couplers_to_auto_cc_TREADY;
  assign auto_ss_slid_to_s00_couplers_TREADY = M_AXIS_tready;
  assign s00_couplers_to_auto_cc_TDATA = S_AXIS_tdata[63:0];
  assign s00_couplers_to_auto_cc_TID = S_AXIS_tid[2:0];
  assign s00_couplers_to_auto_cc_TKEEP = S_AXIS_tkeep[7:0];
  assign s00_couplers_to_auto_cc_TLAST = S_AXIS_tlast;
  assign s00_couplers_to_auto_cc_TUSER = S_AXIS_tuser[7:0];
  assign s00_couplers_to_auto_cc_TVALID = S_AXIS_tvalid;
  test_logic_single_port_auto_cc_18 auto_cc
       (.m_axis_aclk(M_AXIS_ACLK_1),
        .m_axis_aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_cc_to_auto_ds_TDATA),
        .m_axis_tid(auto_cc_to_auto_ds_TID),
        .m_axis_tkeep(auto_cc_to_auto_ds_TKEEP),
        .m_axis_tlast(auto_cc_to_auto_ds_TLAST),
        .m_axis_tready(auto_cc_to_auto_ds_TREADY),
        .m_axis_tuser(auto_cc_to_auto_ds_TUSER),
        .m_axis_tvalid(auto_cc_to_auto_ds_TVALID),
        .s_axis_aclk(S_AXIS_ACLK_1),
        .s_axis_aresetn(S_AXIS_ARESETN_1),
        .s_axis_tdata(s00_couplers_to_auto_cc_TDATA),
        .s_axis_tid(s00_couplers_to_auto_cc_TID),
        .s_axis_tkeep(s00_couplers_to_auto_cc_TKEEP),
        .s_axis_tlast(s00_couplers_to_auto_cc_TLAST),
        .s_axis_tready(s00_couplers_to_auto_cc_TREADY),
        .s_axis_tuser(s00_couplers_to_auto_cc_TUSER),
        .s_axis_tvalid(s00_couplers_to_auto_cc_TVALID));
  test_logic_single_port_auto_ds_9 auto_ds
       (.aclk(M_AXIS_ACLK_1),
        .aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ds_to_auto_ss_k_TDATA),
        .m_axis_tid(auto_ds_to_auto_ss_k_TID),
        .m_axis_tkeep(auto_ds_to_auto_ss_k_TKEEP),
        .m_axis_tlast(auto_ds_to_auto_ss_k_TLAST),
        .m_axis_tready(auto_ds_to_auto_ss_k_TREADY),
        .m_axis_tuser(auto_ds_to_auto_ss_k_TUSER),
        .m_axis_tvalid(auto_ds_to_auto_ss_k_TVALID),
        .s_axis_tdata(auto_cc_to_auto_ds_TDATA),
        .s_axis_tid(auto_cc_to_auto_ds_TID),
        .s_axis_tkeep(auto_cc_to_auto_ds_TKEEP),
        .s_axis_tlast(auto_cc_to_auto_ds_TLAST),
        .s_axis_tready(auto_cc_to_auto_ds_TREADY),
        .s_axis_tuser(auto_cc_to_auto_ds_TUSER),
        .s_axis_tvalid(auto_cc_to_auto_ds_TVALID));
  test_logic_single_port_auto_ss_k_10 auto_ss_k
       (.aclk(M_AXIS_ACLK_1),
        .aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_k_to_auto_ss_slid_TDATA),
        .m_axis_tid(auto_ss_k_to_auto_ss_slid_TID),
        .m_axis_tlast(auto_ss_k_to_auto_ss_slid_TLAST),
        .m_axis_tready(auto_ss_k_to_auto_ss_slid_TREADY),
        .m_axis_tuser(auto_ss_k_to_auto_ss_slid_TUSER),
        .m_axis_tvalid(auto_ss_k_to_auto_ss_slid_TVALID),
        .s_axis_tdata(auto_ds_to_auto_ss_k_TDATA),
        .s_axis_tid(auto_ds_to_auto_ss_k_TID),
        .s_axis_tkeep(auto_ds_to_auto_ss_k_TKEEP),
        .s_axis_tlast(auto_ds_to_auto_ss_k_TLAST),
        .s_axis_tready(auto_ds_to_auto_ss_k_TREADY),
        .s_axis_tuser(auto_ds_to_auto_ss_k_TUSER),
        .s_axis_tvalid(auto_ds_to_auto_ss_k_TVALID));
  test_logic_single_port_auto_ss_slid_19 auto_ss_slid
       (.aclk(M_AXIS_ACLK_1),
        .aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_slid_to_s00_couplers_TDATA),
        .m_axis_tlast(auto_ss_slid_to_s00_couplers_TLAST),
        .m_axis_tready(auto_ss_slid_to_s00_couplers_TREADY),
        .m_axis_tuser(auto_ss_slid_to_s00_couplers_TUSER),
        .m_axis_tvalid(auto_ss_slid_to_s00_couplers_TVALID),
        .s_axis_tdata(auto_ss_k_to_auto_ss_slid_TDATA),
        .s_axis_tid(auto_ss_k_to_auto_ss_slid_TID),
        .s_axis_tlast(auto_ss_k_to_auto_ss_slid_TLAST),
        .s_axis_tready(auto_ss_k_to_auto_ss_slid_TREADY),
        .s_axis_tuser(auto_ss_k_to_auto_ss_slid_TUSER),
        .s_axis_tvalid(auto_ss_k_to_auto_ss_slid_TVALID));
endmodule

module s00_couplers_imp_24TIC8
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tid,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tstrb,
    M_AXIS_tuser,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tstrb,
    S_AXIS_tuser,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [7:0]M_AXIS_tdata;
  output [2:0]M_AXIS_tid;
  output [0:0]M_AXIS_tkeep;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output [0:0]M_AXIS_tstrb;
  output [0:0]M_AXIS_tuser;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [7:0]S_AXIS_tdata;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input [0:0]S_AXIS_tstrb;
  input [0:0]S_AXIS_tuser;
  input S_AXIS_tvalid;

  wire M_AXIS_ACLK_1;
  wire M_AXIS_ARESETN_1;
  wire S_AXIS_ACLK_1;
  wire S_AXIS_ARESETN_1;
  wire [7:0]auto_cc_to_auto_ss_k_TDATA;
  wire auto_cc_to_auto_ss_k_TLAST;
  wire auto_cc_to_auto_ss_k_TREADY;
  wire [0:0]auto_cc_to_auto_ss_k_TSTRB;
  wire [0:0]auto_cc_to_auto_ss_k_TUSER;
  wire auto_cc_to_auto_ss_k_TVALID;
  wire [7:0]auto_ss_k_to_auto_ss_slid_TDATA;
  wire [0:0]auto_ss_k_to_auto_ss_slid_TKEEP;
  wire auto_ss_k_to_auto_ss_slid_TLAST;
  wire auto_ss_k_to_auto_ss_slid_TREADY;
  wire [0:0]auto_ss_k_to_auto_ss_slid_TSTRB;
  wire [0:0]auto_ss_k_to_auto_ss_slid_TUSER;
  wire auto_ss_k_to_auto_ss_slid_TVALID;
  wire [7:0]auto_ss_slid_to_s00_couplers_TDATA;
  wire [2:0]auto_ss_slid_to_s00_couplers_TID;
  wire [0:0]auto_ss_slid_to_s00_couplers_TKEEP;
  wire auto_ss_slid_to_s00_couplers_TLAST;
  wire auto_ss_slid_to_s00_couplers_TREADY;
  wire [0:0]auto_ss_slid_to_s00_couplers_TSTRB;
  wire [0:0]auto_ss_slid_to_s00_couplers_TUSER;
  wire auto_ss_slid_to_s00_couplers_TVALID;
  wire [7:0]s00_couplers_to_auto_cc_TDATA;
  wire s00_couplers_to_auto_cc_TLAST;
  wire s00_couplers_to_auto_cc_TREADY;
  wire [0:0]s00_couplers_to_auto_cc_TSTRB;
  wire [0:0]s00_couplers_to_auto_cc_TUSER;
  wire s00_couplers_to_auto_cc_TVALID;

  assign M_AXIS_ACLK_1 = M_AXIS_ACLK;
  assign M_AXIS_ARESETN_1 = M_AXIS_ARESETN;
  assign M_AXIS_tdata[7:0] = auto_ss_slid_to_s00_couplers_TDATA;
  assign M_AXIS_tid[2:0] = auto_ss_slid_to_s00_couplers_TID;
  assign M_AXIS_tkeep[0] = auto_ss_slid_to_s00_couplers_TKEEP;
  assign M_AXIS_tlast = auto_ss_slid_to_s00_couplers_TLAST;
  assign M_AXIS_tstrb[0] = auto_ss_slid_to_s00_couplers_TSTRB;
  assign M_AXIS_tuser[0] = auto_ss_slid_to_s00_couplers_TUSER;
  assign M_AXIS_tvalid = auto_ss_slid_to_s00_couplers_TVALID;
  assign S_AXIS_ACLK_1 = S_AXIS_ACLK;
  assign S_AXIS_ARESETN_1 = S_AXIS_ARESETN;
  assign S_AXIS_tready = s00_couplers_to_auto_cc_TREADY;
  assign auto_ss_slid_to_s00_couplers_TREADY = M_AXIS_tready;
  assign s00_couplers_to_auto_cc_TDATA = S_AXIS_tdata[7:0];
  assign s00_couplers_to_auto_cc_TLAST = S_AXIS_tlast;
  assign s00_couplers_to_auto_cc_TSTRB = S_AXIS_tstrb[0];
  assign s00_couplers_to_auto_cc_TUSER = S_AXIS_tuser[0];
  assign s00_couplers_to_auto_cc_TVALID = S_AXIS_tvalid;
  test_logic_single_port_auto_cc_15 auto_cc
       (.m_axis_aclk(M_AXIS_ACLK_1),
        .m_axis_aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_cc_to_auto_ss_k_TDATA),
        .m_axis_tlast(auto_cc_to_auto_ss_k_TLAST),
        .m_axis_tready(auto_cc_to_auto_ss_k_TREADY),
        .m_axis_tstrb(auto_cc_to_auto_ss_k_TSTRB),
        .m_axis_tuser(auto_cc_to_auto_ss_k_TUSER),
        .m_axis_tvalid(auto_cc_to_auto_ss_k_TVALID),
        .s_axis_aclk(S_AXIS_ACLK_1),
        .s_axis_aresetn(S_AXIS_ARESETN_1),
        .s_axis_tdata(s00_couplers_to_auto_cc_TDATA),
        .s_axis_tlast(s00_couplers_to_auto_cc_TLAST),
        .s_axis_tready(s00_couplers_to_auto_cc_TREADY),
        .s_axis_tstrb(s00_couplers_to_auto_cc_TSTRB),
        .s_axis_tuser(s00_couplers_to_auto_cc_TUSER),
        .s_axis_tvalid(s00_couplers_to_auto_cc_TVALID));
  test_logic_single_port_auto_ss_k_9 auto_ss_k
       (.aclk(M_AXIS_ACLK_1),
        .aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_k_to_auto_ss_slid_TDATA),
        .m_axis_tkeep(auto_ss_k_to_auto_ss_slid_TKEEP),
        .m_axis_tlast(auto_ss_k_to_auto_ss_slid_TLAST),
        .m_axis_tready(auto_ss_k_to_auto_ss_slid_TREADY),
        .m_axis_tstrb(auto_ss_k_to_auto_ss_slid_TSTRB),
        .m_axis_tuser(auto_ss_k_to_auto_ss_slid_TUSER),
        .m_axis_tvalid(auto_ss_k_to_auto_ss_slid_TVALID),
        .s_axis_tdata(auto_cc_to_auto_ss_k_TDATA),
        .s_axis_tlast(auto_cc_to_auto_ss_k_TLAST),
        .s_axis_tready(auto_cc_to_auto_ss_k_TREADY),
        .s_axis_tstrb(auto_cc_to_auto_ss_k_TSTRB),
        .s_axis_tuser(auto_cc_to_auto_ss_k_TUSER),
        .s_axis_tvalid(auto_cc_to_auto_ss_k_TVALID));
  test_logic_single_port_auto_ss_slid_16 auto_ss_slid
       (.aclk(M_AXIS_ACLK_1),
        .aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_slid_to_s00_couplers_TDATA),
        .m_axis_tid(auto_ss_slid_to_s00_couplers_TID),
        .m_axis_tkeep(auto_ss_slid_to_s00_couplers_TKEEP),
        .m_axis_tlast(auto_ss_slid_to_s00_couplers_TLAST),
        .m_axis_tready(auto_ss_slid_to_s00_couplers_TREADY),
        .m_axis_tstrb(auto_ss_slid_to_s00_couplers_TSTRB),
        .m_axis_tuser(auto_ss_slid_to_s00_couplers_TUSER),
        .m_axis_tvalid(auto_ss_slid_to_s00_couplers_TVALID),
        .s_axis_tdata(auto_ss_k_to_auto_ss_slid_TDATA),
        .s_axis_tkeep(auto_ss_k_to_auto_ss_slid_TKEEP),
        .s_axis_tlast(auto_ss_k_to_auto_ss_slid_TLAST),
        .s_axis_tready(auto_ss_k_to_auto_ss_slid_TREADY),
        .s_axis_tstrb(auto_ss_k_to_auto_ss_slid_TSTRB),
        .s_axis_tuser(auto_ss_k_to_auto_ss_slid_TUSER),
        .s_axis_tvalid(auto_ss_k_to_auto_ss_slid_TVALID));
endmodule

module s01_couplers_imp_1WDE4KY
   (M_AXIS_ACLK,
    M_AXIS_ARESETN,
    M_AXIS_tdata,
    M_AXIS_tid,
    M_AXIS_tkeep,
    M_AXIS_tlast,
    M_AXIS_tready,
    M_AXIS_tstrb,
    M_AXIS_tuser,
    M_AXIS_tvalid,
    S_AXIS_ACLK,
    S_AXIS_ARESETN,
    S_AXIS_tdata,
    S_AXIS_tid,
    S_AXIS_tkeep,
    S_AXIS_tlast,
    S_AXIS_tready,
    S_AXIS_tuser,
    S_AXIS_tvalid);
  input M_AXIS_ACLK;
  input M_AXIS_ARESETN;
  output [7:0]M_AXIS_tdata;
  output [2:0]M_AXIS_tid;
  output [0:0]M_AXIS_tkeep;
  output M_AXIS_tlast;
  input M_AXIS_tready;
  output [0:0]M_AXIS_tstrb;
  output [0:0]M_AXIS_tuser;
  output M_AXIS_tvalid;
  input S_AXIS_ACLK;
  input S_AXIS_ARESETN;
  input [511:0]S_AXIS_tdata;
  input [2:0]S_AXIS_tid;
  input [63:0]S_AXIS_tkeep;
  input S_AXIS_tlast;
  output S_AXIS_tready;
  input [63:0]S_AXIS_tuser;
  input S_AXIS_tvalid;

  wire M_AXIS_ACLK_1;
  wire M_AXIS_ARESETN_1;
  wire S_AXIS_ACLK_1;
  wire S_AXIS_ARESETN_1;
  wire [511:0]auto_cc_to_auto_ds_TDATA;
  wire [2:0]auto_cc_to_auto_ds_TID;
  wire [63:0]auto_cc_to_auto_ds_TKEEP;
  wire auto_cc_to_auto_ds_TLAST;
  wire auto_cc_to_auto_ds_TREADY;
  wire [63:0]auto_cc_to_auto_ds_TUSER;
  wire auto_cc_to_auto_ds_TVALID;
  wire [7:0]auto_ds_to_auto_ss_slid_TDATA;
  wire [2:0]auto_ds_to_auto_ss_slid_TID;
  wire [0:0]auto_ds_to_auto_ss_slid_TKEEP;
  wire auto_ds_to_auto_ss_slid_TLAST;
  wire auto_ds_to_auto_ss_slid_TREADY;
  wire [0:0]auto_ds_to_auto_ss_slid_TUSER;
  wire auto_ds_to_auto_ss_slid_TVALID;
  wire [7:0]auto_ss_slid_to_s01_couplers_TDATA;
  wire [2:0]auto_ss_slid_to_s01_couplers_TID;
  wire [0:0]auto_ss_slid_to_s01_couplers_TKEEP;
  wire auto_ss_slid_to_s01_couplers_TLAST;
  wire auto_ss_slid_to_s01_couplers_TREADY;
  wire [0:0]auto_ss_slid_to_s01_couplers_TSTRB;
  wire [0:0]auto_ss_slid_to_s01_couplers_TUSER;
  wire auto_ss_slid_to_s01_couplers_TVALID;
  wire [511:0]s01_couplers_to_auto_cc_TDATA;
  wire [2:0]s01_couplers_to_auto_cc_TID;
  wire [63:0]s01_couplers_to_auto_cc_TKEEP;
  wire s01_couplers_to_auto_cc_TLAST;
  wire s01_couplers_to_auto_cc_TREADY;
  wire [63:0]s01_couplers_to_auto_cc_TUSER;
  wire s01_couplers_to_auto_cc_TVALID;

  assign M_AXIS_ACLK_1 = M_AXIS_ACLK;
  assign M_AXIS_ARESETN_1 = M_AXIS_ARESETN;
  assign M_AXIS_tdata[7:0] = auto_ss_slid_to_s01_couplers_TDATA;
  assign M_AXIS_tid[2:0] = auto_ss_slid_to_s01_couplers_TID;
  assign M_AXIS_tkeep[0] = auto_ss_slid_to_s01_couplers_TKEEP;
  assign M_AXIS_tlast = auto_ss_slid_to_s01_couplers_TLAST;
  assign M_AXIS_tstrb[0] = auto_ss_slid_to_s01_couplers_TSTRB;
  assign M_AXIS_tuser[0] = auto_ss_slid_to_s01_couplers_TUSER;
  assign M_AXIS_tvalid = auto_ss_slid_to_s01_couplers_TVALID;
  assign S_AXIS_ACLK_1 = S_AXIS_ACLK;
  assign S_AXIS_ARESETN_1 = S_AXIS_ARESETN;
  assign S_AXIS_tready = s01_couplers_to_auto_cc_TREADY;
  assign auto_ss_slid_to_s01_couplers_TREADY = M_AXIS_tready;
  assign s01_couplers_to_auto_cc_TDATA = S_AXIS_tdata[511:0];
  assign s01_couplers_to_auto_cc_TID = S_AXIS_tid[2:0];
  assign s01_couplers_to_auto_cc_TKEEP = S_AXIS_tkeep[63:0];
  assign s01_couplers_to_auto_cc_TLAST = S_AXIS_tlast;
  assign s01_couplers_to_auto_cc_TUSER = S_AXIS_tuser[63:0];
  assign s01_couplers_to_auto_cc_TVALID = S_AXIS_tvalid;
  test_logic_single_port_auto_cc_16 auto_cc
       (.m_axis_aclk(M_AXIS_ACLK_1),
        .m_axis_aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_cc_to_auto_ds_TDATA),
        .m_axis_tid(auto_cc_to_auto_ds_TID),
        .m_axis_tkeep(auto_cc_to_auto_ds_TKEEP),
        .m_axis_tlast(auto_cc_to_auto_ds_TLAST),
        .m_axis_tready(auto_cc_to_auto_ds_TREADY),
        .m_axis_tuser(auto_cc_to_auto_ds_TUSER),
        .m_axis_tvalid(auto_cc_to_auto_ds_TVALID),
        .s_axis_aclk(S_AXIS_ACLK_1),
        .s_axis_aresetn(S_AXIS_ARESETN_1),
        .s_axis_tdata(s01_couplers_to_auto_cc_TDATA),
        .s_axis_tid(s01_couplers_to_auto_cc_TID),
        .s_axis_tkeep(s01_couplers_to_auto_cc_TKEEP),
        .s_axis_tlast(s01_couplers_to_auto_cc_TLAST),
        .s_axis_tready(s01_couplers_to_auto_cc_TREADY),
        .s_axis_tuser(s01_couplers_to_auto_cc_TUSER),
        .s_axis_tvalid(s01_couplers_to_auto_cc_TVALID));
  test_logic_single_port_auto_ds_8 auto_ds
       (.aclk(M_AXIS_ACLK_1),
        .aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ds_to_auto_ss_slid_TDATA),
        .m_axis_tid(auto_ds_to_auto_ss_slid_TID),
        .m_axis_tkeep(auto_ds_to_auto_ss_slid_TKEEP),
        .m_axis_tlast(auto_ds_to_auto_ss_slid_TLAST),
        .m_axis_tready(auto_ds_to_auto_ss_slid_TREADY),
        .m_axis_tuser(auto_ds_to_auto_ss_slid_TUSER),
        .m_axis_tvalid(auto_ds_to_auto_ss_slid_TVALID),
        .s_axis_tdata(auto_cc_to_auto_ds_TDATA),
        .s_axis_tid(auto_cc_to_auto_ds_TID),
        .s_axis_tkeep(auto_cc_to_auto_ds_TKEEP),
        .s_axis_tlast(auto_cc_to_auto_ds_TLAST),
        .s_axis_tready(auto_cc_to_auto_ds_TREADY),
        .s_axis_tuser(auto_cc_to_auto_ds_TUSER),
        .s_axis_tvalid(auto_cc_to_auto_ds_TVALID));
  test_logic_single_port_auto_ss_slid_17 auto_ss_slid
       (.aclk(M_AXIS_ACLK_1),
        .aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_slid_to_s01_couplers_TDATA),
        .m_axis_tid(auto_ss_slid_to_s01_couplers_TID),
        .m_axis_tkeep(auto_ss_slid_to_s01_couplers_TKEEP),
        .m_axis_tlast(auto_ss_slid_to_s01_couplers_TLAST),
        .m_axis_tready(auto_ss_slid_to_s01_couplers_TREADY),
        .m_axis_tstrb(auto_ss_slid_to_s01_couplers_TSTRB),
        .m_axis_tuser(auto_ss_slid_to_s01_couplers_TUSER),
        .m_axis_tvalid(auto_ss_slid_to_s01_couplers_TVALID),
        .s_axis_tdata(auto_ds_to_auto_ss_slid_TDATA),
        .s_axis_tid(auto_ds_to_auto_ss_slid_TID),
        .s_axis_tkeep(auto_ds_to_auto_ss_slid_TKEEP),
        .s_axis_tlast(auto_ds_to_auto_ss_slid_TLAST),
        .s_axis_tready(auto_ds_to_auto_ss_slid_TREADY),
        .s_axis_tuser(auto_ds_to_auto_ss_slid_TUSER),
        .s_axis_tvalid(auto_ds_to_auto_ss_slid_TVALID));
endmodule

(* CORE_GENERATION_INFO = "test_logic_single_port,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=test_logic_single_port,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=51,numReposBlks=40,numNonXlnxBlks=5,numHierBlks=11,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "test_logic_single_port.hwdef" *) 
module test_logic_single_port
   (board_led,
    check_ready,
    controller_clk,
    controller_rst,
    eth_clks_glbl_rst,
    eth_clks_gt0_pll0lock_in,
    eth_clks_gt0_pll0outclk_in,
    eth_clks_gt0_pll0outrefclk_in,
    eth_clks_gt0_pll0refclklost_in,
    eth_clks_gt0_pll1outclk_in,
    eth_clks_gt0_pll1outrefclk_in,
    eth_clks_gtref_clk,
    eth_clks_gtref_clk_buf,
    eth_clks_mmcm_locked,
    eth_clks_pma_reset,
    eth_clks_ref_clk,
    eth_clks_rxuserclk,
    eth_clks_rxuserclk2,
    eth_clks_s_axi_lite_clk,
    eth_clks_s_axi_lite_resetn,
    eth_clks_userclk,
    eth_clks_userclk2,
    gen_ready,
    gt0_pll0reset_out,
    ponylink_clk,
    ponylink_clk4,
    ponylink_data,
    port_config,
    result,
    rxoutclk,
    sfp_led,
    sfp_rx_los,
    sfp_rxn,
    sfp_rxp,
    sfp_txn,
    sfp_txp,
    start,
    stop,
    txoutclk);
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.BOARD_LED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.BOARD_LED, LAYERED_METADATA undef, PortWidth 2" *) output [1:0]board_led;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.CHECK_READY DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.CHECK_READY, LAYERED_METADATA undef" *) output check_ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CONTROLLER_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CONTROLLER_CLK, ASSOCIATED_RESET controller_rst, CLK_DOMAIN test_logic_single_port_controller_clk, FREQ_HZ 33000000, INSERT_VIP 0, PHASE 0.000" *) input controller_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.CONTROLLER_RST RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.CONTROLLER_RST, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input controller_rst;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks glbl_rst" *) input eth_clks_glbl_rst;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks gt0_pll0lock_in" *) input eth_clks_gt0_pll0lock_in;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks gt0_pll0outclk_in" *) input eth_clks_gt0_pll0outclk_in;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks gt0_pll0outrefclk_in" *) input eth_clks_gt0_pll0outrefclk_in;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks gt0_pll0refclklost_in" *) input eth_clks_gt0_pll0refclklost_in;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks gt0_pll1outclk_in" *) input eth_clks_gt0_pll1outclk_in;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks gt0_pll1outrefclk_in" *) input eth_clks_gt0_pll1outrefclk_in;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks gtref_clk" *) input eth_clks_gtref_clk;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks gtref_clk_buf" *) input eth_clks_gtref_clk_buf;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks mmcm_locked" *) input eth_clks_mmcm_locked;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks pma_reset" *) input eth_clks_pma_reset;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks ref_clk" *) input eth_clks_ref_clk;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks rxuserclk" *) input eth_clks_rxuserclk;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks rxuserclk2" *) input eth_clks_rxuserclk2;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks s_axi_lite_clk" *) input eth_clks_s_axi_lite_clk;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks s_axi_lite_resetn" *) input eth_clks_s_axi_lite_resetn;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks userclk" *) input eth_clks_userclk;
  (* X_INTERFACE_INFO = "harrychen.xyz:user:axi_ethernet_clocks_resets:1.0 eth_clks userclk2" *) input eth_clks_userclk2;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.GEN_READY DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.GEN_READY, LAYERED_METADATA undef" *) output gen_ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.GT0_PLL0RESET_OUT RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.GT0_PLL0RESET_OUT, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) output gt0_pll0reset_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.PONYLINK_CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.PONYLINK_CLK, CLK_DOMAIN test_logic_single_port_ponylink_clk, FREQ_HZ 33000000, INSERT_VIP 0, PHASE 0.000" *) input ponylink_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.PONYLINK_CLK4 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.PONYLINK_CLK4, CLK_DOMAIN test_logic_single_port_ponylink_clk4, FREQ_HZ 132000000, INSERT_VIP 0, PHASE 0.000" *) input ponylink_clk4;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PONYLINK_DATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PONYLINK_DATA, LAYERED_METADATA undef" *) inout ponylink_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PORT_CONFIG DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PORT_CONFIG, LAYERED_METADATA undef" *) input [255:0]port_config;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT, LAYERED_METADATA undef" *) output [127:0]result;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.RXOUTCLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.RXOUTCLK, CLK_DOMAIN bd_f625_pcs_pma_0_rxoutclk, FREQ_HZ 62500000, INSERT_VIP 0, PHASE 0" *) output rxoutclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.SFP_LED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.SFP_LED, LAYERED_METADATA undef, PortWidth 2" *) output [1:0]sfp_led;
  input sfp_rx_los;
  (* X_INTERFACE_INFO = "xilinx.com:interface:sfp:1.0 sfp RXN" *) input sfp_rxn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:sfp:1.0 sfp RXP" *) input sfp_rxp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:sfp:1.0 sfp TXN" *) output sfp_txn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:sfp:1.0 sfp TXP" *) output sfp_txp;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.START DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.START, LAYERED_METADATA undef" *) input start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.STOP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.STOP, LAYERED_METADATA undef" *) input stop;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.TXOUTCLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.TXOUTCLK, CLK_DOMAIN bd_f625_pcs_pma_0_txoutclk, FREQ_HZ 62500000, INSERT_VIP 0, PHASE 0" *) output txoutclk;

  wire ACLK_1;
  wire M00_AXIS_ACLK_1;
  wire Net;
  wire axi_ethernet_0_sfp_RXN;
  wire axi_ethernet_0_sfp_RXP;
  wire axi_ethernet_0_sfp_TXN;
  wire axi_ethernet_0_sfp_TXP;
  wire axi_ethernet_inner_gt0_pll0reset_out;
  wire [7:0]axi_ethernet_inner_m_axis_rx_TDATA;
  wire axi_ethernet_inner_m_axis_rx_TLAST;
  wire [0:0]axi_ethernet_inner_m_axis_rx_TUSER;
  wire axi_ethernet_inner_m_axis_rx_TVALID;
  wire axi_ethernet_inner_rx_reset;
  wire axi_ethernet_inner_rxoutclk;
  wire axi_ethernet_inner_tx_reset;
  wire axi_ethernet_inner_txoutclk;
  wire axi_ethernet_inner_txoutclk1;
  (* CONN_BUS_INFO = "axis_interconnect_0_M00_AXIS1 xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [511:0]axis_interconnect_0_M00_AXIS1_TDATA;
  (* CONN_BUS_INFO = "axis_interconnect_0_M00_AXIS1 xilinx.com:interface:axis:1.0 None TID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axis_interconnect_0_M00_AXIS1_TID;
  (* CONN_BUS_INFO = "axis_interconnect_0_M00_AXIS1 xilinx.com:interface:axis:1.0 None TKEEP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [63:0]axis_interconnect_0_M00_AXIS1_TKEEP;
  (* CONN_BUS_INFO = "axis_interconnect_0_M00_AXIS1 xilinx.com:interface:axis:1.0 None TLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_interconnect_0_M00_AXIS1_TLAST;
  (* CONN_BUS_INFO = "axis_interconnect_0_M00_AXIS1 xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_interconnect_0_M00_AXIS1_TREADY;
  (* CONN_BUS_INFO = "axis_interconnect_0_M00_AXIS1 xilinx.com:interface:axis:1.0 None TUSER" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [63:0]axis_interconnect_0_M00_AXIS1_TUSER;
  (* CONN_BUS_INFO = "axis_interconnect_0_M00_AXIS1 xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_interconnect_0_M00_AXIS1_TVALID;
  wire [7:0]axis_interconnect_0_M00_AXIS_TDATA;
  wire axis_interconnect_0_M00_AXIS_TLAST;
  wire axis_interconnect_0_M00_AXIS_TREADY;
  wire [0:0]axis_interconnect_0_M00_AXIS_TUSER;
  wire axis_interconnect_0_M00_AXIS_TVALID;
  (* CONN_BUS_INFO = "axis_ix_to_ponylink_M00_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]axis_ix_to_ponylink_M00_AXIS_TDATA;
  (* CONN_BUS_INFO = "axis_ix_to_ponylink_M00_AXIS xilinx.com:interface:axis:1.0 None TLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_ix_to_ponylink_M00_AXIS_TLAST;
  (* CONN_BUS_INFO = "axis_ix_to_ponylink_M00_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_ix_to_ponylink_M00_AXIS_TREADY;
  (* CONN_BUS_INFO = "axis_ix_to_ponylink_M00_AXIS xilinx.com:interface:axis:1.0 None TUSER" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]axis_ix_to_ponylink_M00_AXIS_TUSER;
  (* CONN_BUS_INFO = "axis_ix_to_ponylink_M00_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axis_ix_to_ponylink_M00_AXIS_TVALID;
  wire [1:0]board_led_concat_dout;
  wire controller_rst_1;
  wire eth_clks_1_glbl_rst;
  wire eth_clks_1_gt0_pll0lock_in;
  wire eth_clks_1_gt0_pll0outclk_in;
  wire eth_clks_1_gt0_pll0outrefclk_in;
  wire eth_clks_1_gt0_pll0refclklost_in;
  wire eth_clks_1_gt0_pll1outclk_in;
  wire eth_clks_1_gt0_pll1outrefclk_in;
  wire eth_clks_1_gtref_clk;
  wire eth_clks_1_gtref_clk_buf;
  wire eth_clks_1_mmcm_locked;
  wire eth_clks_1_pma_reset;
  wire eth_clks_1_ref_clk;
  wire eth_clks_1_rxuserclk;
  wire eth_clks_1_rxuserclk2;
  wire eth_clks_1_s_axi_lite_clk;
  wire eth_clks_1_s_axi_lite_resetn;
  wire eth_clks_1_userclk;
  wire eth_clks_1_userclk2;
  wire [0:0]eth_rx_rst_n_Res;
  wire [0:0]eth_rx_rst_n_Res1;
  (* CONN_BUS_INFO = "fifo_to_ponylink_axis_out xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [63:0]fifo_to_ponylink_axis_out_TDATA;
  (* CONN_BUS_INFO = "fifo_to_ponylink_axis_out xilinx.com:interface:axis:1.0 None TID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]fifo_to_ponylink_axis_out_TID;
  (* CONN_BUS_INFO = "fifo_to_ponylink_axis_out xilinx.com:interface:axis:1.0 None TKEEP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]fifo_to_ponylink_axis_out_TKEEP;
  (* CONN_BUS_INFO = "fifo_to_ponylink_axis_out xilinx.com:interface:axis:1.0 None TLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire fifo_to_ponylink_axis_out_TLAST;
  (* CONN_BUS_INFO = "fifo_to_ponylink_axis_out xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire fifo_to_ponylink_axis_out_TREADY;
  (* CONN_BUS_INFO = "fifo_to_ponylink_axis_out xilinx.com:interface:axis:1.0 None TUSER" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]fifo_to_ponylink_axis_out_TUSER;
  (* CONN_BUS_INFO = "fifo_to_ponylink_axis_out xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire fifo_to_ponylink_axis_out_TVALID;
  wire [511:0]frame_checker_axis_out_TDATA;
  wire [2:0]frame_checker_axis_out_TID;
  wire [63:0]frame_checker_axis_out_TKEEP;
  wire frame_checker_axis_out_TLAST;
  wire frame_checker_axis_out_TREADY;
  wire [63:0]frame_checker_axis_out_TUSER;
  wire frame_checker_axis_out_TVALID;
  (* CONN_BUS_INFO = "frame_generator_m_axis xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [511:0]frame_generator_m_axis_TDATA;
  (* CONN_BUS_INFO = "frame_generator_m_axis xilinx.com:interface:axis:1.0 None TID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]frame_generator_m_axis_TID;
  (* CONN_BUS_INFO = "frame_generator_m_axis xilinx.com:interface:axis:1.0 None TKEEP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [63:0]frame_generator_m_axis_TKEEP;
  (* CONN_BUS_INFO = "frame_generator_m_axis xilinx.com:interface:axis:1.0 None TLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire frame_generator_m_axis_TLAST;
  (* CONN_BUS_INFO = "frame_generator_m_axis xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire frame_generator_m_axis_TREADY;
  (* CONN_BUS_INFO = "frame_generator_m_axis xilinx.com:interface:axis:1.0 None TUSER" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [63:0]frame_generator_m_axis_TUSER;
  (* CONN_BUS_INFO = "frame_generator_m_axis xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire frame_generator_m_axis_TVALID;
  wire ponylink_clk4;
  wire ponylink_clk_1;
  wire [0:0]ponylink_rst_n_Res;
  wire [7:0]ponylink_to_zynq_axis_out_TDATA;
  wire ponylink_to_zynq_axis_out_TLAST;
  wire ponylink_to_zynq_axis_out_TREADY;
  wire [0:0]ponylink_to_zynq_axis_out_TSTRB;
  wire [0:0]ponylink_to_zynq_axis_out_TUSER;
  wire ponylink_to_zynq_axis_out_TVALID;
  wire ponylink_to_zynq_linkerror;
  wire ponylink_to_zynq_linkready;
  wire ponylink_to_zynq_mode_recv;
  wire ponylink_to_zynq_mode_send;
  wire ponylink_to_zynq_resetn_out;
  wire [255:0]port_config_1;
  (* CONN_BUS_INFO = "rx_width_upsizer1_M_AXIS xilinx.com:interface:axis:1.0 None TDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [63:0]rx_width_upsizer1_M_AXIS_TDATA;
  (* CONN_BUS_INFO = "rx_width_upsizer1_M_AXIS xilinx.com:interface:axis:1.0 None TID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]rx_width_upsizer1_M_AXIS_TID;
  (* CONN_BUS_INFO = "rx_width_upsizer1_M_AXIS xilinx.com:interface:axis:1.0 None TKEEP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]rx_width_upsizer1_M_AXIS_TKEEP;
  (* CONN_BUS_INFO = "rx_width_upsizer1_M_AXIS xilinx.com:interface:axis:1.0 None TLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire rx_width_upsizer1_M_AXIS_TLAST;
  (* CONN_BUS_INFO = "rx_width_upsizer1_M_AXIS xilinx.com:interface:axis:1.0 None TREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire rx_width_upsizer1_M_AXIS_TREADY;
  (* CONN_BUS_INFO = "rx_width_upsizer1_M_AXIS xilinx.com:interface:axis:1.0 None TUSER" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]rx_width_upsizer1_M_AXIS_TUSER;
  (* CONN_BUS_INFO = "rx_width_upsizer1_M_AXIS xilinx.com:interface:axis:1.0 None TVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire rx_width_upsizer1_M_AXIS_TVALID;
  wire [1:0]sfp_led_concat_dout;
  wire sfp_rx_los_1;
  wire start_1;
  wire stop_1;
  wire tanlabs_frame_checker_0_ready;
  wire [127:0]tanlabs_frame_checker_0_result;
  wire tanlabs_frame_genera_0_ready;
  wire [0:0]util_vector_logic_0_Res;
  wire [0:0]util_vector_logic_1_Res;
  wire [7:0]xlconstant_0_dout;

  assign axi_ethernet_0_sfp_RXN = sfp_rxn;
  assign axi_ethernet_0_sfp_RXP = sfp_rxp;
  assign axi_ethernet_inner_txoutclk = controller_clk;
  assign board_led[1:0] = board_led_concat_dout;
  assign check_ready = tanlabs_frame_checker_0_ready;
  assign controller_rst_1 = controller_rst;
  assign eth_clks_1_glbl_rst = eth_clks_glbl_rst;
  assign eth_clks_1_gt0_pll0lock_in = eth_clks_gt0_pll0lock_in;
  assign eth_clks_1_gt0_pll0outclk_in = eth_clks_gt0_pll0outclk_in;
  assign eth_clks_1_gt0_pll0outrefclk_in = eth_clks_gt0_pll0outrefclk_in;
  assign eth_clks_1_gt0_pll0refclklost_in = eth_clks_gt0_pll0refclklost_in;
  assign eth_clks_1_gt0_pll1outclk_in = eth_clks_gt0_pll1outclk_in;
  assign eth_clks_1_gt0_pll1outrefclk_in = eth_clks_gt0_pll1outrefclk_in;
  assign eth_clks_1_gtref_clk = eth_clks_gtref_clk;
  assign eth_clks_1_gtref_clk_buf = eth_clks_gtref_clk_buf;
  assign eth_clks_1_mmcm_locked = eth_clks_mmcm_locked;
  assign eth_clks_1_pma_reset = eth_clks_pma_reset;
  assign eth_clks_1_ref_clk = eth_clks_ref_clk;
  assign eth_clks_1_rxuserclk = eth_clks_rxuserclk;
  assign eth_clks_1_rxuserclk2 = eth_clks_rxuserclk2;
  assign eth_clks_1_s_axi_lite_clk = eth_clks_s_axi_lite_clk;
  assign eth_clks_1_s_axi_lite_resetn = eth_clks_s_axi_lite_resetn;
  assign eth_clks_1_userclk = eth_clks_userclk;
  assign eth_clks_1_userclk2 = eth_clks_userclk2;
  assign gen_ready = tanlabs_frame_genera_0_ready;
  assign gt0_pll0reset_out = axi_ethernet_inner_gt0_pll0reset_out;
  assign ponylink_clk_1 = ponylink_clk;
  assign port_config_1 = port_config[255:0];
  assign result[127:0] = tanlabs_frame_checker_0_result;
  assign rxoutclk = axi_ethernet_inner_rxoutclk;
  assign sfp_led[1:0] = sfp_led_concat_dout;
  assign sfp_rx_los_1 = sfp_rx_los;
  assign sfp_txn = axi_ethernet_0_sfp_TXN;
  assign sfp_txp = axi_ethernet_0_sfp_TXP;
  assign start_1 = start;
  assign stop_1 = stop;
  assign txoutclk = axi_ethernet_inner_txoutclk1;
  axi_ethernet_inner_imp_10ZZ3JK axi_ethernet_inner
       (.ethernet_clks_glbl_rst(eth_clks_1_glbl_rst),
        .ethernet_clks_gt0_pll0lock_in(eth_clks_1_gt0_pll0lock_in),
        .ethernet_clks_gt0_pll0outclk_in(eth_clks_1_gt0_pll0outclk_in),
        .ethernet_clks_gt0_pll0outrefclk_in(eth_clks_1_gt0_pll0outrefclk_in),
        .ethernet_clks_gt0_pll0refclklost_in(eth_clks_1_gt0_pll0refclklost_in),
        .ethernet_clks_gt0_pll1outclk_in(eth_clks_1_gt0_pll1outclk_in),
        .ethernet_clks_gt0_pll1outrefclk_in(eth_clks_1_gt0_pll1outrefclk_in),
        .ethernet_clks_gtref_clk(eth_clks_1_gtref_clk),
        .ethernet_clks_gtref_clk_buf(eth_clks_1_gtref_clk_buf),
        .ethernet_clks_mmcm_locked(eth_clks_1_mmcm_locked),
        .ethernet_clks_pma_reset(eth_clks_1_pma_reset),
        .ethernet_clks_ref_clk(eth_clks_1_ref_clk),
        .ethernet_clks_rxuserclk(eth_clks_1_rxuserclk),
        .ethernet_clks_rxuserclk2(eth_clks_1_rxuserclk2),
        .ethernet_clks_s_axi_lite_clk(eth_clks_1_s_axi_lite_clk),
        .ethernet_clks_s_axi_lite_resetn(eth_clks_1_s_axi_lite_resetn),
        .ethernet_clks_userclk(eth_clks_1_userclk),
        .ethernet_clks_userclk2(eth_clks_1_userclk2),
        .gt0_pll0reset_out(axi_ethernet_inner_gt0_pll0reset_out),
        .m_axis_rx_tdata(axi_ethernet_inner_m_axis_rx_TDATA),
        .m_axis_rx_tlast(axi_ethernet_inner_m_axis_rx_TLAST),
        .m_axis_rx_tuser(axi_ethernet_inner_m_axis_rx_TUSER),
        .m_axis_rx_tvalid(axi_ethernet_inner_m_axis_rx_TVALID),
        .rx_mac_aclk(ACLK_1),
        .rxoutclk(axi_ethernet_inner_rxoutclk),
        .s_axis_tx_tdata(axis_interconnect_0_M00_AXIS_TDATA),
        .s_axis_tx_tlast(axis_interconnect_0_M00_AXIS_TLAST),
        .s_axis_tx_tready(axis_interconnect_0_M00_AXIS_TREADY),
        .s_axis_tx_tuser(axis_interconnect_0_M00_AXIS_TUSER),
        .s_axis_tx_tvalid(axis_interconnect_0_M00_AXIS_TVALID),
        .sfp_rxn(axi_ethernet_0_sfp_RXN),
        .sfp_rxp(axi_ethernet_0_sfp_RXP),
        .sfp_txn(axi_ethernet_0_sfp_TXN),
        .sfp_txp(axi_ethernet_0_sfp_TXP),
        .signal_detect(util_vector_logic_0_Res),
        .tx_mac_aclk(M00_AXIS_ACLK_1),
        .tx_reset(axi_ethernet_inner_tx_reset),
        .txoutclk(axi_ethernet_inner_txoutclk1));
  test_logic_single_port_axis_ix_to_eth_7 axis_ix_to_eth
       (.ACLK(M00_AXIS_ACLK_1),
        .ARESETN(util_vector_logic_1_Res),
        .M00_AXIS_ACLK(M00_AXIS_ACLK_1),
        .M00_AXIS_ARESETN(util_vector_logic_1_Res),
        .M00_AXIS_tdata(axis_interconnect_0_M00_AXIS_TDATA),
        .M00_AXIS_tlast(axis_interconnect_0_M00_AXIS_TLAST),
        .M00_AXIS_tready(axis_interconnect_0_M00_AXIS_TREADY),
        .M00_AXIS_tuser(axis_interconnect_0_M00_AXIS_TUSER),
        .M00_AXIS_tvalid(axis_interconnect_0_M00_AXIS_TVALID),
        .S00_ARB_REQ_SUPPRESS(1'b0),
        .S00_AXIS_ACLK(ponylink_clk_1),
        .S00_AXIS_ARESETN(ponylink_rst_n_Res),
        .S00_AXIS_tdata(ponylink_to_zynq_axis_out_TDATA),
        .S00_AXIS_tlast(ponylink_to_zynq_axis_out_TLAST),
        .S00_AXIS_tready(ponylink_to_zynq_axis_out_TREADY),
        .S00_AXIS_tstrb(ponylink_to_zynq_axis_out_TSTRB),
        .S00_AXIS_tuser(ponylink_to_zynq_axis_out_TUSER),
        .S00_AXIS_tvalid(ponylink_to_zynq_axis_out_TVALID),
        .S01_ARB_REQ_SUPPRESS(1'b0),
        .S01_AXIS_ACLK(axi_ethernet_inner_txoutclk),
        .S01_AXIS_ARESETN(eth_rx_rst_n_Res),
        .S01_AXIS_tdata(frame_generator_m_axis_TDATA),
        .S01_AXIS_tid(frame_generator_m_axis_TID),
        .S01_AXIS_tkeep(frame_generator_m_axis_TKEEP),
        .S01_AXIS_tlast(frame_generator_m_axis_TLAST),
        .S01_AXIS_tready(frame_generator_m_axis_TREADY),
        .S01_AXIS_tuser(frame_generator_m_axis_TUSER),
        .S01_AXIS_tvalid(frame_generator_m_axis_TVALID));
  test_logic_single_port_axis_ix_to_ponylink_2 axis_ix_to_ponylink
       (.ACLK(axi_ethernet_inner_txoutclk),
        .ARESETN(eth_rx_rst_n_Res),
        .M00_AXIS_ACLK(ponylink_clk_1),
        .M00_AXIS_ARESETN(ponylink_rst_n_Res),
        .M00_AXIS_tdata(axis_ix_to_ponylink_M00_AXIS_TDATA),
        .M00_AXIS_tlast(axis_ix_to_ponylink_M00_AXIS_TLAST),
        .M00_AXIS_tready(axis_ix_to_ponylink_M00_AXIS_TREADY),
        .M00_AXIS_tuser(axis_ix_to_ponylink_M00_AXIS_TUSER),
        .M00_AXIS_tvalid(axis_ix_to_ponylink_M00_AXIS_TVALID),
        .S00_AXIS_ACLK(axi_ethernet_inner_txoutclk),
        .S00_AXIS_ARESETN(eth_rx_rst_n_Res),
        .S00_AXIS_tdata(fifo_to_ponylink_axis_out_TDATA),
        .S00_AXIS_tid(fifo_to_ponylink_axis_out_TID),
        .S00_AXIS_tkeep(fifo_to_ponylink_axis_out_TKEEP),
        .S00_AXIS_tlast(fifo_to_ponylink_axis_out_TLAST),
        .S00_AXIS_tready(fifo_to_ponylink_axis_out_TREADY),
        .S00_AXIS_tuser(fifo_to_ponylink_axis_out_TUSER),
        .S00_AXIS_tvalid(fifo_to_ponylink_axis_out_TVALID));
  test_logic_single_port_board_led_concat_7 board_led_concat
       (.In0(ponylink_to_zynq_linkready),
        .In1(ponylink_to_zynq_linkerror),
        .dout(board_led_concat_dout));
  controller_rst_sync_imp_1C5CXKN controller_rst_sync
       (.clk(axi_ethernet_inner_txoutclk),
        .rst_in(controller_rst_1),
        .rst_n_out(eth_rx_rst_n_Res),
        .rst_out(axi_ethernet_inner_rx_reset));
  test_logic_single_port_eth_rx_ix_7 eth_rx_ix
       (.ACLK(ACLK_1),
        .ARESETN(eth_rx_rst_n_Res1),
        .M00_AXIS_ACLK(axi_ethernet_inner_txoutclk),
        .M00_AXIS_ARESETN(eth_rx_rst_n_Res),
        .M00_AXIS_tdata(axis_interconnect_0_M00_AXIS1_TDATA),
        .M00_AXIS_tid(axis_interconnect_0_M00_AXIS1_TID),
        .M00_AXIS_tkeep(axis_interconnect_0_M00_AXIS1_TKEEP),
        .M00_AXIS_tlast(axis_interconnect_0_M00_AXIS1_TLAST),
        .M00_AXIS_tready(axis_interconnect_0_M00_AXIS1_TREADY),
        .M00_AXIS_tuser(axis_interconnect_0_M00_AXIS1_TUSER),
        .M00_AXIS_tvalid(axis_interconnect_0_M00_AXIS1_TVALID),
        .S00_AXIS_ACLK(ACLK_1),
        .S00_AXIS_ARESETN(eth_rx_rst_n_Res1),
        .S00_AXIS_tdata(axi_ethernet_inner_m_axis_rx_TDATA),
        .S00_AXIS_tlast(axi_ethernet_inner_m_axis_rx_TLAST),
        .S00_AXIS_tuser(axi_ethernet_inner_m_axis_rx_TUSER),
        .S00_AXIS_tvalid(axi_ethernet_inner_m_axis_rx_TVALID));
  test_logic_single_port_eth_rx_rst_n_7 eth_rx_rst_n
       (.Op1(1'b0),
        .Res(eth_rx_rst_n_Res1));
  test_logic_single_port_eth_tx_rst_n_8 eth_tx_rst_n
       (.Op1(axi_ethernet_inner_tx_reset),
        .Res(util_vector_logic_1_Res));
  test_logic_single_port_fifo_to_ponylink_7 fifo_to_ponylink
       (.clk(axi_ethernet_inner_txoutclk),
        .m_data(fifo_to_ponylink_axis_out_TDATA),
        .m_id(fifo_to_ponylink_axis_out_TID),
        .m_keep(fifo_to_ponylink_axis_out_TKEEP),
        .m_last(fifo_to_ponylink_axis_out_TLAST),
        .m_ready(fifo_to_ponylink_axis_out_TREADY),
        .m_user(fifo_to_ponylink_axis_out_TUSER),
        .m_valid(fifo_to_ponylink_axis_out_TVALID),
        .reset(axi_ethernet_inner_rx_reset),
        .s_data(rx_width_upsizer1_M_AXIS_TDATA),
        .s_id(rx_width_upsizer1_M_AXIS_TID),
        .s_keep(rx_width_upsizer1_M_AXIS_TKEEP),
        .s_last(rx_width_upsizer1_M_AXIS_TLAST),
        .s_ready(rx_width_upsizer1_M_AXIS_TREADY),
        .s_user(rx_width_upsizer1_M_AXIS_TUSER),
        .s_valid(rx_width_upsizer1_M_AXIS_TVALID));
  test_logic_single_port_frame_checker_8 frame_checker
       (.axis_m_data(frame_checker_axis_out_TDATA),
        .axis_m_id(frame_checker_axis_out_TID),
        .axis_m_keep(frame_checker_axis_out_TKEEP),
        .axis_m_last(frame_checker_axis_out_TLAST),
        .axis_m_ready(frame_checker_axis_out_TREADY),
        .axis_m_user(frame_checker_axis_out_TUSER),
        .axis_m_valid(frame_checker_axis_out_TVALID),
        .axis_s_data(axis_interconnect_0_M00_AXIS1_TDATA),
        .axis_s_id(axis_interconnect_0_M00_AXIS1_TID),
        .axis_s_keep(axis_interconnect_0_M00_AXIS1_TKEEP),
        .axis_s_last(axis_interconnect_0_M00_AXIS1_TLAST),
        .axis_s_ready(axis_interconnect_0_M00_AXIS1_TREADY),
        .axis_s_user(axis_interconnect_0_M00_AXIS1_TUSER),
        .axis_s_valid(axis_interconnect_0_M00_AXIS1_TVALID),
        .clk(axi_ethernet_inner_txoutclk),
        .ready(tanlabs_frame_checker_0_ready),
        .result(tanlabs_frame_checker_0_result),
        .rst(axi_ethernet_inner_rx_reset),
        .start(start_1),
        .stop(stop_1));
  test_logic_single_port_frame_generator_8 frame_generator
       (.axis_m_data(frame_generator_m_axis_TDATA),
        .axis_m_id(frame_generator_m_axis_TID),
        .axis_m_keep(frame_generator_m_axis_TKEEP),
        .axis_m_last(frame_generator_m_axis_TLAST),
        .axis_m_ready(frame_generator_m_axis_TREADY),
        .axis_m_user(frame_generator_m_axis_TUSER),
        .axis_m_valid(frame_generator_m_axis_TVALID),
        .clk(axi_ethernet_inner_txoutclk),
        .port_config(port_config_1),
        .ready(tanlabs_frame_genera_0_ready),
        .rst(axi_ethernet_inner_rx_reset),
        .start(start_1),
        .stop(stop_1));
  ponylink_rst_sync_imp_1DHYSZS ponylink_rst_sync
       (.clk(ponylink_clk_1),
        .rst_n_in(ponylink_to_zynq_resetn_out),
        .rst_n_out(ponylink_rst_n_Res));
  test_logic_single_port_ponylink_to_zynq_6 ponylink_to_zynq
       (.axis_in_tdata(axis_ix_to_ponylink_M00_AXIS_TDATA),
        .axis_in_tlast(axis_ix_to_ponylink_M00_AXIS_TLAST),
        .axis_in_tready(axis_ix_to_ponylink_M00_AXIS_TREADY),
        .axis_in_tuser(axis_ix_to_ponylink_M00_AXIS_TUSER),
        .axis_in_tvalid(axis_ix_to_ponylink_M00_AXIS_TVALID),
        .axis_out_tdata(ponylink_to_zynq_axis_out_TDATA),
        .axis_out_tlast(ponylink_to_zynq_axis_out_TLAST),
        .axis_out_tready(ponylink_to_zynq_axis_out_TREADY),
        .axis_out_tstrb(ponylink_to_zynq_axis_out_TSTRB),
        .axis_out_tuser(ponylink_to_zynq_axis_out_TUSER),
        .axis_out_tvalid(ponylink_to_zynq_axis_out_TVALID),
        .clk(ponylink_clk_1),
        .clk4(ponylink_clk4),
        .data_pin(ponylink_data),
        .gpio_i(xlconstant_0_dout),
        .linkerror(ponylink_to_zynq_linkerror),
        .linkready(ponylink_to_zynq_linkready),
        .mode_recv(ponylink_to_zynq_mode_recv),
        .mode_send(ponylink_to_zynq_mode_send),
        .resetn_out(ponylink_to_zynq_resetn_out));
  test_logic_single_port_rx_width_downsizer_6 rx_width_downsizer
       (.aclk(axi_ethernet_inner_txoutclk),
        .aresetn(eth_rx_rst_n_Res),
        .m_axis_tdata(rx_width_upsizer1_M_AXIS_TDATA),
        .m_axis_tid(rx_width_upsizer1_M_AXIS_TID),
        .m_axis_tkeep(rx_width_upsizer1_M_AXIS_TKEEP),
        .m_axis_tlast(rx_width_upsizer1_M_AXIS_TLAST),
        .m_axis_tready(rx_width_upsizer1_M_AXIS_TREADY),
        .m_axis_tuser(rx_width_upsizer1_M_AXIS_TUSER),
        .m_axis_tvalid(rx_width_upsizer1_M_AXIS_TVALID),
        .s_axis_tdata(frame_checker_axis_out_TDATA),
        .s_axis_tid(frame_checker_axis_out_TID),
        .s_axis_tkeep(frame_checker_axis_out_TKEEP),
        .s_axis_tlast(frame_checker_axis_out_TLAST),
        .s_axis_tready(frame_checker_axis_out_TREADY),
        .s_axis_tuser(frame_checker_axis_out_TUSER),
        .s_axis_tvalid(frame_checker_axis_out_TVALID));
  test_logic_single_port_sfp_led_concat_7 sfp_led_concat
       (.In0(ponylink_to_zynq_mode_send),
        .In1(ponylink_to_zynq_mode_recv),
        .dout(sfp_led_concat_dout));
  test_logic_single_port_sfp_rx_los_n_8 sfp_rx_los_n
       (.Op1(sfp_rx_los_1),
        .Res(util_vector_logic_0_Res));
  test_logic_single_port_system_ila_userclk_0 system_ila_ponylink_clk
       (.SLOT_0_AXIS_tdata(axis_ix_to_ponylink_M00_AXIS_TDATA),
        .SLOT_0_AXIS_tlast(axis_ix_to_ponylink_M00_AXIS_TLAST),
        .SLOT_0_AXIS_tready(axis_ix_to_ponylink_M00_AXIS_TREADY),
        .SLOT_0_AXIS_tuser(axis_ix_to_ponylink_M00_AXIS_TUSER),
        .SLOT_0_AXIS_tvalid(axis_ix_to_ponylink_M00_AXIS_TVALID),
        .clk(ponylink_clk_1),
        .resetn(ponylink_rst_n_Res));
  test_logic_single_port_system_ila_0_1 system_ila_userclk
       (.SLOT_0_AXIS_tdata(frame_generator_m_axis_TDATA),
        .SLOT_0_AXIS_tid(frame_generator_m_axis_TID),
        .SLOT_0_AXIS_tkeep(frame_generator_m_axis_TKEEP),
        .SLOT_0_AXIS_tlast(frame_generator_m_axis_TLAST),
        .SLOT_0_AXIS_tready(frame_generator_m_axis_TREADY),
        .SLOT_0_AXIS_tuser(frame_generator_m_axis_TUSER),
        .SLOT_0_AXIS_tvalid(frame_generator_m_axis_TVALID),
        .SLOT_1_AXIS_tdata(axis_interconnect_0_M00_AXIS1_TDATA),
        .SLOT_1_AXIS_tid(axis_interconnect_0_M00_AXIS1_TID),
        .SLOT_1_AXIS_tkeep(axis_interconnect_0_M00_AXIS1_TKEEP),
        .SLOT_1_AXIS_tlast(axis_interconnect_0_M00_AXIS1_TLAST),
        .SLOT_1_AXIS_tready(axis_interconnect_0_M00_AXIS1_TREADY),
        .SLOT_1_AXIS_tuser(axis_interconnect_0_M00_AXIS1_TUSER),
        .SLOT_1_AXIS_tvalid(axis_interconnect_0_M00_AXIS1_TVALID),
        .SLOT_2_AXIS_tdata(rx_width_upsizer1_M_AXIS_TDATA),
        .SLOT_2_AXIS_tid(rx_width_upsizer1_M_AXIS_TID),
        .SLOT_2_AXIS_tkeep(rx_width_upsizer1_M_AXIS_TKEEP),
        .SLOT_2_AXIS_tlast(rx_width_upsizer1_M_AXIS_TLAST),
        .SLOT_2_AXIS_tready(rx_width_upsizer1_M_AXIS_TREADY),
        .SLOT_2_AXIS_tuser(rx_width_upsizer1_M_AXIS_TUSER),
        .SLOT_2_AXIS_tvalid(rx_width_upsizer1_M_AXIS_TVALID),
        .SLOT_3_AXIS_tdata(fifo_to_ponylink_axis_out_TDATA),
        .SLOT_3_AXIS_tid(fifo_to_ponylink_axis_out_TID),
        .SLOT_3_AXIS_tkeep(fifo_to_ponylink_axis_out_TKEEP),
        .SLOT_3_AXIS_tlast(fifo_to_ponylink_axis_out_TLAST),
        .SLOT_3_AXIS_tready(fifo_to_ponylink_axis_out_TREADY),
        .SLOT_3_AXIS_tuser(fifo_to_ponylink_axis_out_TUSER),
        .SLOT_3_AXIS_tvalid(fifo_to_ponylink_axis_out_TVALID),
        .clk(axi_ethernet_inner_txoutclk),
        .resetn(eth_rx_rst_n_Res));
  test_logic_single_port_xlconstant_0_15 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule

module test_logic_single_port_axis_ix_to_eth_7
   (ACLK,
    ARESETN,
    M00_AXIS_ACLK,
    M00_AXIS_ARESETN,
    M00_AXIS_tdata,
    M00_AXIS_tlast,
    M00_AXIS_tready,
    M00_AXIS_tuser,
    M00_AXIS_tvalid,
    S00_ARB_REQ_SUPPRESS,
    S00_AXIS_ACLK,
    S00_AXIS_ARESETN,
    S00_AXIS_tdata,
    S00_AXIS_tlast,
    S00_AXIS_tready,
    S00_AXIS_tstrb,
    S00_AXIS_tuser,
    S00_AXIS_tvalid,
    S01_ARB_REQ_SUPPRESS,
    S01_AXIS_ACLK,
    S01_AXIS_ARESETN,
    S01_AXIS_tdata,
    S01_AXIS_tid,
    S01_AXIS_tkeep,
    S01_AXIS_tlast,
    S01_AXIS_tready,
    S01_AXIS_tuser,
    S01_AXIS_tvalid);
  input ACLK;
  input ARESETN;
  input M00_AXIS_ACLK;
  input M00_AXIS_ARESETN;
  output [7:0]M00_AXIS_tdata;
  output M00_AXIS_tlast;
  input M00_AXIS_tready;
  output [0:0]M00_AXIS_tuser;
  output M00_AXIS_tvalid;
  input S00_ARB_REQ_SUPPRESS;
  input S00_AXIS_ACLK;
  input S00_AXIS_ARESETN;
  input [7:0]S00_AXIS_tdata;
  input S00_AXIS_tlast;
  output S00_AXIS_tready;
  input [0:0]S00_AXIS_tstrb;
  input [0:0]S00_AXIS_tuser;
  input S00_AXIS_tvalid;
  input S01_ARB_REQ_SUPPRESS;
  input S01_AXIS_ACLK;
  input S01_AXIS_ARESETN;
  input [511:0]S01_AXIS_tdata;
  input [2:0]S01_AXIS_tid;
  input [63:0]S01_AXIS_tkeep;
  input S01_AXIS_tlast;
  output S01_AXIS_tready;
  input [63:0]S01_AXIS_tuser;
  input S01_AXIS_tvalid;

  wire M00_AXIS_ACLK_1;
  wire M00_AXIS_ARESETN_1;
  wire S00_AXIS_ACLK_1;
  wire S00_AXIS_ARESETN_1;
  wire S01_AXIS_ACLK_1;
  wire S01_AXIS_ARESETN_1;
  wire axis_ix_to_eth_ACLK_net;
  wire axis_ix_to_eth_ARESETN_net;
  wire [7:0]axis_ix_to_eth_to_s00_couplers_TDATA;
  wire axis_ix_to_eth_to_s00_couplers_TLAST;
  wire axis_ix_to_eth_to_s00_couplers_TREADY;
  wire [0:0]axis_ix_to_eth_to_s00_couplers_TSTRB;
  wire [0:0]axis_ix_to_eth_to_s00_couplers_TUSER;
  wire axis_ix_to_eth_to_s00_couplers_TVALID;
  wire [511:0]axis_ix_to_eth_to_s01_couplers_TDATA;
  wire [2:0]axis_ix_to_eth_to_s01_couplers_TID;
  wire [63:0]axis_ix_to_eth_to_s01_couplers_TKEEP;
  wire axis_ix_to_eth_to_s01_couplers_TLAST;
  wire axis_ix_to_eth_to_s01_couplers_TREADY;
  wire [63:0]axis_ix_to_eth_to_s01_couplers_TUSER;
  wire axis_ix_to_eth_to_s01_couplers_TVALID;
  wire [7:0]m00_couplers_to_axis_ix_to_eth_TDATA;
  wire m00_couplers_to_axis_ix_to_eth_TLAST;
  wire m00_couplers_to_axis_ix_to_eth_TREADY;
  wire [0:0]m00_couplers_to_axis_ix_to_eth_TUSER;
  wire m00_couplers_to_axis_ix_to_eth_TVALID;
  wire s00_arb_req_suppress_to_s_arb_req_suppress_concat;
  wire [7:0]s00_couplers_to_xbar_TDATA;
  wire [2:0]s00_couplers_to_xbar_TID;
  wire [0:0]s00_couplers_to_xbar_TKEEP;
  wire s00_couplers_to_xbar_TLAST;
  wire [0:0]s00_couplers_to_xbar_TREADY;
  wire [0:0]s00_couplers_to_xbar_TSTRB;
  wire [0:0]s00_couplers_to_xbar_TUSER;
  wire s00_couplers_to_xbar_TVALID;
  wire s01_arb_req_suppress_to_s_arb_req_suppress_concat;
  wire [7:0]s01_couplers_to_xbar_TDATA;
  wire [2:0]s01_couplers_to_xbar_TID;
  wire [0:0]s01_couplers_to_xbar_TKEEP;
  wire s01_couplers_to_xbar_TLAST;
  wire [1:1]s01_couplers_to_xbar_TREADY;
  wire [0:0]s01_couplers_to_xbar_TSTRB;
  wire [0:0]s01_couplers_to_xbar_TUSER;
  wire s01_couplers_to_xbar_TVALID;
  wire [1:0]s_arb_req_suppress_concat_dout;
  wire [7:0]xbar_to_m00_couplers_TDATA;
  wire [2:0]xbar_to_m00_couplers_TID;
  wire [0:0]xbar_to_m00_couplers_TKEEP;
  wire [0:0]xbar_to_m00_couplers_TLAST;
  wire xbar_to_m00_couplers_TREADY;
  wire [0:0]xbar_to_m00_couplers_TSTRB;
  wire [0:0]xbar_to_m00_couplers_TUSER;
  wire [0:0]xbar_to_m00_couplers_TVALID;

  assign M00_AXIS_ACLK_1 = M00_AXIS_ACLK;
  assign M00_AXIS_ARESETN_1 = M00_AXIS_ARESETN;
  assign M00_AXIS_tdata[7:0] = m00_couplers_to_axis_ix_to_eth_TDATA;
  assign M00_AXIS_tlast = m00_couplers_to_axis_ix_to_eth_TLAST;
  assign M00_AXIS_tuser[0] = m00_couplers_to_axis_ix_to_eth_TUSER;
  assign M00_AXIS_tvalid = m00_couplers_to_axis_ix_to_eth_TVALID;
  assign S00_AXIS_ACLK_1 = S00_AXIS_ACLK;
  assign S00_AXIS_ARESETN_1 = S00_AXIS_ARESETN;
  assign S00_AXIS_tready = axis_ix_to_eth_to_s00_couplers_TREADY;
  assign S01_AXIS_ACLK_1 = S01_AXIS_ACLK;
  assign S01_AXIS_ARESETN_1 = S01_AXIS_ARESETN;
  assign S01_AXIS_tready = axis_ix_to_eth_to_s01_couplers_TREADY;
  assign axis_ix_to_eth_ACLK_net = ACLK;
  assign axis_ix_to_eth_ARESETN_net = ARESETN;
  assign axis_ix_to_eth_to_s00_couplers_TDATA = S00_AXIS_tdata[7:0];
  assign axis_ix_to_eth_to_s00_couplers_TLAST = S00_AXIS_tlast;
  assign axis_ix_to_eth_to_s00_couplers_TSTRB = S00_AXIS_tstrb[0];
  assign axis_ix_to_eth_to_s00_couplers_TUSER = S00_AXIS_tuser[0];
  assign axis_ix_to_eth_to_s00_couplers_TVALID = S00_AXIS_tvalid;
  assign axis_ix_to_eth_to_s01_couplers_TDATA = S01_AXIS_tdata[511:0];
  assign axis_ix_to_eth_to_s01_couplers_TID = S01_AXIS_tid[2:0];
  assign axis_ix_to_eth_to_s01_couplers_TKEEP = S01_AXIS_tkeep[63:0];
  assign axis_ix_to_eth_to_s01_couplers_TLAST = S01_AXIS_tlast;
  assign axis_ix_to_eth_to_s01_couplers_TUSER = S01_AXIS_tuser[63:0];
  assign axis_ix_to_eth_to_s01_couplers_TVALID = S01_AXIS_tvalid;
  assign m00_couplers_to_axis_ix_to_eth_TREADY = M00_AXIS_tready;
  assign s00_arb_req_suppress_to_s_arb_req_suppress_concat = S00_ARB_REQ_SUPPRESS;
  assign s01_arb_req_suppress_to_s_arb_req_suppress_concat = S01_ARB_REQ_SUPPRESS;
  m00_couplers_imp_1S0P32 m00_couplers
       (.M_AXIS_ACLK(M00_AXIS_ACLK_1),
        .M_AXIS_ARESETN(M00_AXIS_ARESETN_1),
        .M_AXIS_tdata(m00_couplers_to_axis_ix_to_eth_TDATA),
        .M_AXIS_tlast(m00_couplers_to_axis_ix_to_eth_TLAST),
        .M_AXIS_tready(m00_couplers_to_axis_ix_to_eth_TREADY),
        .M_AXIS_tuser(m00_couplers_to_axis_ix_to_eth_TUSER),
        .M_AXIS_tvalid(m00_couplers_to_axis_ix_to_eth_TVALID),
        .S_AXIS_ACLK(axis_ix_to_eth_ACLK_net),
        .S_AXIS_ARESETN(axis_ix_to_eth_ARESETN_net),
        .S_AXIS_tdata(xbar_to_m00_couplers_TDATA),
        .S_AXIS_tid(xbar_to_m00_couplers_TID),
        .S_AXIS_tkeep(xbar_to_m00_couplers_TKEEP),
        .S_AXIS_tlast(xbar_to_m00_couplers_TLAST),
        .S_AXIS_tready(xbar_to_m00_couplers_TREADY),
        .S_AXIS_tstrb(xbar_to_m00_couplers_TSTRB),
        .S_AXIS_tuser(xbar_to_m00_couplers_TUSER),
        .S_AXIS_tvalid(xbar_to_m00_couplers_TVALID));
  s00_couplers_imp_24TIC8 s00_couplers
       (.M_AXIS_ACLK(axis_ix_to_eth_ACLK_net),
        .M_AXIS_ARESETN(axis_ix_to_eth_ARESETN_net),
        .M_AXIS_tdata(s00_couplers_to_xbar_TDATA),
        .M_AXIS_tid(s00_couplers_to_xbar_TID),
        .M_AXIS_tkeep(s00_couplers_to_xbar_TKEEP),
        .M_AXIS_tlast(s00_couplers_to_xbar_TLAST),
        .M_AXIS_tready(s00_couplers_to_xbar_TREADY),
        .M_AXIS_tstrb(s00_couplers_to_xbar_TSTRB),
        .M_AXIS_tuser(s00_couplers_to_xbar_TUSER),
        .M_AXIS_tvalid(s00_couplers_to_xbar_TVALID),
        .S_AXIS_ACLK(S00_AXIS_ACLK_1),
        .S_AXIS_ARESETN(S00_AXIS_ARESETN_1),
        .S_AXIS_tdata(axis_ix_to_eth_to_s00_couplers_TDATA),
        .S_AXIS_tlast(axis_ix_to_eth_to_s00_couplers_TLAST),
        .S_AXIS_tready(axis_ix_to_eth_to_s00_couplers_TREADY),
        .S_AXIS_tstrb(axis_ix_to_eth_to_s00_couplers_TSTRB),
        .S_AXIS_tuser(axis_ix_to_eth_to_s00_couplers_TUSER),
        .S_AXIS_tvalid(axis_ix_to_eth_to_s00_couplers_TVALID));
  s01_couplers_imp_1WDE4KY s01_couplers
       (.M_AXIS_ACLK(axis_ix_to_eth_ACLK_net),
        .M_AXIS_ARESETN(axis_ix_to_eth_ARESETN_net),
        .M_AXIS_tdata(s01_couplers_to_xbar_TDATA),
        .M_AXIS_tid(s01_couplers_to_xbar_TID),
        .M_AXIS_tkeep(s01_couplers_to_xbar_TKEEP),
        .M_AXIS_tlast(s01_couplers_to_xbar_TLAST),
        .M_AXIS_tready(s01_couplers_to_xbar_TREADY),
        .M_AXIS_tstrb(s01_couplers_to_xbar_TSTRB),
        .M_AXIS_tuser(s01_couplers_to_xbar_TUSER),
        .M_AXIS_tvalid(s01_couplers_to_xbar_TVALID),
        .S_AXIS_ACLK(S01_AXIS_ACLK_1),
        .S_AXIS_ARESETN(S01_AXIS_ARESETN_1),
        .S_AXIS_tdata(axis_ix_to_eth_to_s01_couplers_TDATA),
        .S_AXIS_tid(axis_ix_to_eth_to_s01_couplers_TID),
        .S_AXIS_tkeep(axis_ix_to_eth_to_s01_couplers_TKEEP),
        .S_AXIS_tlast(axis_ix_to_eth_to_s01_couplers_TLAST),
        .S_AXIS_tready(axis_ix_to_eth_to_s01_couplers_TREADY),
        .S_AXIS_tuser(axis_ix_to_eth_to_s01_couplers_TUSER),
        .S_AXIS_tvalid(axis_ix_to_eth_to_s01_couplers_TVALID));
  test_logic_single_port_s_arb_req_suppress_concat_4 s_arb_req_suppress_concat
       (.In0(s00_arb_req_suppress_to_s_arb_req_suppress_concat),
        .In1(s01_arb_req_suppress_to_s_arb_req_suppress_concat),
        .dout(s_arb_req_suppress_concat_dout));
  test_logic_single_port_xbar_7 xbar
       (.aclk(axis_ix_to_eth_ACLK_net),
        .aresetn(axis_ix_to_eth_ARESETN_net),
        .m_axis_tdata(xbar_to_m00_couplers_TDATA),
        .m_axis_tid(xbar_to_m00_couplers_TID),
        .m_axis_tkeep(xbar_to_m00_couplers_TKEEP),
        .m_axis_tlast(xbar_to_m00_couplers_TLAST),
        .m_axis_tready(xbar_to_m00_couplers_TREADY),
        .m_axis_tstrb(xbar_to_m00_couplers_TSTRB),
        .m_axis_tuser(xbar_to_m00_couplers_TUSER),
        .m_axis_tvalid(xbar_to_m00_couplers_TVALID),
        .s_axis_tdata({s01_couplers_to_xbar_TDATA,s00_couplers_to_xbar_TDATA}),
        .s_axis_tid({s01_couplers_to_xbar_TID,s00_couplers_to_xbar_TID}),
        .s_axis_tkeep({s01_couplers_to_xbar_TKEEP,s00_couplers_to_xbar_TKEEP}),
        .s_axis_tlast({s01_couplers_to_xbar_TLAST,s00_couplers_to_xbar_TLAST}),
        .s_axis_tready({s01_couplers_to_xbar_TREADY,s00_couplers_to_xbar_TREADY}),
        .s_axis_tstrb({s01_couplers_to_xbar_TSTRB,s00_couplers_to_xbar_TSTRB}),
        .s_axis_tuser({s01_couplers_to_xbar_TUSER,s00_couplers_to_xbar_TUSER}),
        .s_axis_tvalid({s01_couplers_to_xbar_TVALID,s00_couplers_to_xbar_TVALID}),
        .s_req_suppress(s_arb_req_suppress_concat_dout));
endmodule

module test_logic_single_port_axis_ix_to_ponylink_2
   (ACLK,
    ARESETN,
    M00_AXIS_ACLK,
    M00_AXIS_ARESETN,
    M00_AXIS_tdata,
    M00_AXIS_tlast,
    M00_AXIS_tready,
    M00_AXIS_tuser,
    M00_AXIS_tvalid,
    S00_AXIS_ACLK,
    S00_AXIS_ARESETN,
    S00_AXIS_tdata,
    S00_AXIS_tid,
    S00_AXIS_tkeep,
    S00_AXIS_tlast,
    S00_AXIS_tready,
    S00_AXIS_tuser,
    S00_AXIS_tvalid);
  input ACLK;
  input ARESETN;
  input M00_AXIS_ACLK;
  input M00_AXIS_ARESETN;
  output [7:0]M00_AXIS_tdata;
  output M00_AXIS_tlast;
  input M00_AXIS_tready;
  output [0:0]M00_AXIS_tuser;
  output M00_AXIS_tvalid;
  input S00_AXIS_ACLK;
  input S00_AXIS_ARESETN;
  input [63:0]S00_AXIS_tdata;
  input [2:0]S00_AXIS_tid;
  input [7:0]S00_AXIS_tkeep;
  input S00_AXIS_tlast;
  output S00_AXIS_tready;
  input [7:0]S00_AXIS_tuser;
  input S00_AXIS_tvalid;

  wire M00_AXIS_ACLK_1;
  wire M00_AXIS_ARESETN_1;
  wire S00_AXIS_ACLK_1;
  wire S00_AXIS_ARESETN_1;
  wire [63:0]axis_ix_to_ponylink_to_s00_couplers_TDATA;
  wire [2:0]axis_ix_to_ponylink_to_s00_couplers_TID;
  wire [7:0]axis_ix_to_ponylink_to_s00_couplers_TKEEP;
  wire axis_ix_to_ponylink_to_s00_couplers_TLAST;
  wire axis_ix_to_ponylink_to_s00_couplers_TREADY;
  wire [7:0]axis_ix_to_ponylink_to_s00_couplers_TUSER;
  wire axis_ix_to_ponylink_to_s00_couplers_TVALID;
  wire [7:0]s00_couplers_to_axis_ix_to_ponylink_TDATA;
  wire s00_couplers_to_axis_ix_to_ponylink_TLAST;
  wire s00_couplers_to_axis_ix_to_ponylink_TREADY;
  wire [0:0]s00_couplers_to_axis_ix_to_ponylink_TUSER;
  wire s00_couplers_to_axis_ix_to_ponylink_TVALID;

  assign M00_AXIS_ACLK_1 = M00_AXIS_ACLK;
  assign M00_AXIS_ARESETN_1 = M00_AXIS_ARESETN;
  assign M00_AXIS_tdata[7:0] = s00_couplers_to_axis_ix_to_ponylink_TDATA;
  assign M00_AXIS_tlast = s00_couplers_to_axis_ix_to_ponylink_TLAST;
  assign M00_AXIS_tuser[0] = s00_couplers_to_axis_ix_to_ponylink_TUSER;
  assign M00_AXIS_tvalid = s00_couplers_to_axis_ix_to_ponylink_TVALID;
  assign S00_AXIS_ACLK_1 = S00_AXIS_ACLK;
  assign S00_AXIS_ARESETN_1 = S00_AXIS_ARESETN;
  assign S00_AXIS_tready = axis_ix_to_ponylink_to_s00_couplers_TREADY;
  assign axis_ix_to_ponylink_to_s00_couplers_TDATA = S00_AXIS_tdata[63:0];
  assign axis_ix_to_ponylink_to_s00_couplers_TID = S00_AXIS_tid[2:0];
  assign axis_ix_to_ponylink_to_s00_couplers_TKEEP = S00_AXIS_tkeep[7:0];
  assign axis_ix_to_ponylink_to_s00_couplers_TLAST = S00_AXIS_tlast;
  assign axis_ix_to_ponylink_to_s00_couplers_TUSER = S00_AXIS_tuser[7:0];
  assign axis_ix_to_ponylink_to_s00_couplers_TVALID = S00_AXIS_tvalid;
  assign s00_couplers_to_axis_ix_to_ponylink_TREADY = M00_AXIS_tready;
  s00_couplers_imp_1WD6HZJ s00_couplers
       (.M_AXIS_ACLK(M00_AXIS_ACLK_1),
        .M_AXIS_ARESETN(M00_AXIS_ARESETN_1),
        .M_AXIS_tdata(s00_couplers_to_axis_ix_to_ponylink_TDATA),
        .M_AXIS_tlast(s00_couplers_to_axis_ix_to_ponylink_TLAST),
        .M_AXIS_tready(s00_couplers_to_axis_ix_to_ponylink_TREADY),
        .M_AXIS_tuser(s00_couplers_to_axis_ix_to_ponylink_TUSER),
        .M_AXIS_tvalid(s00_couplers_to_axis_ix_to_ponylink_TVALID),
        .S_AXIS_ACLK(S00_AXIS_ACLK_1),
        .S_AXIS_ARESETN(S00_AXIS_ARESETN_1),
        .S_AXIS_tdata(axis_ix_to_ponylink_to_s00_couplers_TDATA),
        .S_AXIS_tid(axis_ix_to_ponylink_to_s00_couplers_TID),
        .S_AXIS_tkeep(axis_ix_to_ponylink_to_s00_couplers_TKEEP),
        .S_AXIS_tlast(axis_ix_to_ponylink_to_s00_couplers_TLAST),
        .S_AXIS_tready(axis_ix_to_ponylink_to_s00_couplers_TREADY),
        .S_AXIS_tuser(axis_ix_to_ponylink_to_s00_couplers_TUSER),
        .S_AXIS_tvalid(axis_ix_to_ponylink_to_s00_couplers_TVALID));
endmodule

module test_logic_single_port_eth_rx_ix_7
   (ACLK,
    ARESETN,
    M00_AXIS_ACLK,
    M00_AXIS_ARESETN,
    M00_AXIS_tdata,
    M00_AXIS_tid,
    M00_AXIS_tkeep,
    M00_AXIS_tlast,
    M00_AXIS_tready,
    M00_AXIS_tuser,
    M00_AXIS_tvalid,
    S00_AXIS_ACLK,
    S00_AXIS_ARESETN,
    S00_AXIS_tdata,
    S00_AXIS_tlast,
    S00_AXIS_tuser,
    S00_AXIS_tvalid);
  input ACLK;
  input ARESETN;
  input M00_AXIS_ACLK;
  input M00_AXIS_ARESETN;
  output [511:0]M00_AXIS_tdata;
  output [2:0]M00_AXIS_tid;
  output [63:0]M00_AXIS_tkeep;
  output M00_AXIS_tlast;
  input M00_AXIS_tready;
  output [63:0]M00_AXIS_tuser;
  output M00_AXIS_tvalid;
  input S00_AXIS_ACLK;
  input S00_AXIS_ARESETN;
  input [7:0]S00_AXIS_tdata;
  input S00_AXIS_tlast;
  input [0:0]S00_AXIS_tuser;
  input S00_AXIS_tvalid;

  wire M00_AXIS_ACLK_1;
  wire M00_AXIS_ARESETN_1;
  wire S00_AXIS_ACLK_1;
  wire S00_AXIS_ARESETN_1;
  wire [7:0]eth_rx_ix_to_s00_couplers_TDATA;
  wire eth_rx_ix_to_s00_couplers_TLAST;
  wire [0:0]eth_rx_ix_to_s00_couplers_TUSER;
  wire eth_rx_ix_to_s00_couplers_TVALID;
  wire [511:0]s00_couplers_to_eth_rx_ix_TDATA;
  wire [2:0]s00_couplers_to_eth_rx_ix_TID;
  wire [63:0]s00_couplers_to_eth_rx_ix_TKEEP;
  wire s00_couplers_to_eth_rx_ix_TLAST;
  wire s00_couplers_to_eth_rx_ix_TREADY;
  wire [63:0]s00_couplers_to_eth_rx_ix_TUSER;
  wire s00_couplers_to_eth_rx_ix_TVALID;

  assign M00_AXIS_ACLK_1 = M00_AXIS_ACLK;
  assign M00_AXIS_ARESETN_1 = M00_AXIS_ARESETN;
  assign M00_AXIS_tdata[511:0] = s00_couplers_to_eth_rx_ix_TDATA;
  assign M00_AXIS_tid[2:0] = s00_couplers_to_eth_rx_ix_TID;
  assign M00_AXIS_tkeep[63:0] = s00_couplers_to_eth_rx_ix_TKEEP;
  assign M00_AXIS_tlast = s00_couplers_to_eth_rx_ix_TLAST;
  assign M00_AXIS_tuser[63:0] = s00_couplers_to_eth_rx_ix_TUSER;
  assign M00_AXIS_tvalid = s00_couplers_to_eth_rx_ix_TVALID;
  assign S00_AXIS_ACLK_1 = S00_AXIS_ACLK;
  assign S00_AXIS_ARESETN_1 = S00_AXIS_ARESETN;
  assign eth_rx_ix_to_s00_couplers_TDATA = S00_AXIS_tdata[7:0];
  assign eth_rx_ix_to_s00_couplers_TLAST = S00_AXIS_tlast;
  assign eth_rx_ix_to_s00_couplers_TUSER = S00_AXIS_tuser[0];
  assign eth_rx_ix_to_s00_couplers_TVALID = S00_AXIS_tvalid;
  assign s00_couplers_to_eth_rx_ix_TREADY = M00_AXIS_tready;
  s00_couplers_imp_19I57HK s00_couplers
       (.M_AXIS_ACLK(M00_AXIS_ACLK_1),
        .M_AXIS_ARESETN(M00_AXIS_ARESETN_1),
        .M_AXIS_tdata(s00_couplers_to_eth_rx_ix_TDATA),
        .M_AXIS_tid(s00_couplers_to_eth_rx_ix_TID),
        .M_AXIS_tkeep(s00_couplers_to_eth_rx_ix_TKEEP),
        .M_AXIS_tlast(s00_couplers_to_eth_rx_ix_TLAST),
        .M_AXIS_tready(s00_couplers_to_eth_rx_ix_TREADY),
        .M_AXIS_tuser(s00_couplers_to_eth_rx_ix_TUSER),
        .M_AXIS_tvalid(s00_couplers_to_eth_rx_ix_TVALID),
        .S_AXIS_ACLK(S00_AXIS_ACLK_1),
        .S_AXIS_ARESETN(S00_AXIS_ARESETN_1),
        .S_AXIS_tdata(eth_rx_ix_to_s00_couplers_TDATA),
        .S_AXIS_tlast(eth_rx_ix_to_s00_couplers_TLAST),
        .S_AXIS_tuser(eth_rx_ix_to_s00_couplers_TUSER),
        .S_AXIS_tvalid(eth_rx_ix_to_s00_couplers_TVALID));
endmodule
