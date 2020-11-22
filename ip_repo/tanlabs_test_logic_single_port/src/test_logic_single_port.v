//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.2 (lin64) Build 2708876 Wed Nov  6 21:39:14 MST 2019
//Date        : Sun Nov 22 18:02:25 2020
//Host        : vision2 running 64-bit Arch Linux
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
  test_logic_single_port_axi_ethernet_clock_w_0_1 axi_ethernet_clock_w_0
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
  test_logic_single_port_sfp_ethernet_0 sfp_ethernet
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
  test_logic_single_port_xlconstant_0_2 xlconstant_0
       (.dout(xlconstant_0_dout));
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
  test_logic_single_port_auto_cc_1 auto_cc
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
  test_logic_single_port_auto_ds_0 auto_ds
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
  test_logic_single_port_auto_ss_k_0 auto_ss_k
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
  test_logic_single_port_auto_ss_slid_1 auto_ss_slid
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
    M_AXIS_tlast,
    M_AXIS_tready,
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
  output M_AXIS_tlast;
  input M_AXIS_tready;
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
  wire [7:0]auto_cc_to_auto_ss_slid_TDATA;
  wire auto_cc_to_auto_ss_slid_TLAST;
  wire auto_cc_to_auto_ss_slid_TREADY;
  wire [0:0]auto_cc_to_auto_ss_slid_TSTRB;
  wire [0:0]auto_cc_to_auto_ss_slid_TUSER;
  wire auto_cc_to_auto_ss_slid_TVALID;
  wire [7:0]auto_ss_slid_to_s00_couplers_TDATA;
  wire auto_ss_slid_to_s00_couplers_TLAST;
  wire auto_ss_slid_to_s00_couplers_TREADY;
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
  assign M_AXIS_tlast = auto_ss_slid_to_s00_couplers_TLAST;
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
  test_logic_single_port_auto_cc_0 auto_cc
       (.m_axis_aclk(M_AXIS_ACLK_1),
        .m_axis_aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_cc_to_auto_ss_slid_TDATA),
        .m_axis_tlast(auto_cc_to_auto_ss_slid_TLAST),
        .m_axis_tready(auto_cc_to_auto_ss_slid_TREADY),
        .m_axis_tstrb(auto_cc_to_auto_ss_slid_TSTRB),
        .m_axis_tuser(auto_cc_to_auto_ss_slid_TUSER),
        .m_axis_tvalid(auto_cc_to_auto_ss_slid_TVALID),
        .s_axis_aclk(S_AXIS_ACLK_1),
        .s_axis_aresetn(S_AXIS_ARESETN_1),
        .s_axis_tdata(s00_couplers_to_auto_cc_TDATA),
        .s_axis_tlast(s00_couplers_to_auto_cc_TLAST),
        .s_axis_tready(s00_couplers_to_auto_cc_TREADY),
        .s_axis_tstrb(s00_couplers_to_auto_cc_TSTRB),
        .s_axis_tuser(s00_couplers_to_auto_cc_TUSER),
        .s_axis_tvalid(s00_couplers_to_auto_cc_TVALID));
  test_logic_single_port_auto_ss_slid_0 auto_ss_slid
       (.aclk(M_AXIS_ACLK_1),
        .aresetn(M_AXIS_ARESETN_1),
        .m_axis_tdata(auto_ss_slid_to_s00_couplers_TDATA),
        .m_axis_tlast(auto_ss_slid_to_s00_couplers_TLAST),
        .m_axis_tready(auto_ss_slid_to_s00_couplers_TREADY),
        .m_axis_tuser(auto_ss_slid_to_s00_couplers_TUSER),
        .m_axis_tvalid(auto_ss_slid_to_s00_couplers_TVALID),
        .s_axis_tdata(auto_cc_to_auto_ss_slid_TDATA),
        .s_axis_tlast(auto_cc_to_auto_ss_slid_TLAST),
        .s_axis_tready(auto_cc_to_auto_ss_slid_TREADY),
        .s_axis_tstrb(auto_cc_to_auto_ss_slid_TSTRB),
        .s_axis_tuser(auto_cc_to_auto_ss_slid_TUSER),
        .s_axis_tvalid(auto_cc_to_auto_ss_slid_TVALID));
endmodule

(* CORE_GENERATION_INFO = "test_logic_single_port,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=test_logic_single_port,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=25,numReposBlks=20,numNonXlnxBlks=5,numHierBlks=5,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "test_logic_single_port.hwdef" *) 
module test_logic_single_port
   (board_led,
    check_ready,
    clk_160M,
    clk_40M,
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_160M CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_160M, CLK_DOMAIN test_logic_single_port_clk_160M, FREQ_HZ 160000000, INSERT_VIP 0, PHASE 0.000" *) input clk_160M;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_40M CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_40M, CLK_DOMAIN test_logic_single_port_clk_40M, FREQ_HZ 40000000, INSERT_VIP 0, PHASE 0.000" *) input clk_40M;
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
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PONYLINK_DATA DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PONYLINK_DATA, LAYERED_METADATA undef" *) inout ponylink_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.PORT_CONFIG DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.PORT_CONFIG, LAYERED_METADATA undef" *) input [191:0]port_config;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.RESULT DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.RESULT, LAYERED_METADATA undef" *) output [127:0]result;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.RXOUTCLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.RXOUTCLK, CLK_DOMAIN bd_3464_pcs_pma_0_rxoutclk, FREQ_HZ 62500000, INSERT_VIP 0, PHASE 0" *) output rxoutclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.SFP_LED DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.SFP_LED, LAYERED_METADATA undef, PortWidth 2" *) output [1:0]sfp_led;
  input sfp_rx_los;
  (* X_INTERFACE_INFO = "xilinx.com:interface:sfp:1.0 sfp RXN" *) input sfp_rxn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:sfp:1.0 sfp RXP" *) input sfp_rxp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:sfp:1.0 sfp TXN" *) output sfp_txn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:sfp:1.0 sfp TXP" *) output sfp_txp;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.START DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.START, LAYERED_METADATA undef" *) input start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.STOP DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.STOP, LAYERED_METADATA undef" *) input stop;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.TXOUTCLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.TXOUTCLK, CLK_DOMAIN bd_3464_pcs_pma_0_txoutclk, FREQ_HZ 62500000, INSERT_VIP 0, PHASE 0" *) output txoutclk;

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
  wire [7:0]axis_interconnect_0_M00_AXIS_TDATA;
  wire axis_interconnect_0_M00_AXIS_TLAST;
  wire axis_interconnect_0_M00_AXIS_TREADY;
  wire [0:0]axis_interconnect_0_M00_AXIS_TUSER;
  wire axis_interconnect_0_M00_AXIS_TVALID;
  wire [7:0]axis_ix_to_ponylink_M00_AXIS_TDATA;
  wire axis_ix_to_ponylink_M00_AXIS_TLAST;
  wire axis_ix_to_ponylink_M00_AXIS_TREADY;
  wire [0:0]axis_ix_to_ponylink_M00_AXIS_TUSER;
  wire axis_ix_to_ponylink_M00_AXIS_TVALID;
  wire [1:0]board_led_concat_dout;
  wire clk_160M_1;
  wire clk_40M_1;
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
  wire [63:0]fifo_to_ponylink_axis_out_TDATA;
  wire [2:0]fifo_to_ponylink_axis_out_TID;
  wire [7:0]fifo_to_ponylink_axis_out_TKEEP;
  wire fifo_to_ponylink_axis_out_TLAST;
  wire fifo_to_ponylink_axis_out_TREADY;
  wire [7:0]fifo_to_ponylink_axis_out_TUSER;
  wire fifo_to_ponylink_axis_out_TVALID;
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
  wire [191:0]port_config_1;
  wire [63:0]rx_width_converter_M_AXIS_TDATA;
  wire [7:0]rx_width_converter_M_AXIS_TKEEP;
  wire rx_width_converter_M_AXIS_TLAST;
  wire rx_width_converter_M_AXIS_TREADY;
  wire [7:0]rx_width_converter_M_AXIS_TUSER;
  wire rx_width_converter_M_AXIS_TVALID;
  wire [1:0]sfp_led_concat_dout;
  wire sfp_rx_los_1;
  wire start_1;
  wire stop_1;
  wire [63:0]tanlabs_frame_checker_0_axis_out_TDATA;
  wire [2:0]tanlabs_frame_checker_0_axis_out_TID;
  wire [7:0]tanlabs_frame_checker_0_axis_out_TKEEP;
  wire tanlabs_frame_checker_0_axis_out_TLAST;
  wire tanlabs_frame_checker_0_axis_out_TREADY;
  wire [7:0]tanlabs_frame_checker_0_axis_out_TUSER;
  wire tanlabs_frame_checker_0_axis_out_TVALID;
  wire tanlabs_frame_checker_0_ready;
  wire [127:0]tanlabs_frame_checker_0_result;
  wire tanlabs_frame_genera_0_ready;
  wire [0:0]util_vector_logic_0_Res;
  wire [0:0]util_vector_logic_1_Res;
  wire [0:0]util_vector_logic_3_Res;
  wire [7:0]xlconstant_0_dout;

  assign axi_ethernet_0_sfp_RXN = sfp_rxn;
  assign axi_ethernet_0_sfp_RXP = sfp_rxp;
  assign board_led[1:0] = board_led_concat_dout;
  assign check_ready = tanlabs_frame_checker_0_ready;
  assign clk_160M_1 = clk_160M;
  assign clk_40M_1 = clk_40M;
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
  assign port_config_1 = port_config[191:0];
  assign result[127:0] = tanlabs_frame_checker_0_result;
  assign rxoutclk = axi_ethernet_inner_rxoutclk;
  assign sfp_led[1:0] = sfp_led_concat_dout;
  assign sfp_rx_los_1 = sfp_rx_los;
  assign sfp_txn = axi_ethernet_0_sfp_TXN;
  assign sfp_txp = axi_ethernet_0_sfp_TXP;
  assign start_1 = start;
  assign stop_1 = stop;
  assign txoutclk = axi_ethernet_inner_txoutclk;
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
        .rx_reset(axi_ethernet_inner_rx_reset),
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
        .txoutclk(axi_ethernet_inner_txoutclk));
  test_logic_single_port_axis_ix_to_eth_0 axis_ix_to_eth
       (.ACLK(M00_AXIS_ACLK_1),
        .ARESETN(util_vector_logic_1_Res),
        .M00_AXIS_ACLK(M00_AXIS_ACLK_1),
        .M00_AXIS_ARESETN(util_vector_logic_1_Res),
        .M00_AXIS_tdata(axis_interconnect_0_M00_AXIS_TDATA),
        .M00_AXIS_tlast(axis_interconnect_0_M00_AXIS_TLAST),
        .M00_AXIS_tready(axis_interconnect_0_M00_AXIS_TREADY),
        .M00_AXIS_tuser(axis_interconnect_0_M00_AXIS_TUSER),
        .M00_AXIS_tvalid(axis_interconnect_0_M00_AXIS_TVALID),
        .S00_ARB_REQ_SUPPRESS(xlconstant_0_dout),
        .S00_AXIS_ACLK(clk_40M_1),
        .S00_AXIS_ARESETN(ponylink_to_zynq_resetn_out),
        .S00_AXIS_tdata(ponylink_to_zynq_axis_out_TDATA),
        .S00_AXIS_tlast(ponylink_to_zynq_axis_out_TLAST),
        .S00_AXIS_tready(ponylink_to_zynq_axis_out_TREADY),
        .S00_AXIS_tstrb(ponylink_to_zynq_axis_out_TSTRB),
        .S00_AXIS_tuser(ponylink_to_zynq_axis_out_TUSER),
        .S00_AXIS_tvalid(ponylink_to_zynq_axis_out_TVALID),
        .S01_ARB_REQ_SUPPRESS(xlconstant_0_dout),
        .S01_AXIS_ACLK(ACLK_1),
        .S01_AXIS_ARESETN(util_vector_logic_3_Res));
  test_logic_single_port_axis_ix_to_ponylink_0 axis_ix_to_ponylink
       (.ACLK(ACLK_1),
        .ARESETN(util_vector_logic_3_Res),
        .M00_AXIS_ACLK(clk_40M_1),
        .M00_AXIS_ARESETN(ponylink_to_zynq_resetn_out),
        .M00_AXIS_tdata(axis_ix_to_ponylink_M00_AXIS_TDATA),
        .M00_AXIS_tlast(axis_ix_to_ponylink_M00_AXIS_TLAST),
        .M00_AXIS_tready(axis_ix_to_ponylink_M00_AXIS_TREADY),
        .M00_AXIS_tuser(axis_ix_to_ponylink_M00_AXIS_TUSER),
        .M00_AXIS_tvalid(axis_ix_to_ponylink_M00_AXIS_TVALID),
        .S00_AXIS_ACLK(ACLK_1),
        .S00_AXIS_ARESETN(util_vector_logic_3_Res),
        .S00_AXIS_tdata(fifo_to_ponylink_axis_out_TDATA),
        .S00_AXIS_tid(fifo_to_ponylink_axis_out_TID),
        .S00_AXIS_tkeep(fifo_to_ponylink_axis_out_TKEEP),
        .S00_AXIS_tlast(fifo_to_ponylink_axis_out_TLAST),
        .S00_AXIS_tready(fifo_to_ponylink_axis_out_TREADY),
        .S00_AXIS_tuser(fifo_to_ponylink_axis_out_TUSER),
        .S00_AXIS_tvalid(fifo_to_ponylink_axis_out_TVALID));
  test_logic_single_port_xlconcat_0_1 board_led_concat
       (.In0(ponylink_to_zynq_linkready),
        .In1(ponylink_to_zynq_linkerror),
        .dout(board_led_concat_dout));
  test_logic_single_port_eth_rx_rst_n_0 eth_rx_rst_n
       (.Op1(axi_ethernet_inner_rx_reset),
        .Res(util_vector_logic_3_Res));
  test_logic_single_port_eth_tx_rst_n_0 eth_tx_rst_n
       (.Op1(axi_ethernet_inner_tx_reset),
        .Res(util_vector_logic_1_Res));
  test_logic_single_port_fifo_to_ponylink_0 fifo_to_ponylink
       (.clk(ACLK_1),
        .m_data(fifo_to_ponylink_axis_out_TDATA),
        .m_id(fifo_to_ponylink_axis_out_TID),
        .m_keep(fifo_to_ponylink_axis_out_TKEEP),
        .m_last(fifo_to_ponylink_axis_out_TLAST),
        .m_ready(fifo_to_ponylink_axis_out_TREADY),
        .m_user(fifo_to_ponylink_axis_out_TUSER),
        .m_valid(fifo_to_ponylink_axis_out_TVALID),
        .reset(axi_ethernet_inner_rx_reset),
        .s_data(tanlabs_frame_checker_0_axis_out_TDATA),
        .s_id(tanlabs_frame_checker_0_axis_out_TID),
        .s_keep(tanlabs_frame_checker_0_axis_out_TKEEP),
        .s_last(tanlabs_frame_checker_0_axis_out_TLAST),
        .s_ready(tanlabs_frame_checker_0_axis_out_TREADY),
        .s_user(tanlabs_frame_checker_0_axis_out_TUSER),
        .s_valid(tanlabs_frame_checker_0_axis_out_TVALID));
  test_logic_single_port_frame_checker_0 frame_checker
       (.axis_m_data(tanlabs_frame_checker_0_axis_out_TDATA),
        .axis_m_id(tanlabs_frame_checker_0_axis_out_TID),
        .axis_m_keep(tanlabs_frame_checker_0_axis_out_TKEEP),
        .axis_m_last(tanlabs_frame_checker_0_axis_out_TLAST),
        .axis_m_ready(tanlabs_frame_checker_0_axis_out_TREADY),
        .axis_m_user(tanlabs_frame_checker_0_axis_out_TUSER),
        .axis_m_valid(tanlabs_frame_checker_0_axis_out_TVALID),
        .axis_s_data(rx_width_converter_M_AXIS_TDATA),
        .axis_s_id({1'b0,1'b0,1'b0}),
        .axis_s_keep(rx_width_converter_M_AXIS_TKEEP),
        .axis_s_last(rx_width_converter_M_AXIS_TLAST),
        .axis_s_ready(rx_width_converter_M_AXIS_TREADY),
        .axis_s_user(rx_width_converter_M_AXIS_TUSER),
        .axis_s_valid(rx_width_converter_M_AXIS_TVALID),
        .clk(ACLK_1),
        .ready(tanlabs_frame_checker_0_ready),
        .result(tanlabs_frame_checker_0_result),
        .rst(axi_ethernet_inner_rx_reset),
        .start(start_1),
        .stop(stop_1));
  test_logic_single_port_frame_generator_0 frame_generator
       (.axis_m_ready(1'b1),
        .clk(ACLK_1),
        .port_config(port_config_1),
        .ready(tanlabs_frame_genera_0_ready),
        .rst(axi_ethernet_inner_rx_reset),
        .start(start_1),
        .stop(stop_1));
  test_logic_single_port_ponylink_to_zynq_0 ponylink_to_zynq
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
        .clk(clk_40M_1),
        .clk4(clk_160M_1),
        .data_pin(ponylink_data),
        .gpio_i(xlconstant_0_dout),
        .linkerror(ponylink_to_zynq_linkerror),
        .linkready(ponylink_to_zynq_linkready),
        .mode_recv(ponylink_to_zynq_mode_recv),
        .mode_send(ponylink_to_zynq_mode_send),
        .resetn_out(ponylink_to_zynq_resetn_out));
  test_logic_single_port_rx_width_converter_0 rx_width_converter
       (.aclk(ACLK_1),
        .aresetn(util_vector_logic_3_Res),
        .m_axis_tdata(rx_width_converter_M_AXIS_TDATA),
        .m_axis_tkeep(rx_width_converter_M_AXIS_TKEEP),
        .m_axis_tlast(rx_width_converter_M_AXIS_TLAST),
        .m_axis_tready(rx_width_converter_M_AXIS_TREADY),
        .m_axis_tuser(rx_width_converter_M_AXIS_TUSER),
        .m_axis_tvalid(rx_width_converter_M_AXIS_TVALID),
        .s_axis_tdata(axi_ethernet_inner_m_axis_rx_TDATA),
        .s_axis_tlast(axi_ethernet_inner_m_axis_rx_TLAST),
        .s_axis_tuser(axi_ethernet_inner_m_axis_rx_TUSER),
        .s_axis_tvalid(axi_ethernet_inner_m_axis_rx_TVALID));
  test_logic_single_port_xlconcat_0_0 sfp_led_concat
       (.In0(ponylink_to_zynq_mode_send),
        .In1(ponylink_to_zynq_mode_recv),
        .dout(sfp_led_concat_dout));
  test_logic_single_port_sfp_rx_los_n_0 sfp_rx_los_n
       (.Op1(sfp_rx_los_1),
        .Res(util_vector_logic_0_Res));
  test_logic_single_port_xlconstant_0_3 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule

module test_logic_single_port_axis_ix_to_eth_0
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
    S01_AXIS_ARESETN);
  input ACLK;
  input ARESETN;
  input M00_AXIS_ACLK;
  input M00_AXIS_ARESETN;
  output [7:0]M00_AXIS_tdata;
  output M00_AXIS_tlast;
  input M00_AXIS_tready;
  output [0:0]M00_AXIS_tuser;
  output M00_AXIS_tvalid;
  input [7:0]S00_ARB_REQ_SUPPRESS;
  input S00_AXIS_ACLK;
  input S00_AXIS_ARESETN;
  input [7:0]S00_AXIS_tdata;
  input S00_AXIS_tlast;
  output S00_AXIS_tready;
  input [0:0]S00_AXIS_tstrb;
  input [0:0]S00_AXIS_tuser;
  input S00_AXIS_tvalid;
  input [7:0]S01_ARB_REQ_SUPPRESS;
  input S01_AXIS_ACLK;
  input S01_AXIS_ARESETN;

  wire M00_AXIS_ACLK_1;
  wire M00_AXIS_ARESETN_1;
  wire S00_AXIS_ACLK_1;
  wire S00_AXIS_ARESETN_1;
  wire [7:0]axis_ix_to_eth_to_s00_couplers_TDATA;
  wire axis_ix_to_eth_to_s00_couplers_TLAST;
  wire axis_ix_to_eth_to_s00_couplers_TREADY;
  wire [0:0]axis_ix_to_eth_to_s00_couplers_TSTRB;
  wire [0:0]axis_ix_to_eth_to_s00_couplers_TUSER;
  wire axis_ix_to_eth_to_s00_couplers_TVALID;
  wire [7:0]s00_couplers_to_axis_ix_to_eth_TDATA;
  wire s00_couplers_to_axis_ix_to_eth_TLAST;
  wire s00_couplers_to_axis_ix_to_eth_TREADY;
  wire [0:0]s00_couplers_to_axis_ix_to_eth_TUSER;
  wire s00_couplers_to_axis_ix_to_eth_TVALID;

  assign M00_AXIS_ACLK_1 = M00_AXIS_ACLK;
  assign M00_AXIS_ARESETN_1 = M00_AXIS_ARESETN;
  assign M00_AXIS_tdata[7:0] = s00_couplers_to_axis_ix_to_eth_TDATA;
  assign M00_AXIS_tlast = s00_couplers_to_axis_ix_to_eth_TLAST;
  assign M00_AXIS_tuser[0] = s00_couplers_to_axis_ix_to_eth_TUSER;
  assign M00_AXIS_tvalid = s00_couplers_to_axis_ix_to_eth_TVALID;
  assign S00_AXIS_ACLK_1 = S00_AXIS_ACLK;
  assign S00_AXIS_ARESETN_1 = S00_AXIS_ARESETN;
  assign S00_AXIS_tready = axis_ix_to_eth_to_s00_couplers_TREADY;
  assign axis_ix_to_eth_to_s00_couplers_TDATA = S00_AXIS_tdata[7:0];
  assign axis_ix_to_eth_to_s00_couplers_TLAST = S00_AXIS_tlast;
  assign axis_ix_to_eth_to_s00_couplers_TSTRB = S00_AXIS_tstrb[0];
  assign axis_ix_to_eth_to_s00_couplers_TUSER = S00_AXIS_tuser[0];
  assign axis_ix_to_eth_to_s00_couplers_TVALID = S00_AXIS_tvalid;
  assign s00_couplers_to_axis_ix_to_eth_TREADY = M00_AXIS_tready;
  s00_couplers_imp_24TIC8 s00_couplers
       (.M_AXIS_ACLK(M00_AXIS_ACLK_1),
        .M_AXIS_ARESETN(M00_AXIS_ARESETN_1),
        .M_AXIS_tdata(s00_couplers_to_axis_ix_to_eth_TDATA),
        .M_AXIS_tlast(s00_couplers_to_axis_ix_to_eth_TLAST),
        .M_AXIS_tready(s00_couplers_to_axis_ix_to_eth_TREADY),
        .M_AXIS_tuser(s00_couplers_to_axis_ix_to_eth_TUSER),
        .M_AXIS_tvalid(s00_couplers_to_axis_ix_to_eth_TVALID),
        .S_AXIS_ACLK(S00_AXIS_ACLK_1),
        .S_AXIS_ARESETN(S00_AXIS_ARESETN_1),
        .S_AXIS_tdata(axis_ix_to_eth_to_s00_couplers_TDATA),
        .S_AXIS_tlast(axis_ix_to_eth_to_s00_couplers_TLAST),
        .S_AXIS_tready(axis_ix_to_eth_to_s00_couplers_TREADY),
        .S_AXIS_tstrb(axis_ix_to_eth_to_s00_couplers_TSTRB),
        .S_AXIS_tuser(axis_ix_to_eth_to_s00_couplers_TUSER),
        .S_AXIS_tvalid(axis_ix_to_eth_to_s00_couplers_TVALID));
endmodule

module test_logic_single_port_axis_ix_to_ponylink_0
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
