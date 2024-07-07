module sr_flipflop(input clk, input reset, input s, input r, output reg q);
always @(posedge clk)
    begin
      if (reset) 
      begin
        q<=1'b0;
      end
      else
        case ({s,r})
            2'b10: q<=1'b1;
            2'b01: q<=1'b0; 
            default: q<=q;
        endcase
    end
endmodule    
