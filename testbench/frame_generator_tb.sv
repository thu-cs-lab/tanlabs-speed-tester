`timescale 1ns / 1ps

`include "tester_common.svh"

module frame_generator_tb(

);

    logic clk;
    logic rst;
    logic start, stop;
    port_config_t port_config;

    always #8 clk = ~clk;

    initial begin
        port_config = '0;
        port_config.enable = 1'b1;
        port_config.frame_size = 100;
        port_config.src_ip = ~32'h12345678;
        port_config.dst_ip = ~32'h87654321;
        port_config.src_mac = ~48'haabbccddeeff;
        port_config.dst_mac = ~48'h112233445566;
        clk = 1'b0;
        rst = 1'b1;
        stop = 1'b0;
        @(posedge clk)
        @(negedge clk) begin 
            rst = 1'b0;
            start = 1'b1;
        end
        @(negedge clk) start = 1'b0;
        @(negedge frame_generator_dut.axis_m_last)
        @(negedge clk) stop = 1'b1;
        @(negedge clk) stop = 1'b0;
    end

    logic axis_ready;
    initial begin
        axis_ready = 1'b0;
    end

    always #16 axis_ready = ~axis_ready;

    frame_generator_impl frame_generator_dut(
        .clk,
        .rst,
        .start,
        .stop,
        .port_config,
        .axis_m_ready(axis_ready)
    );

endmodule
