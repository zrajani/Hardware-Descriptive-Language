// Asynchronous D Flip Flop 

module dff_async(data,clk,reset,q);

input data,clk,reset;
output q;

reg q;

always @(posedge clk or negedge reset)
begin
if (~reset)
	q<=1'b0;
else 
	q<=data;
end

endmodule