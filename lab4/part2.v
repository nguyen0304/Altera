//
module part1(KEY, SW, HEX3, HEX2, HEX1, HEX0);
	input [0:0] KEY; //clk
	input [1:0] SW; // SW1: enable , SW0 : clear
	output [6:0] HEX0, HEX1, HEX2, HEX3; //display hexadecimal
	wire [15:0] Q;
	couter c (KEY, SW[0], SW[1], Q);
	Display_8bit_B2H hex3(Q[15:12], HEX3);
	Display_8bit_B2H hex2(Q[11:8], HEX2);
	Display_8bit_B2H hex1(Q[7:4], HEX1);
	Display_8bit_B2H hex0(Q[3:0], HEX0);	
endmodule

module couter (Clk, Clr, En, Q);
	input Clk, Clr, En;
	output reg Q;
	always @(posedge Clk)
	begin
	if(Clr)
		Q =0;
	else 
		if (En)
			Q <= Q + 1;
	if (Q == 17'h1FFFF)
		Q =0;
	end
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