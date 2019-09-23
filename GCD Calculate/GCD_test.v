
`include"GCD.v"

module gcd_test;
reg [15:0] inA, inB;
wire [15:0] out;
gcd_beh #(16) gcd_unit( .inA(inA), .inB(inB), .out(out) );
initial
begin
// 3 = GCD( 27, 15 )
inA = 27;
inB = 15;
#10;
if ( out == 3 )
$display( "Test ( gcd(27,15) ) succeeded, [ %x == %x ]", out, 3 );
else
$display( "Test ( gcd(27,15) ) failed, [ %x != %x ]", out, 3 );
$finish;
end
endmodule