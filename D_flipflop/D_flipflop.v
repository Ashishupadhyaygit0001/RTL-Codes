module D_flipflop(input clk, input d, output reg q, output qbar);
always @(posedge clk)
    begin
    q<=d;
    end
    assign qbar=~q;
endmodule

