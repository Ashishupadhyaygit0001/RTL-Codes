module t_ff (input clk,input reset, input t,output reg q);

always @(posedge clk) begin
  if (reset) 
    q <= 1'b0;
  else 
    q <= ~q;
    
  if (t)
    q <= ~q;
end

endmodule
