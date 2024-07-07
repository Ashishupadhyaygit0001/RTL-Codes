`timescale 1ns / 1ps 
`include"T_flipflop.v"

module T_flipflop_tb();

  reg t;
  reg clk;
  reg reset;
  wire q;

  t_ff dut ( .t(t), .clk(clk), .reset(reset), .q(q) );


  always begin
    $dumpfile("T_FlipFlop.vcd");
    $dumpvars(1,T_flipflop_tb);
    clk = 0;
    #5; 
    clk = 1;
    #5;
  end

  initial begin
    t = 0;
    reset = 0;

    reset = 1;
    #10; 
    reset = 0;
    $display("Time T clk rst Q");
    $monitor("%2t %b %b %b %b", $time, t, clk, reset, q);

    t = 1; #10; 
    t = 0; #10;

    reset = 1; #10;
    reset = 0;

    t = 1; #10;
    t = 0; #10;

    $finish;
  end

endmodule