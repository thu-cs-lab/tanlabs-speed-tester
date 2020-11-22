`timescale 1ns / 1ps

module lfsr16(
    input  wire clk,
    input  wire rst,
    input  wire cen,
    input  wire wen,
    input  wire [15:0] din,
    output wire [15:0] dout
);

reg [15:0] lfsr;

assign dout = lfsr;

always @(posedge clk) begin
    if (rst) begin
        lfsr <= 16'b1;
    end else if (cen) begin
		if (wen) lfsr <= din;
	 	else lfsr <= {lfsr[0] ^ lfsr[2] ^ lfsr[3] ^ lfsr[5], lfsr[15:1]};
    end
end

endmodule
