// couter 8 bit using flip flop T0
module part1(KEY, SW, HEX1, HEX0);
	input [0:0] KEY; //clk
	input [1:0] SW; // SW1: enable , SW0 : clear
	output [6:0] HEX0, HEX1; //display hexadecimal
	wire [7:0] Q;
	couter_8bit couter (KEY, SW[0], SW[1], Q);
	Display_8bit_B2H hex1(Q[7:4], HEX1);
	Display_8bit_B2H hex0(Q[3:0], HEX0);	
endmodule

module couter_8bit(Clk, Clr, En, out);/////
	input Clk, Clr, En;
	output [7:0] out;
	wire [7:0] q;
	wire t7,t6,t5,t4,t3,t2,t1,t0;
	
	T_ff T7 (Clk, Clr, En, q[7]);
	assign t6 = En&q[7];	
	
	T_ff T6 (Clk, Clr, t6, q[6]);
	assign t5 = t6&q[6];
	
	T_ff T5 (Clk, Clr, t5, q[5]);
	assign t4 = t5&q[5];
	
	T_ff T4 (Clk, Clr, t4, q[4]);
	assign t3 = t4&q[4];
	
	T_ff T3 (Clk, Clr, t3, q[3]);
	assign t2 = t3&q[3];
	
	T_ff T2 (Clk, Clr, t2, q[2]);
	assign t1 = t2&q[2];
	
	T_ff T1 (Clk, Clr, t1, q[1]);
	assign t0 = t1&q[1];
	
	T_ff T0 (Clk, Clr, t0, q[0]);	
	
	assign out = q;
endmodule
module T_ff(Clk, Clr, Enable, Q);
	input Clk,Clr, Enable;
	output reg Q;
	always @(posedge Clk)
		if(~Clr)
			Q =0;
		else 
			if (Enable)
				Q = ~Q;
			else Q = Q;
endmodule	

module Display_8bit_B2H(in_4b, Output7B);
	input [3:0] in_4b;
	output reg [6:0] Output7B;
	always @(in_4b)
		case (in_4b)
			4'b0000 : Output7B = 7'b1111110;
			4'b0001 :       // Hexadecimal 1
				Output7B = 7'b0110000  ;
			4'b0010 :       // Hexadecimal 2
				Output7B = 7'b1101101 ; 
			4'b0011 :       // Hexadecimal 3
				Output7B = 7'b1111001 ;
			4'b0100 :       // Hexadecimal 4
				Output7B = 7'b0110011 ;
			4'b0101 :       // Hexadecimal 5
				Output7B = 7'b1011011 ;  
			4'b0110 :       // Hexadecimal 6
				Output7B = 7'b1011111 ;
			4'b0111 :       // Hexadecimal 7
				Output7B = 7'b1110000;
			4'b1000 :      // Hexadecimal 8
				Output7B = 7'b1111111;
			4'b1001 :      // Hexadecimal 9
				Output7B = 7'b1111011 ;
			4'b1010 :       // Hexadecimal A
				Output7B = 7'b1110111 ; 
			4'b1011 :       // Hexadecimal B
				Output7B = 7'b0011111;
			4'b1100 :       // Hexadecimal C
				Output7B = 7'b1001110 ;
			4'b1101 :       // Hexadecimal D
				Output7B = 7'b0111101 ;
			4'b1110 :       // Hexadecimal E
				Output7B = 7'b1001111 ;
			4'b1111 :       // Hexadecimal F
				Output7B = 7'b1000111 ;
		endcase
endmodule