// Code Description: Ripple Carry Adder
// Modelling Style: Gate level modelling 

module fulladder (s,cout,a,b,cin);  // Full Adder Module 
	
	output s,cout;	
	input a,b,cin;
	
	
	xor(o1,a,b);
	xor(s,o1,cin);
	
	and(o2,cin,o1);
	and(o3,a,b);
	
	or(cout,o2,o3);

endmodule

module Four_bit_adder(S,C4,A,B,C0);  // Ripple Carry Adder (RCA) (Built Using 4 Full Adders) 

	input [3:0] A,B;
	input C0;
	output [3:0] S;
	output C4;
	wire C1,C2,C3;
	
	fulladder FA0 (S[0],C1,A[0],B[0],C0);   // Module Call 4 times as 4 bit RCA
	fulladder FA1 (S[1],C2,A[1],B[1],C1);
	fulladder FA2 (S[2],C3,A[2],B[2],C2);
	fulladder FA3 (S[3],C4,A[3],B[3],C3);
  
endmodule
