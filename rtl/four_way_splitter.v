`timescale 1ns / 1ps

module four_way_splitter #(
    parameter LENGTH = 4    
)(
    input wire [LENGTH - 1:0] din,
    output wire [LENGTH / 4 - 1:0] dout_1,
    output wire [LENGTH / 4 - 1:0] dout_2,
    output wire [LENGTH / 4 - 1:0] dout_3,
    output wire [LENGTH / 4 - 1:0] dout_4
);

    assign {dout_1, dout_2, dout_3, dout_4} = din;

endmodule
