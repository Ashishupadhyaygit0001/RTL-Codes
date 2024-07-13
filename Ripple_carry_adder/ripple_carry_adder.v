module full_adder(input wire a, b, cin,output wire sum, cout);
  assign {cout, sum} = {((a & b) | (b & cin) | (a & cin)), a^b^cin};
endmodule

module ripple_carry_adder #(parameter SIZE = 4) 
  (input wire [SIZE-1:0] A, B,input wire Cin,output wire [SIZE-1:0] S,output wire Cout);
  wire [SIZE:0] carry; 
  assign carry[0] = Cin; 
  
  genvar g;
  generate
    for(g = 0; g < SIZE; g = g + 1) begin : adder
      full_adder fa(
        .a(A[g]),
        .b(B[g]),
        .cin(carry[g]),
        .sum(S[g]),
        .cout(carry[g+1])
      );
    end
  endgenerate
  assign Cout = carry[SIZE]; 
endmodule
