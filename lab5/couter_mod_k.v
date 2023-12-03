// counter modulo-k
module counter_mod_k (Clock, reset, Q);
	parameter n = 4; // bit-in
	parameter k = 10;
	input Clock, reset;
	output reg [n-1:0] Q;
	always @(posedge Clock or negedge reset)
		begin
			if(~reset)
				Q = 4'd0;
			else
				begin
				Q = Q + 1'b1;
				if(Q == k)
					Q = 4'd0;
				end
		end	
endmodule