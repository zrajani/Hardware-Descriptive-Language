// SR Latch 

module SR_Latch(Q,Qbar,R,S);

output Q,Qbar;
input R,S;

nor n1(Q,R,Qbar);
nor n2(Qbar,S,Q);

endmodule