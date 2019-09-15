module mux2to1(a,b,sel,out);
	input a,b,sel;
	output out;
	tri out;
	bufif1 (out,a,sel);
	bufif0 (out,b,sel);
endmodule

module mux4to1(a,sel,out);
	input [3:0] a;
	input [1:0] sel;
	output out;

	wire mux[2:0];

	mux2to1 m1 (a[3],a[2],sel[0],mux[0]),
	        m2 (a[1],a[4],sel[0],mux[1]),
	        m3 (mux[0],mux[1],sel[1],out);
endmodule

module mux_str(a,sel,out);
	input [7:0] a;
	input [2:0] sel;
	output out;

	wire mux[2:0];

	mux4to1 m1 (a[7:4],sel[1:0],mux_1),
	        m2 (a[3:0],sel[1:0],mux_2);
	mux2to1 m3 (mux_1,mux_2,sel[2],out);
endmodule