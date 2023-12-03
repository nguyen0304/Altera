// 2 bit 4 to 1 multiplexer
module part3(input [9:0] SW, output [1:0] LEDR);
	assign LEDR[1:0] = SW[9:8] == 0? SW[7:6]:(SW[9:8] == 1 ? SW[5:4]:(SW[9:8] == 2 ? SW[3:2]:SW[1:0]));
endmodule
