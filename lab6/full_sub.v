module full_sub (a,b,c_in,c_out,s);
	parameter n =4;
	input [n-1:0] a,b;
	input c_in;
	output reg c_out;
	output reg [n-1:0] s;
	always @(*)
		begin
		if (a >= b)
			{c_out,s} = a - b;
		else 
			{c_out,s} = b - a;
		end
end