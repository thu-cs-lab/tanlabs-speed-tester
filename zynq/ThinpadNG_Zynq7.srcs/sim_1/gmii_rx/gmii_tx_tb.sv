module gmii_tx_tb ();

reg clk, reset; 
wire [3:0] count; 
  
logic [7:0] frame [42] = '{
    8'hff, 8'hff, 8'hff, 8'hff, 8'hff, 8'hff, 8'h50, 8'heb, 8'h71, 8'h22, 8'ha8, 8'hbc, 8'h08, 8'h06, 8'h00, 8'h01, 8'h08, 8'h00, 8'h06, 8'h04, 8'h00, 8'h01, 8'h50, 8'heb, 8'h71, 8'h22, 8'ha8, 8'hbc, 8'hc0, 8'ha8, 8'h01, 8'h09, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'h00, 8'hc0, 8'ha8, 8'h01, 8'h16
};


initial begin 
    clk = 0; 
    reset = 0;
    s_axis_tdata = '0;
    s_axis_tvalid = '0;
    s_axis_tlast = '0;
    s_axis_tuser = '0;

    #5 reset = 1;
    #20 reset = 0;

    s_axis_tdata = frame[0];

    @(posedge clk);
    s_axis_tvalid = 1;
    // @(s_axis_tready);
    @(posedge clk);
    s_axis_tvalid = 0;

    for (int i = 1; i < 41; i++) begin
        send(frame[i]);
    end

    send_last(frame[41]);

    repeat(100) begin
        @(posedge clk);
    end


    // // test another round
    // s_axis_tdata = frame[0];

    // // @(posedge clk);
    // // s_axis_tvalid = 1;
    // @(s_axis_tready);

    // for (int i = 1; i < 41; i++) begin
    //     send(frame[i]);
    // end

    // send_last(frame[41]);

    // repeat(100) begin
    //     @(posedge clk);
    // end

    $finish;
end 

always #5 clk = !clk; 

reg [7:0] s_axis_tdata;
reg       s_axis_tvalid;
reg       s_axis_tlast;
reg       s_axis_tuser;
wire      s_axis_tready;

wire [7:0] gmii_txd;
wire gmii_tx_en;
wire gmii_tx_er;

axis_gmii_tx_fifo dut(
	.clk                 (clk),
    .rst                 (reset),
    .s_axis_tdata        (s_axis_tdata),
    .s_axis_tvalid       (s_axis_tvalid),
    .s_axis_tready       (s_axis_tready),
    .s_axis_tlast        (s_axis_tlast),
    .s_axis_tuser        (s_axis_tuser),
    .gmii_txd            (gmii_txd),
    .gmii_tx_en          (gmii_tx_en),
    .gmii_tx_er          (gmii_tx_er),
    .start_packet        (),
    .error_underflow     ()
);

task send(input [7:0] data);
    s_axis_tvalid = 0;
    @(posedge clk);
    s_axis_tdata = data;
    s_axis_tvalid = 1;
    @(posedge clk);
    s_axis_tvalid = 0;
endtask

task send_last(input [7:0] data);
    s_axis_tvalid = 0;
    @(posedge clk);
    s_axis_tdata = data;
    s_axis_tvalid = 1;
    s_axis_tlast = 1;
    @(posedge clk);
    s_axis_tvalid = 0;
    s_axis_tlast = 0;
endtask


endmodule