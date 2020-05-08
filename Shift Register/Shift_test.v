//Program shift register Test bench


`timescale 1ns/1ps
`include "Shift Register.v"


module uni_shift_8b_tst;
  reg [7:0] ip;
  reg [1:0] sh_ro_lt_rt;
  reg load,rst_a,clk;
  wire [7:0] op;


   uni_shift_8b u1 (.op(op), .ip(ip), .sh_ro_lt_rt(sh_ro_lt_rt), .load(load) , .rst_a(rst_a) , .clk(clk));

initial
  begin
     clk=1'b1;
     forever #50 clk=~clk;   
  end
  
   initial
     begin
    ip = 8'b11001100;
    rst_a = 1'b1;
    load = 1'b1;
    sh_ro_lt_rt = 2'b00;
    #100;
    
    ip = 8'b10001100;
    rst_a = 1'b0;
    load = 1'b1;
    sh_ro_lt_rt = 2'b01;
    #100;
    
    ip = 8'b11001100;

    load = 1'b0;
    sh_ro_lt_rt = 2'b01;
    #100;
    
    ip = 8'b10101101;
    
    load = 1'b1;
    sh_ro_lt_rt = 2'b01;
    #100;
    
    ip = 8'b11001101;

    load = 1'b0;
    sh_ro_lt_rt = 2'b01;
    #100;

    ip = 8'b11101100;
    load = 1'b1;
    sh_ro_lt_rt = 2'b10;
    #100;

    ip = 8'b11110000;
    load = 1'b0;
    sh_ro_lt_rt = 2'b10;
    #100;

    ip = 8'b11001100;
    load = 1'b1;
    sh_ro_lt_rt = 2'b11;
    #100;

    ip = 8'b11001101;
    load = 1'b0;
    sh_ro_lt_rt = 2'b11;
    #100;
    
    ip = 8'b11001000;
    load = 1'b1;
    sh_ro_lt_rt = 2'b11;
    #100;
    $finish;
 end // initial begin
 
 initial 
 begin 
	$dumpfile("Shift Wave.vcd");
	$dumpvars;
	$monitor("Input=%b, Load = %b, Shift R/L=%b, Output=%b",ip,load,sh_ro_lt_rt,op);
 end
endmodule  
