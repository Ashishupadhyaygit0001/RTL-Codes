`timescale 1ns / 1ps 
`include"Full_adder.v"
module fa_tb;
 reg a, b, c;
 wire s, c_out;
 
 full_adder fa(a, b, c, s, c_out);
 
 initial begin
      $dumpfile("Full_adder.vcd");
    $dumpvars(1,fa_tb);
 $monitor("At time %0t: a=%b b=%b, cin=%b, sum=%b, carry=%b",$time,
a,b,c,s,c_out);
 a = 0; b = 0; c = 0; #1;
 a = 0; b = 0; c = 1; #1;
 a = 0; b = 1; c = 0; #1;
 a = 0; b = 1; c = 1; #1;
 a = 1; b = 0; c = 0; #1;
 a = 1; b = 0; c = 1; #1;
 a = 1; b = 1; c = 0; #1;
 a = 1; b = 1; c = 1;
 end
endmodule