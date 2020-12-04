//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Command: generate_target bd_5bf6.bd
//Design : bd_5bf6
//Purpose: IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "bd_5bf6,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=bd_5bf6,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=3,numReposBlks=3,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=SBD,synth_mode=Global}" *) (* HW_HANDOFF = "test_logic_single_port_system_ila_0_0.hwdef" *) 
module bd_5bf6
   (SLOT_0_AXIS_tdata,
    SLOT_0_AXIS_tid,
    SLOT_0_AXIS_tkeep,
    SLOT_0_AXIS_tlast,
    SLOT_0_AXIS_tready,
    SLOT_0_AXIS_tuser,
    SLOT_0_AXIS_tvalid,
    clk,
    resetn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME SLOT_0_AXIS, CLK_DOMAIN bd_5bf6_clk, FREQ_HZ 62500000, HAS_TKEEP 1, HAS_TLAST 1, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.000, TDATA_NUM_BYTES 64, TDEST_WIDTH 0, TID_WIDTH 3, TUSER_WIDTH 64" *) input [511:0]SLOT_0_AXIS_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TID" *) input [2:0]SLOT_0_AXIS_tid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TKEEP" *) input [63:0]SLOT_0_AXIS_tkeep;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TLAST" *) input SLOT_0_AXIS_tlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TREADY" *) input SLOT_0_AXIS_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TUSER" *) input [63:0]SLOT_0_AXIS_tuser;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 SLOT_0_AXIS TVALID" *) input SLOT_0_AXIS_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF SLOT_0_AXIS, ASSOCIATED_CLKEN aclken, ASSOCIATED_RESET resetn, CLK_DOMAIN bd_5bf6_clk, FREQ_HZ 62500000, INSERT_VIP 0, PHASE 0.000" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW, TYPE INTERCONNECT" *) input resetn;

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
  wire resetn_1;

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
        .slot_0_axis_tdata(Conn_TDATA),
        .slot_0_axis_tid(Conn_TID),
        .slot_0_axis_tkeep(Conn_TKEEP),
        .slot_0_axis_tlast(Conn_TLAST),
        .slot_0_axis_tready(Conn_TREADY),
        .slot_0_axis_tuser(Conn_TUSER),
        .slot_0_axis_tvalid(Conn_TVALID));
  bd_5bf6_ila_lib_0 ila_lib
       (.clk(clk_1),
        .probe0(net_slot_0_axis_tdata),
        .probe1(net_slot_0_axis_tid),
        .probe2(net_slot_0_axis_tkeep),
        .probe3(net_slot_0_axis_tuser),
        .probe4(net_slot_0_axis_tvalid),
        .probe5(net_slot_0_axis_tready),
        .probe6(net_slot_0_axis_tlast),
        .probe7(net_slot_0_apc_pc_asserted));
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
endmodule
