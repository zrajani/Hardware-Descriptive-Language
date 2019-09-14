`timescale 1ns/100ps

module fa_gates_tb;

reg a,b,cin;

wire out,cout;

integer i;

fa_ha uut (.a(a),.b(b),.cin(cin),.s(out),.co(cout));

initial 
begin

$dumpfile("fa_g.vcd");
$dumpvars(0,fa_gates_tb);


for (i=0;i<8;i=i+1)

begin
	{a,b,cin}=i; #5;
	
end
#5 $finish;
end

initial 
	begin 
		$monitor($time,"a=%b, b=%b, c=%b, sum=%b, cout=%b",a,b,cin,out,cout);
	end
	
endmodule