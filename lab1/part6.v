///
module part6(SW, LEDR, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0);
	input [15:0] SW;
	output [9:0] LEDR;
	output [6:0] HEX5, HEX4, HEX3, HEX2, HEX1, HEX0;
	assign LEDR = SW;
	wire [2:0] out1, out2, out3, out4, out5;
	wire [2:0] a,b,c;
	assign a = 3'b111;
	assign b = 3'b111;
	assign c = 3'b111;
	assign LEDR =SW;
	//                S                  d         E       1        0
	mux_3bit_8to1 M5(SW[14:12], a,b,c, SW[11:9], SW[8:6], SW[5:3], SW[2:0], out5);
	mux_3bit_8to1 M5(SW[14:12],b,c, SW[11:9], SW[8:6], SW[5:3], SW[2:0], a, out4);
	mux_3bit_8to1 M5(SW[14:12],c, SW[11:9], SW[8:6], SW[5:3], SW[2:0], a,b, out3);
	mux_3bit_8to1 M5(SW[14:12], SW[11:9], SW[8:6], SW[5:3], SW[2:0], a,b,c, out2);
	mux_3bit_8to1 M5(SW[14:12], SW[8:6], SW[5:3], SW[2:0], a,b,c, SW[11:9], out1);
	mux_3bit_8to1 M5(SW[14:12], SW[5:3], SW[2:0], a,b,c, SW[11:9], SW[8:6], out0);
	char_7seg H5(out5,HEX5);
	char_7seg H4(out5,HEX4);
	char_7seg H3(out5,HEX3);
	char_7seg H2(out5,HEX2);
	char_7seg H1(out5,HEX1);
	char_7seg H0(out5,HEX0);

	
endmodule

module mux_3bit_8to1(S, B0, B1, B2, B3, B4, B5, B6, B7, M);
	input [2:0] S, B0, B1, B2, B3, B4, B5, B6, B7;
	output [2:0] M;
	assign M = (S == 3'b000) ? B0:
			   (S == 3'b001) ? B1:
			   (S == 3'b010) ? B2:
			   (S == 3'b011) ? B3:
			   (S == 3'b100) ? B4:
			   (S == 3'b101) ? B5:
			   (S == 3'b110) ? B6:
			   (S == 3'b111) ? B7: B8;
endmodule

module char_7seg(C, Display);
	input [2:0] C;
	output [6:0] Display;
	assign Display = (C == 2'b000) ? 7'b0100001:    //d
					 (C == 2'b001) ? 7'b0000110:    //E
					 (C == 2'b010) ? 7'b1111001: 7'b1000000;
endmodule

	
	

