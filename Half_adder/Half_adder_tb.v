`timescale 1ns / 1ps 
`include"Half_adder.v"
module ha_tb();
reg a,b;
wire s,cout;
half_adder ha(a,b,s,cout);
initial begin
     $dumpfile("Half_adder.vcd");
    $dumpvars(1,ha_tb);
 $monitor("At time %0t: a=%b b=%b, sum=%b, carry=%b",$time, a,b,s,cout);
 a = 0; b = 0;
 #1;
 a = 0; b = 1;
 #1;
 a = 1; b = 0;
 #1;
 a = 1; b = 1;
 a = 1; b = 0;
 #1;
 a = 0; b = 1;
 a = 0; b = 0;
 #1;
 a = 0; b = 1;
 a = 1; b = 1;
 #1;
 a = 1; b = 1;
a = 0; b = 0;
 #1;
 a = 0; b = 1;
 end
endmodule