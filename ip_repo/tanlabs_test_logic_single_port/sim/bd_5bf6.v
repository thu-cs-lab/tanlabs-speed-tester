//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_5bf6.bd
//Design : bd_5bf6
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_5bf6,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_5bf6,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=7,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=Global}" *) (* HW_HANDOFF = "test_logic_single_port_system_ila_0_0.hwdef" *) 
module bd_5bf6
   (SLOT_0_AXIS_tdata,
    SLOT_0_AXIS_tid,
    SLOT_0_AXIS_tkeep,
    SLOT_0_AXIS_tlast,
    SLOT_0_AXIS_tready,
    SLOT_0_AXIS_tuser,
    SLOT_0_AXIS_tvalid,
    SLOT_1_AXIS_tdata,
    SLOT_1_AXIS_tid,
    SLOT_1_AXIS_tkeep,
    SLOT_1_AXIS_tlast,
    SLOT_1_AXIS_tready,
    SLOT_1_AXIS_tuser,
    SLOT_1_AXIS_tvalid,
    SLOT_2_AXIS_tdata,
    SLOT_2_AXIS_tid,
    SLOT_2_AXIS_tkeep,
    SLOT_2_AXIS_tlast,
    SLOT_2_AXIS_tready,
    SLOT_2_AXIS_tuser,
    SLOT_2_AXIS_tvalid,
    SLOT_3_AXIS_tdata,
    SLOT_3_AXIS_tlast,
    SLOT_3_AXIS_tready,
    SLOT_3_AXIS_tuser,
    SLOT_3_AXIS_tvalid,
    SLOT_4_AXIS_tdata,
    SLOT_4_AXIS_tid,
    SLOT_4_AXIS_tkeep,
    SLOT_4_AXIS_tlast,
    SLOT_4_AXIS_tready,
    SLOT_4_AXIS_tuser,
    SLOT_4_AXIS_tvalid,
    clk,
    resetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_0_AXIS, CLK_DOMAIN test_logic_single_port_ponylink_clk, FREQ_HZ 33000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 3, TUSER_WIDTH 64" *) input [511:0]SLOT_0_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TID" *) input [2:0]SLOT_0_AXIS_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TKEEP" *) input [63:0]SLOT_0_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TLAST" *) input SLOT_0_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TREADY" *) input SLOT_0_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TUSER" *) input [63:0]SLOT_0_AXIS_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TVALID" *) input SLOT_0_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_1_AXIS, CLK_DOMAIN test_logic_single_port_ponylink_clk, FREQ_HZ 33000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 3, TUSER_WIDTH 8" *) input [63:0]SLOT_1_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TID" *) input [2:0]SLOT_1_AXIS_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TKEEP" *) input [7:0]SLOT_1_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TLAST" *) input SLOT_1_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TREADY" *) input SLOT_1_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TUSER" *) input [7:0]SLOT_1_AXIS_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_1_AXIS TVALID" *) input SLOT_1_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_2_AXIS, CLK_DOMAIN test_logic_single_port_ponylink_clk, FREQ_HZ 33000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 8, TDEST_WIDTH 0, TID_WIDTH 3, TUSER_WIDTH 8" *) input [63:0]SLOT_2_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TID" *) input [2:0]SLOT_2_AXIS_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TKEEP" *) input [7:0]SLOT_2_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TLAST" *) input SLOT_2_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TREADY" *) input SLOT_2_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TUSER" *) input [7:0]SLOT_2_AXIS_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_2_AXIS TVALID" *) input SLOT_2_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_3_AXIS, CLK_DOMAIN test_logic_single_port_ponylink_clk, FREQ_HZ 33000000, HAS_TKEEP 0, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 1" *) input [7:0]SLOT_3_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TLAST" *) input SLOT_3_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TREADY" *) input SLOT_3_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TUSER" *) input [0:0]SLOT_3_AXIS_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_3_AXIS TVALID" *) input SLOT_3_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_4_AXIS, CLK_DOMAIN test_logic_single_port_ponylink_clk, FREQ_HZ 33000000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 3, TUSER_WIDTH 64" *) input [511:0]SLOT_4_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TID" *) input [2:0]SLOT_4_AXIS_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TKEEP" *) input [63:0]SLOT_4_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TLAST" *) input SLOT_4_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TREADY" *) input SLOT_4_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TUSER" *) input [63:0]SLOT_4_AXIS_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_4_AXIS TVALID" *) input SLOT_4_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF SLOT_0_AXIS:SLOT_1_AXIS:SLOT_2_AXIS:SLOT_3_AXIS:SLOT_4_AXIS, ASSOCIATED_CLKEN aclken, ASSOCIATED_RESET resetn, CLK_DOMAIN test_logic_single_port_ponylink_clk, FREQ_HZ 33000000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW, TYPE INTERCONNECT" *) input resetn;

  wire [63:0]Conn1_TDATA;
  wire [2:0]Conn1_TID;
  wire [7:0]Conn1_TKEEP;
  wire Conn1_TLAST;
  wire Conn1_TREADY;
  wire [7:0]Conn1_TUSER;
  wire Conn1_TVALID;
  wire [63:0]Conn2_TDATA;
  wire [2:0]Conn2_TID;
  wire [7:0]Conn2_TKEEP;
  wire Conn2_TLAST;
  wire Conn2_TREADY;
  wire [7:0]Conn2_TUSER;
  wire Conn2_TVALID;
  wire [7:0]Conn3_TDATA;
  wire Conn3_TLAST;
  wire Conn3_TREADY;
  wire [0:0]Conn3_TUSER;
  wire Conn3_TVALID;
  wire [511:0]Conn4_TDATA;
  wire [2:0]Conn4_TID;
  wire [63:0]Conn4_TKEEP;
  wire Conn4_TLAST;
  wire Conn4_TREADY;
  wire [63:0]Conn4_TUSER;
  wire Conn4_TVALID;
  wire [511:0]Conn_TDATA;
  wire [2:0]Conn_TID;
  wire [63:0]Conn_TKEEP;
  wire Conn_TLAST;
  wire Conn_TREADY;
  wire [63:0]Conn_TUSER;
  wire Conn_TVALID;
  wire clk_1;
  wire net_slot_0_apc_pc_asserted;
  wire [511:0]net_slot_0_axis_tdata;
  wire [2:0]net_slot_0_axis_tid;
  wire [63:0]net_slot_0_axis_tkeep;
  wire net_slot_0_axis_tlast;
  wire net_slot_0_axis_tready;
  wire [63:0]net_slot_0_axis_tuser;
  wire net_slot_0_axis_tvalid;
  wire net_slot_1_apc_pc_asserted;
  wire [63:0]net_slot_1_axis_tdata;
  wire [2:0]net_slot_1_axis_tid;
  wire [7:0]net_slot_1_axis_tkeep;
  wire net_slot_1_axis_tlast;
  wire net_slot_1_axis_tready;
  wire [7:0]net_slot_1_axis_tuser;
  wire net_slot_1_axis_tvalid;
  wire net_slot_2_apc_pc_asserted;
  wire [63:0]net_slot_2_axis_tdata;
  wire [2:0]net_slot_2_axis_tid;
  wire [7:0]net_slot_2_axis_tkeep;
  wire net_slot_2_axis_tlast;
  wire net_slot_2_axis_tready;
  wire [7:0]net_slot_2_axis_tuser;
  wire net_slot_2_axis_tvalid;
  wire net_slot_3_apc_pc_asserted;
  wire [31:0]net_slot_3_axis_tdata;
  wire net_slot_3_axis_tlast;
  wire net_slot_3_axis_tready;
  wire [0:0]net_slot_3_axis_tuser;
  wire net_slot_3_axis_tvalid;
  wire net_slot_4_apc_pc_asserted;
  wire [511:0]net_slot_4_axis_tdata;
  wire [2:0]net_slot_4_axis_tid;
  wire [63:0]net_slot_4_axis_tkeep;
  wire net_slot_4_axis_tlast;
  wire net_slot_4_axis_tready;
  wire [63:0]net_slot_4_axis_tuser;
  wire net_slot_4_axis_tvalid;
  wire resetn_1;

  assign Conn1_TDATA = SLOT_1_AXIS_tdata[63:0];
  assign Conn1_TID = SLOT_1_AXIS_tid[2:0];
  assign Conn1_TKEEP = SLOT_1_AXIS_tkeep[7:0];
  assign Conn1_TLAST = SLOT_1_AXIS_tlast;
  assign Conn1_TREADY = SLOT_1_AXIS_tready;
  assign Conn1_TUSER = SLOT_1_AXIS_tuser[7:0];
  assign Conn1_TVALID = SLOT_1_AXIS_tvalid;
  assign Conn2_TDATA = SLOT_2_AXIS_tdata[63:0];
  assign Conn2_TID = SLOT_2_AXIS_tid[2:0];
  assign Conn2_TKEEP = SLOT_2_AXIS_tkeep[7:0];
  assign Conn2_TLAST = SLOT_2_AXIS_tlast;
  assign Conn2_TREADY = SLOT_2_AXIS_tready;
  assign Conn2_TUSER = SLOT_2_AXIS_tuser[7:0];
  assign Conn2_TVALID = SLOT_2_AXIS_tvalid;
  assign Conn3_TDATA = SLOT_3_AXIS_tdata[7:0];
  assign Conn3_TLAST = SLOT_3_AXIS_tlast;
  assign Conn3_TREADY = SLOT_3_AXIS_tready;
  assign Conn3_TUSER = SLOT_3_AXIS_tuser[0];
  assign Conn3_TVALID = SLOT_3_AXIS_tvalid;
  assign Conn4_TDATA = SLOT_4_AXIS_tdata[511:0];
  assign Conn4_TID = SLOT_4_AXIS_tid[2:0];
  assign Conn4_TKEEP = SLOT_4_AXIS_tkeep[63:0];
  assign Conn4_TLAST = SLOT_4_AXIS_tlast;
  assign Conn4_TREADY = SLOT_4_AXIS_tready;
  assign Conn4_TUSER = SLOT_4_AXIS_tuser[63:0];
  assign Conn4_TVALID = SLOT_4_AXIS_tvalid;
  assign Conn_TDATA = SLOT_0_AXIS_tdata[511:0];
  assign Conn_TID = SLOT_0_AXIS_tid[2:0];
  assign Conn_TKEEP = SLOT_0_AXIS_tkeep[63:0];
  assign Conn_TLAST = SLOT_0_AXIS_tlast;
  assign Conn_TREADY = SLOT_0_AXIS_tready;
  assign Conn_TUSER = SLOT_0_AXIS_tuser[63:0];
  assign Conn_TVALID = SLOT_0_AXIS_tvalid;
  assign clk_1 = clk;
  assign resetn_1 = resetn;
  bd_5bf6_g_inst_0 g_inst
       (.aclk(clk_1),
        .aresetn(resetn_1),
        .m_slot_0_axis_tdata(net_slot_0_axis_tdata),
        .m_slot_0_axis_tid(net_slot_0_axis_tid),
        .m_slot_0_axis_tkeep(net_slot_0_axis_tkeep),
        .m_slot_0_axis_tlast(net_slot_0_axis_tlast),
        .m_slot_0_axis_tready(net_slot_0_axis_tready),
        .m_slot_0_axis_tuser(net_slot_0_axis_tuser),
        .m_slot_0_axis_tvalid(net_slot_0_axis_tvalid),
        .m_slot_1_axis_tdata(net_slot_1_axis_tdata),
        .m_slot_1_axis_tid(net_slot_1_axis_tid),
        .m_slot_1_axis_tkeep(net_slot_1_axis_tkeep),
        .m_slot_1_axis_tlast(net_slot_1_axis_tlast),
        .m_slot_1_axis_tready(net_slot_1_axis_tready),
        .m_slot_1_axis_tuser(net_slot_1_axis_tuser),
        .m_slot_1_axis_tvalid(net_slot_1_axis_tvalid),
        .m_slot_2_axis_tdata(net_slot_2_axis_tdata),
        .m_slot_2_axis_tid(net_slot_2_axis_tid),
        .m_slot_2_axis_tkeep(net_slot_2_axis_tkeep),
        .m_slot_2_axis_tlast(net_slot_2_axis_tlast),
        .m_slot_2_axis_tready(net_slot_2_axis_tready),
        .m_slot_2_axis_tuser(net_slot_2_axis_tuser),
        .m_slot_2_axis_tvalid(net_slot_2_axis_tvalid),
        .m_slot_3_axis_tdata(net_slot_3_axis_tdata),
        .m_slot_3_axis_tlast(net_slot_3_axis_tlast),
        .m_slot_3_axis_tready(net_slot_3_axis_tready),
        .m_slot_3_axis_tuser(net_slot_3_axis_tuser),
        .m_slot_3_axis_tvalid(net_slot_3_axis_tvalid),
        .m_slot_4_axis_tdata(net_slot_4_axis_tdata),
        .m_slot_4_axis_tid(net_slot_4_axis_tid),
        .m_slot_4_axis_tkeep(net_slot_4_axis_tkeep),
        .m_slot_4_axis_tlast(net_slot_4_axis_tlast),
        .m_slot_4_axis_tready(net_slot_4_axis_tready),
        .m_slot_4_axis_tuser(net_slot_4_axis_tuser),
        .m_slot_4_axis_tvalid(net_slot_4_axis_tvalid),
        .slot_0_axis_tdata(Conn_TDATA),
        .slot_0_axis_tid(Conn_TID),
        .slot_0_axis_tkeep(Conn_TKEEP),
        .slot_0_axis_tlast(Conn_TLAST),
        .slot_0_axis_tready(Conn_TREADY),
        .slot_0_axis_tuser(Conn_TUSER),
        .slot_0_axis_tvalid(Conn_TVALID),
        .slot_1_axis_tdata(Conn1_TDATA),
        .slot_1_axis_tid(Conn1_TID),
        .slot_1_axis_tkeep(Conn1_TKEEP),
        .slot_1_axis_tlast(Conn1_TLAST),
        .slot_1_axis_tready(Conn1_TREADY),
        .slot_1_axis_tuser(Conn1_TUSER),
        .slot_1_axis_tvalid(Conn1_TVALID),
        .slot_2_axis_tdata(Conn2_TDATA),
        .slot_2_axis_tid(Conn2_TID),
        .slot_2_axis_tkeep(Conn2_TKEEP),
        .slot_2_axis_tlast(Conn2_TLAST),
        .slot_2_axis_tready(Conn2_TREADY),
        .slot_2_axis_tuser(Conn2_TUSER),
        .slot_2_axis_tvalid(Conn2_TVALID),
        .slot_3_axis_tdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .slot_3_axis_tlast(Conn3_TLAST),
        .slot_3_axis_tready(Conn3_TREADY),
        .slot_3_axis_tuser(Conn3_TUSER),
        .slot_3_axis_tvalid(Conn3_TVALID),
        .slot_4_axis_tdata(Conn4_TDATA),
        .slot_4_axis_tid(Conn4_TID),
        .slot_4_axis_tkeep(Conn4_TKEEP),
        .slot_4_axis_tlast(Conn4_TLAST),
        .slot_4_axis_tready(Conn4_TREADY),
        .slot_4_axis_tuser(Conn4_TUSER),
        .slot_4_axis_tvalid(Conn4_TVALID));
  bd_5bf6_ila_lib_0 ila_lib
       (.clk(clk_1),
        .probe0(net_slot_0_axis_tdata),
        .probe1(net_slot_0_axis_tid),
        .probe10(net_slot_1_axis_tkeep),
        .probe11(net_slot_1_axis_tuser),
        .probe12(net_slot_1_axis_tvalid),
        .probe13(net_slot_1_axis_tready),
        .probe14(net_slot_1_axis_tlast),
        .probe15(net_slot_1_apc_pc_asserted),
        .probe16(net_slot_2_axis_tdata),
        .probe17(net_slot_2_axis_tid),
        .probe18(net_slot_2_axis_tkeep),
        .probe19(net_slot_2_axis_tuser),
        .probe2(net_slot_0_axis_tkeep),
        .probe20(net_slot_2_axis_tvalid),
        .probe21(net_slot_2_axis_tready),
        .probe22(net_slot_2_axis_tlast),
        .probe23(net_slot_2_apc_pc_asserted),
        .probe24(net_slot_3_axis_tdata),
        .probe25(net_slot_3_axis_tuser),
        .probe26(net_slot_3_axis_tvalid),
        .probe27(net_slot_3_axis_tready),
        .probe28(net_slot_3_axis_tlast),
        .probe29(net_slot_3_apc_pc_asserted),
        .probe3(net_slot_0_axis_tuser),
        .probe30(net_slot_4_axis_tdata),
        .probe31(net_slot_4_axis_tid),
        .probe32(net_slot_4_axis_tkeep),
        .probe33(net_slot_4_axis_tuser),
        .probe34(net_slot_4_axis_tvalid),
        .probe35(net_slot_4_axis_tready),
        .probe36(net_slot_4_axis_tlast),
        .probe37(net_slot_4_apc_pc_asserted),
        .probe4(net_slot_0_axis_tvalid),
        .probe5(net_slot_0_axis_tready),
        .probe6(net_slot_0_axis_tlast),
        .probe7(net_slot_0_apc_pc_asserted),
        .probe8(net_slot_1_axis_tdata),
        .probe9(net_slot_1_axis_tid));
  bd_5bf6_slot_0_apcs_0 slot_0_apcs
       (.aclk(clk_1),
        .aresetn(resetn_1),
        .pc_asserted(net_slot_0_apc_pc_asserted),
        .pc_axis_tdata(Conn_TDATA),
        .pc_axis_tid(Conn_TID),
        .pc_axis_tkeep(Conn_TKEEP),
        .pc_axis_tlast(Conn_TLAST),
        .pc_axis_tready(Conn_TREADY),
        .pc_axis_tuser(Conn_TUSER),
        .pc_axis_tvalid(Conn_TVALID));
  bd_5bf6_slot_1_apcs_0 slot_1_apcs
       (.aclk(clk_1),
        .aresetn(resetn_1),
        .pc_asserted(net_slot_1_apc_pc_asserted),
        .pc_axis_tdata(Conn1_TDATA),
        .pc_axis_tid(Conn1_TID),
        .pc_axis_tkeep(Conn1_TKEEP),
        .pc_axis_tlast(Conn1_TLAST),
        .pc_axis_tready(Conn1_TREADY),
        .pc_axis_tuser(Conn1_TUSER),
        .pc_axis_tvalid(Conn1_TVALID));
  bd_5bf6_slot_2_apcs_0 slot_2_apcs
       (.aclk(clk_1),
        .aresetn(resetn_1),
        .pc_asserted(net_slot_2_apc_pc_asserted),
        .pc_axis_tdata(Conn2_TDATA),
        .pc_axis_tid(Conn2_TID),
        .pc_axis_tkeep(Conn2_TKEEP),
        .pc_axis_tlast(Conn2_TLAST),
        .pc_axis_tready(Conn2_TREADY),
        .pc_axis_tuser(Conn2_TUSER),
        .pc_axis_tvalid(Conn2_TVALID));
  bd_5bf6_slot_3_apcs_0 slot_3_apcs
       (.aclk(clk_1),
        .aresetn(resetn_1),
        .pc_asserted(net_slot_3_apc_pc_asserted),
        .pc_axis_tdata(Conn3_TDATA),
        .pc_axis_tlast(Conn3_TLAST),
        .pc_axis_tready(Conn3_TREADY),
        .pc_axis_tuser(Conn3_TUSER),
        .pc_axis_tvalid(Conn3_TVALID));
  bd_5bf6_slot_4_apcs_0 slot_4_apcs
       (.aclk(clk_1),
        .aresetn(resetn_1),
        .pc_asserted(net_slot_4_apc_pc_asserted),
        .pc_axis_tdata(Conn4_TDATA),
        .pc_axis_tid(Conn4_TID),
        .pc_axis_tkeep(Conn4_TKEEP),
        .pc_axis_tlast(Conn4_TLAST),
        .pc_axis_tready(Conn4_TREADY),
        .pc_axis_tuser(Conn4_TUSER),
        .pc_axis_tvalid(Conn4_TVALID));
endmodule
