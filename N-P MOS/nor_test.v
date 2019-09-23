`timescale 1ns/100ps
`include"nor_np.v"

module test_np;

reg A,B;
wire out;

nor_np DUT (out,A,B);

initial
begin

	A=1'b0; B=1'b0;
	#5 A=1'b0; B=1'b1;
	#5 A=1'b1; B=1'b0;
	#5 A=1'b1; B=1'b1;

end

initial 
begin 

		$dumpfile("nor-gate.vcd");
		$dumpvars;
		$monitor($time, "A=%b, B=%b, OUT=%b",A,B,out);
end 
endmodule