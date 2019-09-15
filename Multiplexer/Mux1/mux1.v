module mux1 (sel,d,q);

input [1:0] sel;
input [3:0] d;
output q;

wire q;
wire [1:0] sel;
wire [3:0] d;

assign q=d[sel];

endmodule 