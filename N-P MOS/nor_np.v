
// Page 285 Samir

module nor_np(out,a,b);

output out;
input a,b;

wire c;

supply1 pwr;
supply0 gnd;

pmos (c,pwr,b);
pmos (out,c,a);

nmos (out,gnd,a);
nmos (out,gnd,b);

endmodule