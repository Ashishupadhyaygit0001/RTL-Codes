`include "JKflipflop.v"
`timescale 1ns/1ps

module jk_ff_tb;

reg clk;
reg j;
reg k;  
wire q;

jk_ff dut (.clk(clk), .j(j), .k(k), .q(q));

always #5 clk = ~clk; 

initial begin
    
    $dumpfile("JKFlipFlop.vcd");
    $dumpvars(1,jk_ff_tb);
  clk = 0; 
  j = 0; k = 0; #10;
  j = 0; k = 1; #10;
  j = 1; k = 0; #10;
  j = 1; k = 1; #10;

  $finish; 
end

initial begin
  $monitor("At %t: j = %b, k = %b, q = %b", $time, j, k, q); 
end

endmodule