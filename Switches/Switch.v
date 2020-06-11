module mux_4to1(out,s0,s1,i0,i1,i2,i3);

input s0,s1,i0,i1,i2,i3;
output out;

wire t0,t1,t2,t3;

tranif0(i0,t0,s0);
tranif0(t0,out,s1);

tranif1(i1,t1,s0);
tranif0(t1,out,s1);

tranif0(i2,t2,s0);
tranif1(t2,out,s1);

tranif1(i3,t3,s0);
tranif1(t3,out,s1);

endmodule