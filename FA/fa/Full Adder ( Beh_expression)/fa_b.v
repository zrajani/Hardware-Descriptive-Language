module fa_b(s,co,a,b,c);

	input a,b,c;
	output s,co;

	assign s=a^b^c;
	assign co=(a&b)|(b&c)|(c&a);

endmodule