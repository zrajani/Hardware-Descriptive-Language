module mux_if(sel,d,q);

input [1:0] sel;
input [3:0] d;
output q;

reg q;
wire [1:0] sel;
wire [3:0] d;

always @(sel or d)
begin 

	if (sel==0)

		q=d[0];
		
	if (sel==1)
	
		q=d[1];
	
	if (sel==2)
		
		q=d[2];
	
	if (sel==3)
		
		q=d[3];
end

endmodule 