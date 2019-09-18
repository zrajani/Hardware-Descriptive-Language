
`include "jk_ff_s.v"

module test;

reg clk=0;
reg j=0;
reg k=0;
reg reset=1;
wire q, qnot;

jk_ff_s dut(reset, clk,j,k,q,qb);

initial
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
	$monitor("clk=%b,Input-> JK =%b%b, Reset = %b, Output-> Q =%b, Qbar=%b",clk,j,k, reset,q,qb);
	
	forever begin
	clk=0;
	#5 clk=1;
	#5 clk=0;
	end
	end
	initial begin
	j=0; k=0; reset=1;
	#4 j=1; k=1; reset=0;
	#40 reset=1;
	#10 j=0; k=1;
	#10 j=1; k=0;
	#10 j=0; k=0;
	#10 j=1; k=1;
	#10 reset=0;
	#10 j=1; k=0;
	#20 $finish;
	end
endmodule