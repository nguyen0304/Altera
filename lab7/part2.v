// Finite state machine (description with behavior level)
module part2 (SW,KEY, LEDR);
	input [1:0] SW; //sw1 : w input ; sw0 reset
	input KEY; // clock input
	output [9:0] LEDR;
	wire w;
	reg [3:0] y_Q, y_D; // y_Q : current state; y_D: next state
	parameter A = 4'b0000,B = 4'b0001,C = 4'b0010,D = 4'b0011,E = 4'b0100,
			  F = 4'b0101,G = 4'b0110,H = 4'b0111,I = 4'b1000; 
	assign w = SW[1];
	always @(w or y_Q)
		begin: state_table
			if(SW[0]) y_Q = A;
			else
			begin
				case(y_Q)
					A : if(~w) y_D = B;
						else y_D = F;
					B : if(~w) y_D = C;
						else y_D = F;
					C : if(~w) y_D = D;
						else y_D = F;
					D : if(~w) y_D = E;
						else y_D = F;
					E : if(~w) y_D = E;
						else y_D = F;
					F : if(~w) y_D = B;
						else y_D = G;
					G : if(~w) y_D = B;
						else y_D = H;
					H : if(~w) y_D = B;
						else y_D = I;
					I : if(~w) y_D = B;
						else y_D = I;
					default : y_D = 4'bxxxx;
				endcase
			end
		end 
	always @(posedge KEY)
		begin:state_FFs
			y_Q = y_D;
		end
	assign LEDR[9] = (y_Q == I) ? 1 : 0;
	assign LEDR[3:0] = y_Q; 	
endmodule