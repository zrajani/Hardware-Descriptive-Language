`timescale 1ns/100ps
`include"Async.v"

module tb_dff();

reg data,clk,reset;
wire q;

dff_async dut (data,clk,reset,q);

initial
begin
clk=0;

forever #10 clk=~clk;

end
initial begin 

$dumpfile("Async_DFF.vcd");
$dumpvars;

$monitor($time, " data= %b, reset= %b, q= %b",data,reset,q);

reset=1;
data<=0;

#100;
reset=0;
data<=1;
#100;
data<=0;
#100;
data<=1;
#100;
reset=1;
#100 $finish;
end 

endmodule