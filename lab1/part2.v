module part2(SW,LED);
	input [9:0] SW;
	output [9:0] LED;
	//assign LED = SW;
	assign LED[3:0] = (SW[9] ==0)?SW[7:4]:SW[3:0] ;
	//s = SW[9]
	// X = SW[7:4]
	//Y = SW[3:0]
endmodule
