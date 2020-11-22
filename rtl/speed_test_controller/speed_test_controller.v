`timescale 1ns / 1ps

module speed_test_controller #(
    parameter MEM_ADDR_WIDTH = 9,
    parameter TEST_PORT = 4
) (
    input wire clk,
    input wire rst,
    // control memory
    output wire mem_we,
    output wire [MEM_ADDR_WIDTH-1:0] mem_addr,
    output wire [63:0] mem_din,
    input  wire [63:0] mem_dout,
    // frame generatir
    input  wire [TEST_PORT-1:0] gen_ready,
    // frame checker
    input  wire [TEST_PORT-1:0] check_ready,
    input  wire [TEST_PORT-1:0][127:0] check_results,
    // frame checker & generator
    output wire [TEST_PORT-1:0] start,
    output wire [TEST_PORT-1:0] stop,
    output wire [TEST_PORT-1:0][191:0] port_config
);

    speed_test_controller_impl #(
        .MEM_ADDR_WIDTH(MEM_ADDR_WIDTH),
        .TEST_PORT(TEST_PORT)
    ) speed_test_controller_inst (
        .clk(clk),
        .rst(rst),
        .mem_we(mem_we),
        .mem_addr(mem_addr),
        .mem_din(mem_din),
        .mem_dout(mem_dout),
        .gen_ready(gen_ready),
        .check_ready(check_ready),
        .check_results(check_results),
        .start(start),
        .stop(stop),
        .port_config(port_config)
    );
    
endmodule
