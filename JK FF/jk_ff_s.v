// Synchronous JK Flip Flop

module jk_ff_s(input reset,input clk,input j,input k,output reg q,output qb);

assign qb=~q;

always @(posedge clk)
if (~reset)
	q<=1'b0;
else
	case ({j,k})
		2'b00:q<=q;
		2'b01: q<=1'b0;
		2'b10: q<=1'b1;
		2'b11: q<=~q;
	endcase
	
endmodule