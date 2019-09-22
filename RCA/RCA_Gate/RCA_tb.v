// TEST BENCH FOR RCA 4-bit

`include "RCA.v"

module testAdder;
	
	reg [3:0]A;
	reg [3:0]B;
	reg CarryIn;
	wire[3:0] sum;
	wire carryout;
	
	Four_bit_adder adder (sum,carryout,A,B,CarryIn);
	
	initial
	
		begin 
		
		$dumpfile("RCA_v.vcd");
		$dumpvars(0,testAdder);
		
		A=4'b1001; B=4'b1011; CarryIn=1'b0; 
		#10
		//$display("%b",A);
		//$display("%b",B);
		//$display("%b %b",carryout,sum);		
		
		A=4'b1111; B=4'b1000; CarryIn=1'b1; 
		#10
	    #20 $finish;
		end
		
	initial 
	begin 
		$monitor($time,"a=%b, b=%b, c=%b, sum=%b, cout=%b",A,B,CarryIn,sum,carryout);
	end
	
endmodule