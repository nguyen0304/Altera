/// 
module part5(Clk, SW, HEX5, HEX3, HEX4, HEX2, HEX1, HEX0);
	input Clk;
	input [9:0] SW; //A, B SW[7:0] , s: SW[8], rs: SW[9]
	output [6:0] HEX5, HEX3, HEX4, HEX2, HEX1, HEX0;
	output reg [0:0] LEDR; //carry-out
	wire [7:0] A,B;
	wire [8:0] C //C =A +B
	always @(posedge Clk)
		begin
		if(SW[9]) //reset =1 ---> out =0
			begin
			assign A = 8'b00000000;
			assign B = 8'b00000000;
			assign C = 9'b000000000;
			assign LEDR = 1'b0;
			end
		else
			if(~SW[8])  //set = 0 ->> A <= SW[7:0]
				A = SW[7:0];
			else
				B = SW[7:0];
		C = A + B; //carry-out =C[8]
		if(C[8] ==1'b1)
			LEDR =1'b1;
		end
		Display_8bit_B2H h3(A[7:4],HEX3);
		Display_8bit_B2H h2(A[3:0],HEX2);
		
		Display_8bit_B2H h1(B[7:4],HEX1);
		Display_8bit_B2H h0(A[3:0],HEX0);
		
		Display_8bit_B2H h6(C[7:4],HEX6);
		Display_8bit_B2H h5(A[3:0],HEX5);
		
		
endmodule

module Display_8bit_B2H(in_4b, hex);
	input [3:0] in_4b;
	output [6:0] hex;
	always @(in_4b)
		case (in_4b)
			4'b0000 :      // Hexadecimal 0
				Output7B = 7'b1111110;
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