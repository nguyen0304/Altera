// extend the 8 bits accumulator circuit
module part2(SW, KEY, LEDR, HEX3, HEX2, HEX1,HEX0);
	input [8:0] SW; // sw7 == 0 ? add : sub
	input [1:0] KEY; 
					 // key1 : clock input
					 // key0 : reset
	output [9:0] LEDR;
	output [6:0] HEX3, HEX2, HEX1,HEX0;
	reg [7:0] netS, A, S;
	reg overflow, carry;
	
	always @(negedge KEY[1] or negedge KEY[0])
	begin
		if(KEY[1] == 0)
			begin 
			A = SW;
			S = netS;
			end
		if(KEY[0] == 0)
			begin
			A = 8'b0;
			S = 8'b0;
			overflow = 0;
			carry = 0;
			end
	end
	//full_adder(a,b,c_in, c_out, sum);
	full_adder FA0 (A, S^{8{SW[8]}}, 0, carry, netS);
	defparam FA0.n = 8;
	
	assign LEDR[7:0] = S;
	assign LEDR[8] = carry;
	assign LEDR[9] = overflow;
endmodule