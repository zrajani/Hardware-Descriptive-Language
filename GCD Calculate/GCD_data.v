module GCD_datapath(gt,lt,eq,ldA,ldB,sel1,sel2,sel_in,data_in,clk);

	input ldA,ldB,sel1,sel2,sel_in,clk;
	input [15:0] data_in;
	output gt,lt,eq;
	wire [15:0] Aout,Bout,X,Y,Bus,SubOut;
	
	PIPO A (Aout,Bus,ldA,clk);
	PIPO B (Bout,Bus,ldB,clk);
	MUX MUX_in1(X,Aout,Bout,sel1);
	MUX MUX_in2(Y,Aout,Bout,sel2);
	MUX MUX_load(Bus,SubOut,data_in,sel_in);
	SUB SB (SubOut,X,Y);
	COMPARE COMP (lt,gt,eq,Aout,Bout);
	
endmodule 

module PIPO (data_out,data_in,load,clk);

	input [15:0] data_in;
	input load,clk;
	output reg [15:0] data_out;
	
	always @(posedge clk)
		if(load) data_out<=data_in;
endmodule

module SUB (out,in1,in2);
	input [15:0] in1,in2;
	output reg [15:0] out;
	always @(*)
		out=in1-in2;
endmodule 

module COMPARE (lt,gt,eq,data1,data2);
	input [15:0] data1,data2;
	output lt,gt,eq;
	
	assign lt=data1<data2;
	assign gt=data1>data2;
	assign eq=data1==data2;
	
endmodule

module MUX (out,in0,in1,sel);
	input [15:0] in0,in1;
	input sel;
	output [15:0] out;
	
	assign out=sel? in1:in0;
endmodule 

module controller (ldA,ldB,sel1,sel2,sel_in,done,clk,lt,gt,eq,start);

	input clk,lt,gt,eq,start;
	output reg ldA,ldB,sel1,sel2,sel_in,done;
	
	reg [2:0]state;
	parameter S0=3'b000,S1=3'b001,S2=3'b010,S3=3'b011,S4=3'b100,S5=3'b101;
	
	always @ (posedge clk)
		begin
			case (state)
				S0: if(start) state<=S1;
				S1: state<=S2;
				S2: #2 if(eq) state<=S5;
					else if(lt) state<=S3;
					else if (gt) state<=S4;
				S3: #2 if(eq) state<=S5;
					else if(lt) state<=S3;
					else if (gt) state<=S4;
				S4: #2 if(eq) state<=S5;
					else if(lt) state<=S3;
					else if (gt) state<=S4;
				S5: state<=S5;
				default: state<=S0;
			endcase
		end
	always @ (state)
		begin 
		case (state)
			S0: begin sel_in=1; ldA=1; ldB=0; done=0; end
			S1: begin sel_in=1; ldA=0; ldB=1; done=0; end
			S2: if (eq) done=1;
				else if (lt) begin
								sel1=1;sel2=0; sel_in=0; 
								#1 ldA=0; ldB=1; 
							end
				else if (gt) begin
								sel1=0;sel2=1; sel_in=0;
								#1 ldA=1; ldB=0;
							end
			S3: if (eq) done=1;
				else if (lt) begin
								sel1=1;sel2=0; sel_in=0; 
								#1 ldA=0; ldB=1; 
							end
				else if (gt) begin
								sel1=0;sel2=1; sel_in=0; 
								#1 ldA=1; ldB=0;
							end
			S4: if (eq) done=1;
				else if (lt) begin
								sel1=1;sel2=0; sel_in=0;
								#1 ldA=0; ldB=1; 
							end
				else if (gt) begin
								sel1=0;sel2=1; sel_in=0; 
								#1 ldA=1; ldB=0;
							end
			S5: begin
					done=1;sel1=0;sel2=0;ldA=0; ldB=0;
				end
			default: begin ldA=0; ldB=0; end 
		endcase
	end
endmodule