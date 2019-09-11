// Verilog test bench for SR LATCH

`timescale 1ns/100ps
`include "SR_latch.v"

module SR_test;

wire q,qbar;
reg set,reset;

SR_Latch m1(q,qbar,reset,set);

initial
begin

$dumpfile("latch.vcd");
$dumpvars;

$monitor($time, " set= %b, reset= %b, q= %b",set,reset,q);

set=0; reset=0;
#5 reset=1;
#5 reset=0; set=1;
#5 reset=1;
#5 $finish;

end

endmodule