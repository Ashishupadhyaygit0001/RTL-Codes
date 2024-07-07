`timescale 1ns/1ns
`include"D_flipflop.v"
module dff();
reg d;
reg clk;
wire q;
wire qbar;
D_flipflop dut(.d(d), .clk(clk), .q(q), .qbar(qbar));
always #5 clk=~clk;
initial  
    begin 
           $dumpfile("D_FlipFlop.vcd");
           $dumpvars(1,dff);
        clk=0;
        #10 d=0;
        #10 d=1;
        #10 d=0;
        #10 d=1;
        #10 d=0;
#10 d=1;
        #10 d=0;
        #10 d=1;
        $finish;
    end

initial begin
  $monitor("At %t: d = %b, q = %b, qbar = %b", $time, d, q, qbar);
end

endmodule
