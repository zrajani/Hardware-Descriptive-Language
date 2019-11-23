`timescale 1ns/100ps
`include"sync.v"

module tb_dff();

reg D,clk,reset;
wire Q;

integer i;

dff dut (D,clk,reset,Q);

initial
//begin

clk=0;

always 
    #100 clk=~clk;

//end

initial begin 

$dumpfile("sync_DFF.vcd");
$dumpvars;

$monitor("Clock=%d, D=%d, Q=%d", clk,D,Q);

D<=1;reset=1;
#200 D<=0;reset=1;
#200 D<=0; reset=0;
#200 D<=1; reset=0;
#40 $finish;
end 

endmodule