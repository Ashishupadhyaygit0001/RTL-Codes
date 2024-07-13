`include "ripple_carry_adder.v"
`timescale 1ns/1ps

module RCA_TB;
  wire [3:0] S;
  wire Cout;
  reg [3:0] A, B;
  reg Cin;
  wire [4:0] add;

  ripple_carry_adder #(4) rca(A, B, Cin, S, Cout);
  assign add = {Cout, S};

  initial begin
    $monitor("A = %b, B = %b, Cin = %b --> S = %b, Cout = %b, Addition = %0d", A, B, Cin, S, Cout, add);
    A = 4'b0001; B = 4'b0000; Cin = 1'b0; #3;
    A = 4'b0010; B = 4'b0100; Cin = 1'b1; #3;
    A = 4'hb; B = 4'h6; Cin = 1'b0; #3;
    A = 4'b0101; B = 4'b0011; Cin = 1'b1; #3;
    $finish;
  end

  initial begin
    $dumpfile("Ripple_carry_adder.vcd");
    $dumpvars;
  end
endmodule
