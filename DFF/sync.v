//Synchronous DFF

module dff(D,clk,reset,Q);

input wire clk,D;
input reset;
output reg Q;

always @ (posedge clk)

begin 
if (!reset)
	Q=0;
else 
	Q=D;
end
endmodule 