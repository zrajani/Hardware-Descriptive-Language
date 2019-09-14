module and1(c,a,b);

	output c;
	input a,b;

	assign c=a&b;
endmodule


module xor1(c,a,b);

	output c;
	input a,b;
	assign c=a^b;
endmodule

module fa_gates (s,cout,a,b,cin);
	
	output s,cout;	
	input a,b,cin;
	
	
	xor1 u1 (o1,a,b);
	xor1 u2 (s,o1,cin);
	
	and1 u3 (o2,cin,o1);
	and1 u4 (o3,a,b);
	
	or u5 (cout,o2,o3);

endmodule