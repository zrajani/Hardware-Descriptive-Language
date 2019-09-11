`include "counter.v"

module test_counter;

	reg clk,rst,up;
	wire [3:0]q;
	
	counter c1(.q(q),.clk(clk),.rst(rst),.up(up));
	
	initial 
	begin 
		rst=1;
		up=0;
		clk=1;
	end
	
	always #5 clk=~clk;
	always #80 rst=~rst;
	always #160 up=~up;
	//#10 $finish;
	
	initial
	begin 
		$dumpfile("count.vcd");
		$dumpvars(0,test_counter);
		//$monitor ($time,"Count: %d",q);
	end
	
endmodule 