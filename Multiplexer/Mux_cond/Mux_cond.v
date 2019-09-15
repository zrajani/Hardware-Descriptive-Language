module mux_cond( select, d, q );

input[1:0] select;
input[3:0] d;
output q;

wire q;
wire[1:0] select;
wire[3:0] d;

assign q = ( select == 0 )? d[0] : ( select == 1 )? d[1] : ( select == 2 )? d[2] : d[3];

endmodule