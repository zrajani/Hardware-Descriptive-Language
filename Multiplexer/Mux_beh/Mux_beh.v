module mux_beh( d,select,q );

input[1:0] select;
input[3:0] d;
output q;

reg q;
wire[1:0] select;
wire[3:0] d;

always @( select or d)
begin
    q = ( ~select[0] & ~select[1] & d[0] )
        | (  select[0] & ~select[1] & d[1] )
        | ( ~select[0] &  select[1] & d[2] )
        | (  select[0] &  select[1] & d[3] );
end

endmodule