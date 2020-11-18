
`timescale 1 ns / 1 ps

	module polylink_slave_v1_0 #
	(
		// Users to add parameters here
		parameter SERDES_REG_IN = 1,
		parameter SERDES_REG_OUT = 1,
		parameter TDATA_WIDTH = 32,
		parameter TUSER_WIDTH = 0,
		parameter MASTER_PARBITS = 1,
		parameter SLAVE_PARBITS = 1,
		// python timings.py 6 19 0.25 1.5
		parameter MASTER_TIMINGS = 80'h1d17100a040f0c090602,
		parameter SLAVE_TIMINGS  = 80'h05040302010907050301
		// User parameters ends
	)
	(
		// Users to add ports here
		input wire clk,
		input wire clk4,
		output wire resetn_out,
		output wire linkerror,
		output wire linkready,
		output wire mode_recv,
		output wire mode_send,

		input  wire [7:0] gpio_i,
		output wire [7:0] gpio_o,

		inout wire data_pin,

		// User ports ends
		// Do not modify the ports beyond this line

		// Ports of Axi Slave Bus Interface axis_in
		output wire  axis_in_tready,
		input wire [TDATA_WIDTH-1 : 0] axis_in_tdata,
		input wire [TUSER_WIDTH-1 : 0] axis_in_tuser,
		input wire  axis_in_tlast,
		input wire  axis_in_tvalid,

		// Ports of Axi Master Bus Interface axis_out
		output wire  axis_out_tvalid,
		output wire [TDATA_WIDTH-1 : 0] axis_out_tdata,
		output wire [(TDATA_WIDTH/8)-1 : 0] axis_out_tstrb,
		output wire [TUSER_WIDTH-1 : 0] axis_out_tuser,
		output wire  axis_out_tlast,
		input wire  axis_out_tready
	);

	// Add user logic here

	wire [SLAVE_PARBITS-1:0] slave_serdes_in;
	wire [SLAVE_PARBITS-1:0] slave_serdes_out;
	wire [SLAVE_PARBITS-1:0] slave_serdes_en;

	assign axis_out_tstrb = {(TDATA_WIDTH / 8){1'b1}};

	ponylink_slave #(
		.M2S_TDATA_WIDTH(TDATA_WIDTH),
		.M2S_TUSER_WIDTH(TUSER_WIDTH),
		.S2M_TDATA_WIDTH(TDATA_WIDTH),
		.S2M_TUSER_WIDTH(TUSER_WIDTH),
		.MASTER_PARBITS(MASTER_PARBITS),
		.MASTER_TIMINGS(MASTER_TIMINGS),
		.SLAVE_PARBITS(SLAVE_PARBITS),
		.SLAVE_TIMINGS(SLAVE_TIMINGS)
	) ponylink_slave_core (
		.clk(clk),
		.resetn_out(resetn_out),
		.linkerror(linkerror),
		.linkready(linkready),
		.mode_recv(mode_recv),
		.mode_send(mode_send),

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

		.serdes_in(slave_serdes_in),
		.serdes_out(slave_serdes_out),
		.serdes_en(slave_serdes_en)
	);

	integer i;
	reg slave_oserdes_last = 0;
	reg [3:0] slave_oserdes_d;
	wire [3:0] slave_iserdes_q;
	reg [2:0] slave_oserdes_t;
	
	always @(posedge clk) begin
		slave_oserdes_t <= {slave_oserdes_t, 1'b1};
		for (i = 0; i < 4; i = i+1) begin
			if (slave_serdes_en[i]) begin
				slave_oserdes_last = slave_serdes_out[i];
				slave_oserdes_t[0] <= 0;
			end
			slave_oserdes_d[i] <= slave_oserdes_last;
		end
	end

	assign slave_serdes_in = slave_iserdes_q;

	wire slave_oq, slave_tq, slave_d;
	IOBUF slave_buf (
		.I(slave_oq),
		.T(slave_tq),
		.O(slave_d),
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
	) slave_oserdes (
		.OFB(),
		.OQ(slave_oq),
		.SHIFTOUT1(),
		.SHIFTOUT2(),
		.TBYTEOUT(),
		.TFB(),
		.TQ(slave_tq),
		.CLK(clk4),
		.CLKDIV(clk),
		.D1(slave_oserdes_d[0]),
		.D2(slave_oserdes_d[1]),
		.D3(slave_oserdes_d[2]),
		.D4(slave_oserdes_d[3]),
		.D5(),
		.D6(),
		.D7(),
		.D8(),
		.OCE(1'b1),
		.RST(1'b0),
		.SHIFTIN1(1'b0),
		.SHIFTIN2(1'b0),
		.T1(&slave_oserdes_t),
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
	) slave_iserdes (
		.O(),
		.Q1(slave_iserdes_q[3]),
		.Q2(slave_iserdes_q[2]),
		.Q3(slave_iserdes_q[1]),
		.Q4(slave_iserdes_q[0]),
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
		.D(slave_d),
		.DDLY(1'b0),
		.OFB(1'b0),
		.OCLKB(1'b0),
		.RST(1'b0),
		.SHIFTIN1(1'b0),
		.SHIFTIN2(1'b0) 
	);

	// User logic ends

	endmodule
