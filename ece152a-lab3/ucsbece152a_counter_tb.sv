/*
 * Copyright (c) 2023, University of California; Santa Barbara
 * Distribution prohibited. All rights reserved.
 *
 * File: ucsbece152a_counter_tb.sv
 * Description: Starter file for counter testbench.
 */

module ucsbece152a_counter_tb;

  // Parameters
  parameter WIDTH = 3;

  // Clock generation
  logic clk = 0;
  always #5 clk = ~clk;  // 10 time units per cycle

  // Inputs and outputs
  logic rst;
  logic enable;
  logic dir;
  logic [WIDTH-1:0] count;

  // DUT instantiation
  ucsbece152a_counter #(
    .WIDTH(WIDTH)
  ) DUT (
    .clk(clk),
    .rst(rst),
    .count_o(count),
    .enable_i(enable),
    .dir_i(dir)
  );

  // Test sequence
  integer i;

  initial begin
    // Initialize
    rst = 1;
    enable = 1;
    dir = 0;
    @(negedge clk);
    rst = 0;

    // Test 1: Count up (dir = 0) for 15 cycles
    enable = 1;
    dir = 0;
    for (i = 0; i < 15; i++) begin
      @(negedge clk);
    end

    // Test 2: Count down (dir = 1) for 15 cycles
    enable = 1;
    dir = 1;
    for (i = 0; i < 15; i++) begin
      @(negedge clk);
    end

    // Test 3: Enable test with pause and resume
    enable = 1;
    dir = 0;
    for (i = 0; i < 8; i++) begin
      if (i == 2) enable = 0;  // Pause counting
      if (i == 5) enable = 1;  // Resume counting
      @(negedge clk);
    end

    // Test 4: Reset
    rst = 1;
    @(negedge clk);
    rst = 0;

    $stop;
  end

endmodule
