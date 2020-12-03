`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/03/2020 02:45:47 PM
// Design Name: 
// Module Name: axis_id_unpacker
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  Unpack AXI-S TID and TKEEP from TUSER signals
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module axis_id_unpacker #(
    parameter DATA_WIDTH = 8,
    parameter TID_WIDTH = 2,
    parameter TUSER_WIDTH = TID_WIDTH + DATA_WIDTH / 8
)(
    input [DATA_WIDTH-1:0] s_axis_tdata,
    input s_axis_tlast,
    input s_axis_tvalid,
    input [TUSER_WIDTH-1:0] s_axis_tuser,
    output s_axis_tready,

    output [DATA_WIDTH-1:0] m_axis_tdata,
    output m_axis_tlast,
    output m_axis_tvalid,
    output [TID_WIDTH-1:0] m_axis_tid,
    output [DATA_WIDTH/8-1:0] m_axis_tkeep,
    input m_axis_tready
);

assign m_axis_tdata = s_axis_tdata;
assign m_axis_tlast = s_axis_tlast;
assign m_axis_tvalid = s_axis_tvalid;
assign {m_axis_tid, m_axis_tkeep} = s_axis_tuser;
assign s_axis_tready = m_axis_tready;

endmodule
