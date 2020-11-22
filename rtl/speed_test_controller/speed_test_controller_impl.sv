`timescale 1ns / 1ps

`include "tester_common.svh"

module speed_test_controller_impl #(
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
    // frame generator
    input  wire [TEST_PORT-1:0] gen_ready,
    // frame checker
    input  wire [TEST_PORT-1:0] check_ready,
    input  wire port_result_t [TEST_PORT-1:0] check_results,
    // frame checker & generator
    output wire [TEST_PORT-1:0] start,
    output wire [TEST_PORT-1:0] stop,
    output wire port_config_t [TEST_PORT-1:0] port_config
);


    // STATE_IDLE
    // STATE_TESTING
    // STATE_FINISHED
    
endmodule
