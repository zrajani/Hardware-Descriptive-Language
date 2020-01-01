// Verilog test bench for SR LATCH

`timescale 1ns/100ps
`include "SR_latch.v"

// module test bench begins
module SR_test;

wire q,qbar;
reg set,reset;

//Design to be tested and how wires are connected
SR_Latch m1(q,qbar,reset,set);

initial
begin


// Output file name and vars level in the output file
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
