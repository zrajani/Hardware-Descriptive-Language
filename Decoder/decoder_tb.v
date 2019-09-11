
`include "decoder38.v"

module decoder_tb;

reg e;

reg a;

reg b;

wire [7:0] d;

decoder38 d1 ( .en(e),.a(a),.b(b),.out(d) );

initial begin

$dumpfile("decoder.vcd");
$dumpvars(0,decoder_tb);

#10 e=1'b0;a=1'b0;b=1'b0;

#10 e=1'b0;a=1'b0;b=1'b1;

#10 e=1'b0;a=1'b1;b=1'b0;

#10 e=1'b0;a=1'b1;b=1'b1;

#10 e=1'b1;a=1'b0;b=1'b0;

#10 e=1'b1;a=1'b0;b=1'b1;

#10 e=1'b1;a=1'b1;b=1'b0;

#10 e=1'b1;a=1'b1;b=1'b1;

#10 $finish;

end

initial 
	begin 
		$monitor($time,"\t a=%b, b=%b, c= %b out=%b",e,a,b,d);
	end

endmodule