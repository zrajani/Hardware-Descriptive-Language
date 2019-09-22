`include "RCA_n.v"
 
module ripple_carry_adder_tb ();
 
  parameter WIDTH = 4;
 
  reg [WIDTH-1:0] r_ADD_1 = 0;
  reg [WIDTH-1:0] r_ADD_2 = 0;
  wire [WIDTH-1:0]  w_RESULT;
   
  ripple_adder #(.WIDTH(WIDTH)) ripple_carry_inst
    (
     .a0(r_ADD_1),
     .a1(r_ADD_2),
     .sum(w_RESULT)
     );
 
  initial
    begin
      #10;
      r_ADD_1 = 2'b00;
      r_ADD_2 = 2'b01;
      #10;
      r_ADD_1 = 2'b10;
      r_ADD_2 = 2'b01;
      #10;
      r_ADD_1 = 2'b01;
      r_ADD_2 = 2'b11;
      #10;
      r_ADD_1 = 2'b11;
      r_ADD_2 = 2'b11;
      #10;
    end
 
endmodule // ripple_carry_adder_tb