// Up-Down Counter (Synchronous Clear)

module counter (q,clk,rst,up);

	input clk,rst,up;
	output reg [3:0] q;
	
	always @(posedge clk)
	begin
	
		if (up==1)
		begin
			if (rst|q==4'b1111)
				q<=4'b0000;
			else
				q<=q+4'b1;
		end
		else
		begin
			if (rst|q==4'b0000)
				q<=4'b1111;
				
			else
				
				q<=q-1;
			
		end
	end
endmodule