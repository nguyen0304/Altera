module full_adder(a,b,c_in, c_out, sum);
	parameter n = 4;
	input [n-1:0] a, b;
	input c_in;
	output reg c_out;
	output reg [n-1:0] sum;
	always @(*) 
	begin
		{c_out, sum} = a + b + c_in;
	end
endmodule