// Half adder 

module half_adder(A,B,Sum,Carry);

	input A,B;
	output Sum,Carry;
	
	assign Sum= A^B; //XOR Operation
	assign Carry=A&B; //AND Operation

endmodule

module fa_ha(a,b,cin,s,co);

	input a,b,cin;
	output s,co;
	
	wire ha1_sum,ha2_sum,ha1_carry,ha2_carry,Sum,Carry;
	
	//Instantiate Half Adder
	
	half_adder ha1(.A(a),.B(b),.Sum(ha1_sum),.Carry(ha1_carry));
	half_adder ha2(.A(ha1_sum),.B(cin),.Sum(s),.Carry(ha2_carry));
	
	assign s=ha2_sum;
	assign co=ha1_carry|ha2_carry;
	
endmodule
	
	
	