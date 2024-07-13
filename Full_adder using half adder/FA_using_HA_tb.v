`timescale 1ns / 1ps 
`include"Full_adder_using_half_adder.v"
module tb_FA();
 reg a, b, c;
 wire s, c_out;
 
 full_adder_2 fa(a, b, c, s, c_out);
 
 initial begin
        $dumpfile("Full_adder_using_half_adder.vcd");
    $dumpvars(1,tb_FA);
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