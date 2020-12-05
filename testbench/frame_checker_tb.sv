`timescale 1ns / 1ps

`include "tester_common.svh"

module frame_checker_tb(

);

    logic clk;
    logic rst;
    logic start, stop;
    port_config_t port_config;
    port_result_t port_result;

    wire [511:0] axis_data;
    wire axis_ready, axis_valid, axis_last;
    wire [2:0] axis_id;
    wire [63:0] axis_user, axis_keep;

    logic axis_upstream_ready;
    initial begin
        axis_upstream_ready = 1'b0;
    end

    always #24 axis_upstream_ready = ~axis_upstream_ready;

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
        @(negedge frame_generator_dut.axis_m_last)
        @(negedge frame_generator_dut.axis_m_last)
        @(negedge frame_generator_dut.axis_m_last)
        @(negedge clk) stop = 1'b1;
        @(negedge clk) stop = 1'b0;
    end

    frame_generator_impl frame_generator_dut(
        .clk,
        .rst,
        .start,
        .stop,
        .port_config,
        .axis_m_ready(axis_ready),
        .axis_m_valid(axis_valid),
        .axis_m_id(axis_id),
        .axis_m_user(axis_user),
        .axis_m_last(axis_last),
        .axis_m_keep(axis_keep),
        .axis_m_data(axis_data)
    );

    frame_checker_impl frame_checker_dut(
        .clk,
        .rst,
        .start,
        .stop,
        .result(port_result),
        .axis_s_ready(axis_ready),
        .axis_s_valid(axis_valid),
        .axis_s_id(axis_id),
        .axis_s_user(axis_user),
        .axis_s_last(axis_last),
        .axis_s_keep(axis_keep),
        .axis_s_data(axis_data),
        .axis_m_ready(axis_upstream_ready)
    );


endmodule
