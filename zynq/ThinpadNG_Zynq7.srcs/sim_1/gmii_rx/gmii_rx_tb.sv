module gmii_rx_tb ();

reg clk, reset; 
wire [3:0] count; 
  
logic [7:0] frame [42] = '{
    8'h00, 8'he0, 8'h4c, 8'h68, 8'h00, 8'hbb, 8'h00, 8'h0a, 8'h35, 8'h00, 8'h1e, 8'h53, 8'h08, 8'h06, 8'h00, 8'h01, 8'h08, 8'h00, 8'h06, 8'h04, 8'h00, 8'h02, 8'h00, 8'h0a, 8'h35, 8'h00, 8'h1e, 8'h53, 8'hc0, 8'ha8, 8'h01, 8'h02, 8'h00, 8'he0, 8'h4c, 8'h68, 8'h00, 8'hbb, 8'hc0, 8'ha8, 8'h01, 8'h01
};

initial begin 
    clk = 0; 
    reset = 0;
    gmii_rx_dv = 0;
    gmii_rx_er = 0;
    gmii_rxd = 8'h0;

    #5 reset = 1;
    #20 reset = 0;

    for (int i = 0; i < 72; i++) begin
        send(frame[i]);
    end

    @(posedge clk);
    gmii_rx_dv = 0;

    repeat(50) begin
        @(posedge clk);
    end

    $finish;
end 

always #5 clk = !clk; 

wire [7:0] m_axis_tdata;
wire m_axis_tvalid;
wire m_axis_tlast;
wire m_axis_tuser;

reg [7:0] gmii_rxd;
reg gmii_rx_dv;
reg gmii_rx_er;

axis_gmii_rx dut(
	.clk             (clk             ),
    .rst             (reset           ),
    .gmii_rxd        (gmii_rxd        ),
    .gmii_rx_dv      (gmii_rx_dv      ),
    .gmii_rx_er      (gmii_rx_er      ),
    .m_axis_tdata    (m_axis_tdata    ),
    .m_axis_tvalid   (m_axis_tvalid   ),
    .m_axis_tlast    (m_axis_tlast    ),
    .m_axis_tuser    (m_axis_tuser    ),
    .ptp_ts          (                ),
    .clk_enable      ('1              ),
    .mii_select      ('1              ),
    .start_packet    (start_packet    ),
    .error_bad_frame (error_bad_frame ),
    .error_bad_fcs   (error_bad_fcs   )
);

task send(input [7:0] data);
    @(posedge clk);
    gmii_rx_dv = 1;
    gmii_rxd = data;
endtask

endmodule