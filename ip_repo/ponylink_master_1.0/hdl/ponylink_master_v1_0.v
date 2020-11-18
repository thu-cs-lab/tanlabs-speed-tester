
`timescale 1 ns / 1 ps

	module ponylink_master_v1_0 #
	(
		// Users to add parameters here
		parameter TDATA_WIDTH = 32,
		parameter TUSER_WIDTH = 1,
		parameter MASTER_PARBITS = 4,
		parameter MASTER_TIMINGS = 80'h110c0805020f0a070401,
		parameter SLAVE_PARBITS = 4,
		parameter SLAVE_TIMINGS = 80'h110c0805020f0a070401

		// User parameters ends
		// Do not modify the parameters beyond this line
	)
	(
		// Users to add ports here
		input wire clk,
		input wire clk4,
		input wire resetn,

		output wire link_error,
		input wire [7:0] gpio_i,
		output wire [7:0] gpio_o,

		inout wire data_pin,

		// User ports ends
		// Do not modify the ports beyond this line

		// Ports of Axi Slave Bus Interface axis_in
		output wire  axis_in_tready,
		input wire [TDATA_WIDTH-1 : 0] axis_in_tdata,
		input wire  axis_in_tlast,
		input wire [TUSER_WIDTH-1 : 0] axis_in_tuser,
		input wire  axis_in_tvalid,

		// Ports of Axi Master Bus Interface axis_out
		output wire  axis_out_tvalid,
		output wire [TDATA_WIDTH-1 : 0] axis_out_tdata,
		output wire [(TDATA_WIDTH/8)-1 : 0] axis_out_tstrb,
		output wire  axis_out_tlast,
		output wire [TUSER_WIDTH-1 : 0] axis_out_tuser,
		input wire  axis_out_tready
	);

	// Add user logic here

	assign axis_out_tstrb = {(TDATA_WIDTH / 8){1'b1}};

	wire [MASTER_PARBITS-1:0] master_serdes_in;
	wire [MASTER_PARBITS-1:0] master_serdes_out;
	wire [MASTER_PARBITS-1:0] master_serdes_en;

	ponylink_master #(
		.M2S_TDATA_WIDTH(TDATA_WIDTH),
		.M2S_TUSER_WIDTH(TUSER_WIDTH),
		.S2M_TDATA_WIDTH(TDATA_WIDTH),
		.S2M_TUSER_WIDTH(TUSER_WIDTH),
		.MASTER_PARBITS(MASTER_PARBITS),
		.MASTER_TIMINGS(MASTER_TIMINGS),
		.SLAVE_PARBITS(SLAVE_PARBITS),
		.SLAVE_TIMINGS(SLAVE_TIMINGS)
	) ponylink_master_core (
		.clk(clk),
		.resetn(resetn),
		.linkerror(link_error),

		.gpio_i(gpio_i),
		.gpio_o(gpio_o),

		.in_tdata(axis_in_tdata),
		.in_tuser(axis_in_tuser),
		.in_tlast(axis_in_tlast),
		.in_tvalid(axis_in_tvalid),
		.in_tready(axis_in_tready),

		.out_tdata(axis_out_tdata),
		.out_tuser(axis_out_tuser),
		.out_tlast(axis_out_tlast),
		.out_tvalid(axis_out_tvalid),
		.out_tready(axis_out_tready),

		.serdes_in(master_serdes_in),
		.serdes_out(master_serdes_out),
		.serdes_en(master_serdes_en)
	);

	integer i;

	reg master_oserdes_last = 0;
	reg [3:0] master_oserdes_d;
	wire [3:0] master_iserdes_q;
	reg [2:0] master_oserdes_t;
	
	always @(posedge clk) begin
		master_oserdes_t <= {master_oserdes_t, 1'b1};
		for (i = 0; i < 4; i = i+1) begin
			if (master_serdes_en[i]) begin
				master_oserdes_last = master_serdes_out[i];
				master_oserdes_t[0] <= 0;
			end
			master_oserdes_d[i] <= master_oserdes_last;
		end
	end

	assign master_serdes_in = master_iserdes_q;

	wire master_oq, master_tq, master_d;
	
	IOBUF master_buf (
		.I(master_oq),
		.T(master_tq),
		.O(master_d),
		.IO(data_pin)
	);

	OSERDESE2 #(
		.DATA_RATE_OQ("SDR"),
		.DATA_RATE_TQ("SDR"),
		.DATA_WIDTH(4),
		.INIT_OQ(1'b0),
		.INIT_TQ(1'b1),
		.SERDES_MODE("MASTER"),
		.SRVAL_OQ(1'b0),
		.SRVAL_TQ(1'b1),
		.TBYTE_CTL("FALSE"),
		.TBYTE_SRC("FALSE"),
		.TRISTATE_WIDTH(1)
	) master_oserdes (
		.OFB(),
		.OQ(master_oq),
		.SHIFTOUT1(),
		.SHIFTOUT2(),
		.TBYTEOUT(),
		.TFB(),
		.TQ(master_tq),
		.CLK(clk4),
		.CLKDIV(clk),
		.D1(master_oserdes_d[0]),
		.D2(master_oserdes_d[1]),
		.D3(master_oserdes_d[2]),
		.D4(master_oserdes_d[3]),
		.D5(),
		.D6(),
		.D7(),
		.D8(),
		.OCE(1'b1),
		.RST(~resetn),
		.SHIFTIN1(1'b0),
		.SHIFTIN2(1'b0),
		.T1(&master_oserdes_t),
		.T2(1'b0),
		.T3(1'b0),
		.T4(1'b0),
		.TBYTEIN(1'b0),
		.TCE(1'b1)
	);

	ISERDESE2 #(
		.DATA_RATE("SDR"),
		.DATA_WIDTH(4),
		.DYN_CLKDIV_INV_EN("FALSE"),
		.DYN_CLK_INV_EN("FALSE"),
		.INIT_Q1(1'b0),
		.INIT_Q2(1'b0),
		.INIT_Q3(1'b0),
		.INIT_Q4(1'b0),
		.INTERFACE_TYPE("NETWORKING"),   // MEMORY, MEMORY_DDR3, MEMORY_QDR, NETWORKING, OVERSAMPLE
		.IOBDELAY("NONE"),
		.NUM_CE(2),
		.OFB_USED("FALSE"),
		.SERDES_MODE("MASTER"),
		.SRVAL_Q1(1'b0),
		.SRVAL_Q2(1'b0),
		.SRVAL_Q3(1'b0),
		.SRVAL_Q4(1'b0) 
	) master_iserdes (
		.O(),
		.Q1(master_iserdes_q[3]),
		.Q2(master_iserdes_q[2]),
		.Q3(master_iserdes_q[1]),
		.Q4(master_iserdes_q[0]),
		.Q5(),
		.Q6(),
		.Q7(),
		.Q8(),
		.SHIFTOUT1(),
		.SHIFTOUT2(),
		.BITSLIP(1'b0),
		.CE1(1'b1),
		.CE2(1'b1),
		.CLKDIVP(1'b0),
		.CLK(clk4),
		.CLKB(~clk4),
		.CLKDIV(clk),
		.OCLK(1'b0), 
		.DYNCLKDIVSEL(1'b0),
		.DYNCLKSEL(1'b0),
		.D(master_d),
		.DDLY(1'b0),
		.OFB(1'b0),
		.OCLKB(1'b0),
		.RST(~resetn),
		.SHIFTIN1(1'b0),
		.SHIFTIN2(1'b0) 
	);

	// User logic ends

	endmodule
