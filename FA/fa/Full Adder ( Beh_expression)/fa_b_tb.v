`timescale 1ns/100ps
`include "fa_b.v"

module fa_b_tb;
	reg a,b,c;
	wire s,co;
	
	fa_b F1 (s,co,a,b,c);
	
	initial
	begin
		$dumpfile ("fab.vcd");
		$dumpvars (0,fa_b_tb);
		a=0; b=0; c=0;
		#10 a=1; b=0; c=0;
		#10 a=1; b=0; c=1;
		#5 $finish; 
	end
	initial
		begin
			$monitor($time,"a=%b, b=%b, c=%b, sum=%b, cout=%b",a,b,c,s,co);
		end
	
endmodule