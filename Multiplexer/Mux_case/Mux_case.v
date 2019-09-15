module mux_case(d,sel,q);

input [1:0] sel;
input [3:0] d;
output q;

reg q;
wire [1:0] sel;
wire [3:0] d;

always @(sel or d)
begin 
	case (sel)
		0: q=d[0];
		
		1: q=d[1];
		
		2: q=d[2];
		
		3: q=d[3];
	endcase 
end

endmodule 