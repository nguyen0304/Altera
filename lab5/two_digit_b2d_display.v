// display a 2-digit number on led 7 seg
module two_digit_b2d_display(in, hex1, hex0);
	input [6:0] in;
	output [6:0] hex1, hex0;
	wire [3:0] don_vi, chuc;
	assign don_vi = in%10;
	assign chuc = (in - don_vi)/10;
	b2d_display h1 (chuc, hex1);
	b2d_display h0 (don_vi, hex0);
endmodule