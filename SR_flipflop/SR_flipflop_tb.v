`timescale 1ns/1ns
`include"SR_flipflop.v"
module sr_ff();
reg clk;
reg reset;
reg s;
reg r;
wire q;
sr_flipflop dut(.clk(clk), .reset(reset), .s(s),.r(r),.q(q));
initial begin
    $dumpfile("SR_FlipFlop.vcd");
    $dumpvars(1,sr_ff);
    clk=0;
    forever #5 clk= ~clk;
end

initial begin 
    reset=1; s=0; r=0;
    #15 reset=0;
    #10 s=1; r=0;
    #10 s=0; r=1;
    #10 s=0; r=0;
    #10 $finish;
    end
initial begin 
    $monitor("At %t: s=%b,r=%b, reset=%b, q=%b",$time,s,r,reset,q);
end
endmodule    
