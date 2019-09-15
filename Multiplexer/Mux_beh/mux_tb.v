`timescale 1ns / 1ps

`include "Mux_beh.v"

module mux_tb;


 // Inputs

 reg [1:0] sel;

 reg [3:0] in;



 // Outputs

 wire out;


 // Instantiate the Unit Under Test (UUT)

 mux_beh m1 (in,sel,out);


 initial begin

	$dumpfile("mux_out.vcd");
	$dumpvars(0,mux_tb);

   #10 in=4'b0011;

   #10 sel=2'b00;

   #10 sel=2'b01;

   #10 sel=2'b10;

   #10 sel=2'b11;

   #10 $finish;

  end
  
initial 
	begin 
		$monitor($time,"in=%b, sel=%b , out=%b ",in,sel,out);
	end   

endmodule