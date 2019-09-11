`timescale 1ns/100ps
`include "demux1to4.v"

module tb_demux;

reg in;
reg [1:0] sel;

wire out0,out1,out2,out3;

demux1to4 d1 (in,sel,out0,out1,out2,out3);

initial begin

$dumpfile("demux1to4.vcd");
$dumpvars(0,tb_demux);

#100;
in=1;
sel=0; #100;
sel=1; #100;
sel=2; #100;
sel=3; #100;
in=0;
#100 $finish;
end

initial 
	begin 
		$monitor($time,"in=%b, sel=%b, out0=%b, out1=%b, out2=%b,out3= %b",in,sel,out0,out1,out2,out3);
	end
	
endmodule