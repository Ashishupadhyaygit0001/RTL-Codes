
`include "4bit_adder_subtractor.v"
`timescale 1ns/1ps

module RCAS_TB;
  wire [3:0] S;
  wire Cout;
  reg [3:0] A, B;
  reg ctrl;

  ripple_carry_adder_subtractor #(4) rcas(A, B, ctrl, S, Cout);

  initial begin
    $monitor("CTRL=%b: A = %b, B = %b --> S = %b, Cout = %b", ctrl, A, B, S, Cout);
    ctrl = 0;
    A = 4'b0001; B = 4'b0000;
    #3 A = 4'b0010; B = 4'b0100;
    #3 A = 4'hb; B = 4'h6;
    #3 A = 4'b0101; B = 4'b0011;
    ctrl = 1;
    A = 4'b0001; B = 4'b0000;
    #3 A = 4'b0010; B = 4'b0100;
    #3 A = 4'hb; B = 4'h6;
    #3 A = 4'b0101; B = 4'b0011;
    #3 $finish;
  end

  initial begin
    $dumpfile("ripple_carry_adder_subtractor.vcd");
    $dumpvars;
  end
endmodule
