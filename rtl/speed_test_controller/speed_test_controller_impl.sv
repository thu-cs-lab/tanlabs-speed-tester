`timescale 1ns / 1ps

`include "tester_common.svh"

typedef enum {
    STATE_WAIT, STATE_IDLE, STATE_RUNNNING, STATE_STOPPING
} speed_controller_state_t;

module speed_test_controller_impl #(
    parameter TEST_PORT_NUM = 4,
    parameter CLOCK_FREQ = 125000000,
    parameter integer C_S_AXI_DATA_WIDTH = 32,
    parameter integer C_S_AXI_ADDR_WIDTH = 6
) (
    input wire clk,
    input wire rst,
    // AXI lite signals
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_AWADDR,
    input wire [2 : 0] S_AXI_AWPROT,
    input wire  S_AXI_AWVALID,
    output wire  S_AXI_AWREADY,
    input wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_WDATA,
    input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
    input wire  S_AXI_WVALID,
    output wire  S_AXI_WREADY,
    output wire [1 : 0] S_AXI_BRESP,
    output wire  S_AXI_BVALID,
    input wire  S_AXI_BREADY,
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0] S_AXI_ARADDR,
    input wire [2 : 0] S_AXI_ARPROT,
    input wire  S_AXI_ARVALID,
    output wire  S_AXI_ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1 : 0] S_AXI_RDATA,
    output wire [1 : 0] S_AXI_RRESP,
    output wire  S_AXI_RVALID,
    input wire  S_AXI_RREADY,
    // frame generator
    input  wire [TEST_PORT_NUM-1:0] gen_ready,
    // frame checker
    input  wire [TEST_PORT_NUM-1:0] check_ready,
    input  wire port_result_t [TEST_PORT_NUM-1:0] check_results,
    // frame checker & generator
    output wire [TEST_PORT_NUM-1:0] start,
    output wire [TEST_PORT_NUM-1:0] stop,
    output wire port_config_t [TEST_PORT_NUM-1:0] port_config
);

    // AXI clocks
    wire  S_AXI_ACLK, S_AXI_ARESETN;
    assign A_AXI_ACLK = clk;
    assign A_AXI_ARESETN = ~rst;

    // AXI4LITE signals
    localparam integer ADDR_LSB = (C_S_AXI_DATA_WIDTH/32) + 1;
    localparam integer OPT_MEM_ADDR_BITS = 3;
    
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_awaddr;
	reg  	axi_awready;
	reg  	axi_wready;
	reg [1 : 0] 	axi_bresp;
	reg  	axi_bvalid;
	reg [C_S_AXI_ADDR_WIDTH-1 : 0] 	axi_araddr;
	reg  	axi_arready;
	reg [C_S_AXI_DATA_WIDTH-1 : 0] 	axi_rdata;
	reg [1 : 0] 	axi_rresp;
    reg  	axi_rvalid;

    assign S_AXI_AWREADY	= axi_awready;
	assign S_AXI_WREADY	= axi_wready;
	assign S_AXI_BRESP	= axi_bresp;
	assign S_AXI_BVALID	= axi_bvalid;
	assign S_AXI_ARREADY	= axi_arready;
	assign S_AXI_RDATA	= axi_rdata;
	assign S_AXI_RRESP	= axi_rresp;
	assign S_AXI_RVALID	= axi_rvalid;

    /// AXI handshake logic

    // Implement axi_awready generation
	// axi_awready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
    // de-asserted when reset is low.
    
	always_ff @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // slave is ready to accept write address when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_awready <= 1'b1;
	        end
	      else           
	        begin
	          axi_awready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_awaddr latching
	// This process is used to latch the address when both 
	// S_AXI_AWVALID and S_AXI_WVALID are valid. 

	always_ff @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_awaddr <= 0;
	    end 
	  else
	    begin    
	      if (~axi_awready && S_AXI_AWVALID && S_AXI_WVALID)
	        begin
	          // Write Address latching 
	          axi_awaddr <= S_AXI_AWADDR;
	        end
	    end 
	end       

	// Implement axi_wready generation
	// axi_wready is asserted for one S_AXI_ACLK clock cycle when both
	// S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	// de-asserted when reset is low. 

	always_ff @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_wready <= 1'b0;
	    end 
	  else
	    begin    
	      if (~axi_wready && S_AXI_WVALID && S_AXI_AWVALID)
	        begin
	          // slave is ready to accept write data when 
	          // there is a valid write address and write data
	          // on the write address and data bus. This design 
	          // expects no outstanding transactions. 
	          axi_wready <= 1'b1;
	        end
	      else
	        begin
	          axi_wready <= 1'b0;
	        end
	    end 
	end       

	// Implement memory mapped register select and write logic generation
	// The write data is accepted and written to memory mapped registers when
	// axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	// select byte enables of slave registers while writing.
	// These registers are cleared when reset (active low) is applied.
	// Slave register write enable is asserted when valid address and data are available
    // and the slave is ready to accept the write address and write data.

    // address truncated to 9 bits (512 bytes)
    logic busy; // 0x00, read only from AXI side
    logic axi_start; // 0x04, write only from AXI side
    test_duration_t duration; // 0x08, R & W from AXI side
    port_config_t [3:0] port_configs; // 128 bytes, [0x100, 0x180), R & W from AXI side
    port_result_t [3:0] port_results; // 64 bytes, [0x180, 0x1c0), read only from AXI side
    assign port_config = port_configs;

    wire [5:0] axi_awaddr_in_word;
    wire [5:0] axi_araddr_in_word;
    assign axi_awaddr_in_word = axi_awaddr[ADDR_LSB +: 6];
    assign axi_araddr_in_word = axi_araddr[ADDR_LSB +: 6];

    assign slv_reg_wren = axi_wready && S_AXI_WVALID && axi_awready && S_AXI_AWVALID;
    
    always_comb begin
        if (~S_AXI_ARESETN) begin
            axi_start = 1'b0; 
        end else begin
            // start signals (reduce or lowest 8 bits)
            axi_start = slv_reg_wren && axi_awaddr[8:0] == 9'd4 && !busy && S_AXI_WSTRB[0] && (&S_AXI_WDATA[0 +: 8]);
        end
    end

	always_ff @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
        begin
            {duration, port_configs} <= '0;
	    end
	  else begin
	    if (slv_reg_wren)
          begin
            if (axi_awaddr[8:0] == 9'd8) begin
                // test duration (only lowest 13 bits)
                if (S_AXI_WSTRB[0]) duration[0 +: 8] <= S_AXI_WDATA[0 +: 8];
                if (S_AXI_WSTRB[1]) duration[8 +: 5] <= S_AXI_WDATA[8 +: 5];
            end else if (axi_awaddr[8] == 1'b1 && axi_awaddr_in_word <= (8'h80 >> ADDR_LSB)) begin
                // port configs range
                // access MUST be aligned and WSTRB are all ignored
                port_configs[axi_awaddr_in_word * C_S_AXI_DATA_WIDTH +: C_S_AXI_DATA_WIDTH] <= S_AXI_WDATA;
            end
	      end
	  end
	end    

	// Implement write response logic generation
	// The write response and response valid signals are asserted by the slave 
	// when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	// This marks the acceptance of address and indicates the status of 
	// write transaction.

	always_ff @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_bvalid  <= 0;
	      axi_bresp   <= 2'b0;
	    end 
	  else
	    begin    
	      if (axi_awready && S_AXI_AWVALID && ~axi_bvalid && axi_wready && S_AXI_WVALID)
	        begin
	          // indicates a valid write response is available
	          axi_bvalid <= 1'b1;
	          axi_bresp  <= 2'b0; // 'OKAY' response 
	        end                   // work error responses in future
	      else
	        begin
	          if (S_AXI_BREADY && axi_bvalid) 
	            //check if bready is asserted while bvalid is high) 
	            //(there is a possibility that bready is always asserted high)   
	            begin
	              axi_bvalid <= 1'b0; 
	            end  
	        end
	    end
	end   

	// Implement axi_arready generation
	// axi_arready is asserted for one S_AXI_ACLK clock cycle when
	// S_AXI_ARVALID is asserted. axi_awready is 
	// de-asserted when reset (active low) is asserted. 
	// The read address is also latched when S_AXI_ARVALID is 
	// asserted. axi_araddr is reset to zero on reset assertion.

	always_ff @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_arready <= 1'b0;
	      axi_araddr  <= 32'b0;
	    end 
	  else
	    begin    
	      if (~axi_arready && S_AXI_ARVALID)
	        begin
	          // indicates that the slave has acceped the valid read address
	          axi_arready <= 1'b1;
	          // Read address latching
	          axi_araddr  <= S_AXI_ARADDR;
	        end
	      else
	        begin
	          axi_arready <= 1'b0;
	        end
	    end 
	end       

	// Implement axi_arvalid generation
	// axi_rvalid is asserted for one S_AXI_ACLK clock cycle when both 
	// S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	// data are available on the axi_rdata bus at this instance. The 
	// assertion of axi_rvalid marks the validity of read data on the 
	// bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	// is deasserted on reset (active low). axi_rresp and axi_rdata are 
	// cleared to zero on reset (active low).  
	always_ff @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rvalid <= 0;
	      axi_rresp  <= 0;
	    end 
	  else
	    begin    
	      if (axi_arready && S_AXI_ARVALID && ~axi_rvalid)
	        begin
	          // Valid read data is available at the read data bus
	          axi_rvalid <= 1'b1;
	          axi_rresp  <= 2'b0; // 'OKAY' response
	        end   
	      else if (axi_rvalid && S_AXI_RREADY)
	        begin
	          // Read data is accepted by the master
	          axi_rvalid <= 1'b0;
	        end                
	    end
	end    

	// Implement memory mapped register select and read logic generation
	// Slave register read enable is asserted when valid address is available
	// and the slave is ready to accept the read address.
	assign slv_reg_rden = axi_arready & S_AXI_ARVALID & ~axi_rvalid;
	logic [C_S_AXI_DATA_WIDTH-1:0] reg_data_out;
	u16_t test_ms; // elapsed test time
	
	always_comb
    begin
        unique if (axi_araddr[8:0] == 9'd0) begin
            // busy signal (only lowest bit)
            reg_data_out = {31'b0, busy};
        end else if (axi_araddr[8:0] == 9'd8) begin
            // actual duration (only lowest 16 bits)
            reg_data_out = {16'b0, test_ms};
        end else if (axi_araddr[8] == 1'b1 && axi_araddr_in_word <= (8'h80 >> ADDR_LSB)) begin
            // port configs range
            reg_data_out = port_configs[axi_araddr_in_word * C_S_AXI_DATA_WIDTH +: C_S_AXI_DATA_WIDTH];
        end else if (axi_araddr[8] == 1'b1 && axi_araddr_in_word <= (8'hc0 >> ADDR_LSB)) begin
            // port results range
            reg_data_out = port_results[axi_araddr_in_word * C_S_AXI_DATA_WIDTH +: C_S_AXI_DATA_WIDTH];
        end else begin
            reg_data_out = '0;
        end
	end

	// Output register or memory read data
	always_ff @( posedge S_AXI_ACLK )
	begin
	  if ( S_AXI_ARESETN == 1'b0 )
	    begin
	      axi_rdata  <= 0;
	    end 
	  else
	    begin
	      // When there is a valid read address (S_AXI_ARVALID) with 
	      // acceptance of read address by the slave (axi_arready), 
	      // output the read dada 
	      if (slv_reg_rden)
	        begin
	          axi_rdata <= reg_data_out;     // register read data
	        end   
	    end
	end


    // test controller FSM
    speed_controller_state_t state;

    assign busy = rst || (state != STATE_IDLE);

    logic test_start, test_stop;
    assign start = {TEST_PORT_NUM{test_start}};
    assign stop = {TEST_PORT_NUM{test_stop}};

    localparam CYCLE_PER_MS = CLOCK_FREQ / 1000;
    u16_t wait_ms;
    u32_t cycle_counter;

    always_ff @(posedge clk) begin
        if (rst) begin
            state <= STATE_WAIT;
            test_start <= 1'b0;
            test_stop <= 1'b0;
            test_ms <= '0;
            wait_ms <= '0;
            cycle_counter <= '0;
            port_results <= '0;
        end else begin
            unique case (state)
                STATE_WAIT: begin
                    if ((&gen_ready) && (&check_ready)) begin
                        state <= STATE_IDLE;
                    end
                end
                STATE_IDLE: begin
                    if (axi_start) begin
                        test_start <= 1'b1;
                        test_ms <= '0;
                        wait_ms <= '0;
                        cycle_counter <= '0;
                        port_results <= '0;
                        state <= STATE_WAIT;
                    end
                end
                STATE_RUNNNING: begin
                    // stop sending frames when hitting user-defined duration
                    port_results <= check_results;
                    cycle_counter <= cycle_counter + 1;
                    if (cycle_counter + 1 == CYCLE_PER_MS) begin
                        test_ms <= test_ms + 1;
                        if (test_ms + 1 == duration) begin
                            test_start <= 1'b0;
                            test_stop <= 1'b1;
                            cycle_counter <= '0;
                            state <= STATE_STOPPING;
                        end
                    end
                end
                STATE_STOPPING: begin
                    // keep receiving for some time
                    port_results <= check_results;
                    cycle_counter <= cycle_counter + 1;
                    if (cycle_counter + 1 == CYCLE_PER_MS) begin
                        wait_ms <= wait_ms + 1;
                        if (wait_ms + 1 == `WAIT_MS_AFTER_STOP) begin
                            // collect results
                            test_stop <= 1'b0;
                            state <= STATE_WAIT;
                        end
                    end
                end
            endcase
        end
    end

    
endmodule
