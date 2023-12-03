// counter to 999 and display 3 led 7 doan 
module part2(Clk50, KEY, HEX2, HEX1, HEX0);
	input Clk50, KEY;
	output [6:0] HEX2, HEX0, HEX1;
	wire net2, net4, net6;
	wire [11:0] out;
	reg net1, net3, net5;
	reg ones, tens, hundreds;
	assign net2 = net1 && KEY;
	assign net4 = net3 && KEY;
	assign net6 = net5 && KEY;
	
	counter_mod_k C0 (Clk50, KEY, cycle);
	defparam C0.n = 26;
	defparam C0.k = 50000000;
	
	counter_mod_k C1 (ones, net2, out[3:0]);
	defparam C1.n = 4;
	defparam C1.k = 11;
	
	counter_mod_k C2 (tens, net4, out[7:4]);
	defparam C2.n = 4;
	defparam C2.k = 11;
	
	counter_mod_k C3 (hundreds, net6, out[11:8]);
	defparam C3.n =4;
	defparam C3.k = 11;
	
	always @(posedge Clk50)
	begin
		if (cycle == 50000000)
			ones = 1;
		else ones = 0;
		if(out[3:0] == 10 )
			begin
			tens = 1;
			net1 = 0;
			end
		else 
			begin
			tens = 0;
			net1 =1;
			end
		if(out[7:4] == 10)
			begin
			hundreds = 1;
			net3 = 0;
			end
		else
			begin
			hundreds = 0;
			net3 = 1;
			end
		net5 = 1;
	end
	
	b2d_display hex0 (out[3:0], HEX0);
	b2d_display hex1 (out[7:4], HEX1);
	b2d_display hex2 (out[11:8], HEX2);
	
endmodule	
