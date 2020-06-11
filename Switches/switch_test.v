
`include "Switch.v"

module mux41_test;

reg s0,s1,i0,i1,i2,i3;
wire out;
integer k;

mux_4to1 DUT (out,s0,s1,i0,i1,i2,i3);

initial begin 
	for (k=0; k<64;k=k+1)
		begin 
			#5 {s0,s1,i0,i1,i2,i3}=k;
			$display ("Sel: %2b, IN: %4b, Out: %b",{s0,s1},{i0,i1,i2,i3},out);
		end
end

initial 
begin 
 $dumpfile ("switch_wave.vcd");
 $dumpvars;
 //$monitor($time,"S0: %b, S1: %b, I0: %b, I1: %b, I2: %b, I3: %b, OUT: %b",s0,s1,i0,i1,i2,i3,out);
 end
endmodule