// counter
module counter(Clock, reset, Q);
	defparam n = 4; // bit-in
	input Clock, reset;
	output reg [n-1:0] Q;
	always @(posedge Clock or negedge reset)
		begin
			if(~reset)
				Q = 1'd0;
			else
				Q = Q + 1'b1;
		end	
endmodule