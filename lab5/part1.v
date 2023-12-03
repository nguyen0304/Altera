///
module part1(KEY,LEDR);
	input [1:0] KEY;
	output [4:0] LEDR;
	counter c0(KEY[1], KEY[0], LEDR[4:0]);
	defparam c0.n = 5;
	defparam c0.k = 20;
endmodule
module counter (Clock, Reset_n, Q);
	parameter n = 4;
	parameter k = 10;
	input Clock, Reset_n;
	output [n-1:0] Q;
	reg [n-1:0] Q;
	always @(posedge Clock or negedge Reset_n)
	begin
		if (!Reset_n)
			Q <= 1'd0;
		else begin
			Q <= Q + 1'b1;
			if(Q == k)
				Q <= 1'd0;
			end
	end
endmodule
