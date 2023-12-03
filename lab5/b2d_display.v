// display led 7 doan
module b2d_display(in_4b, HEX);
	input [3:0] in_4b;
	output reg [6:0] HEX;
	always @(in_4b)
		case(in_4b)
			4'b0000:HEX=7'b0000001;
			4'b0001:HEX=7'b1001111;
			4'b0010:HEX=7'b0010010;
			4'b0011:HEX=7'b0000110;
			4'b0100:HEX=7'b1001100;
			4'b0101:HEX=7'b0100100;
			4'b0110:HEX=7'b0100000;
			4'b0111:HEX=7'b0001111;
			4'b1000:HEX=7'b0000000;
			4'b1001:HEX=7'b0001100;
		endcase
endmodule