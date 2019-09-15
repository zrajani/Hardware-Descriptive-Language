module mux_gate( in,sel,out);

input[1:0] sel;
input[3:0] in;
output out;

wire sel0bar,sel1bar,t0,t1,t2,t3;

not N0 (sel0bar, sel[0]);
not N1 (sel1bar, sel[1]);

and A0 (t0, in[0], sel1bar, sel0bar); // select when sel=00
and A1 (t1, in[1], sel1bar, sel[0]); // select when sel=01
and A2 (t2, in[2], sel[1], sel0bar); // select when sel=10
and A3 (t3, in[3], sel[1], sel[0]); // select when sel=11

or O1 (out, t0, t1, t2, t3);

endmodule