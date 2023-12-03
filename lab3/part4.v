///triggered D flip flop
module part4(SW, LEDR);
	input [1:0] SW;
	output [2:0] LEDR;
	D_latch L(SW[1], SW[0], LEDR[2]);
	D_ff F1(SW[1], SW[0], LEDR[1]);
	D_ff F0(~SW[1], SW[0], LEDR[0]);
	
endmodule
module D_latch(Enable, D, Q);
	input Enable, D;
	output reg Q;
	always @(D, Enable)
		if(Enable)
			Q =D;
endmodule
module D_ff(Clk, D, Q);
	input Clk, D;
	output reg Q;
	always @ (posedge Clk)
		Q = D;
endmodule