`timescale 1ns / 1ps

`include "mux_str.v"

module mux8to1_tb;


 // Inputs

 reg [2:0] Sel;

 reg [7:0] a;



 // Outputs

 wire Out;

 

 //temporary variable

 reg [2:0] count = 3'd0;

 

 // Instantiate the Unit Under Test (UUT)

 mux_str m1 (.out(Out),.sel(Sel),.a(a));


 initial begin
 
	$dumpfile("mux_out.vcd");
	$dumpvars(0,mux8to1_tb);



  // Wait 100 ns for global reset to finish

  #100;

        

  // Add stimulus here

  Sel = 3'd0;

  a = 8'b10101111;

  
  //Selection input generation

  for (count = 0; count < 8; count = count + 1'b1)

  begin

    #20 Sel = count;

  end

 end      

endmodule
