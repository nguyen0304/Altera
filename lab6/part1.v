// 8 bits accumulator circuit
module part1(SW,KEY,LEDR,HEX3,HEX2,HEX1,HEX0);
	input [7:0] SW; // A
	input [1:0] KEY; // key0 : reset, key1 : clock input
	output [9:0] LEDR; //led[7:0] sum  ; led8: carry ; led9: overflow
	output [6:0] HEX3,HEX2,HEX1,HEX0; // A, S
	
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
	full_adder FA0 (A, S, 0, carry, netS);
	
	assign LEDR[7:0] = S;
	assign LEDR[8] = carry;
	assign LEDR[9] = overflow;
endmodule
