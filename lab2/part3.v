////
module part3(SW, LEDR);
	input [8:0] SW; ///SW[8] cin, SW[7:4] A, SW[3:0] B
	output [4:0] LEDR; //LEDR[5] cout  LEDR[4:0] s
	wire c1, c2, c3;
	FA A0 (SW[4], SW[0], SW[8], LEDR[0], c1 );
	FA A1 (SW[5], SW[1], c1, LEDR[1], c2 );
	FA A2 (SW[6], SW[2], c2, LEDR[2], c3 );
	FA A3 (SW[7], SW[3], c3, LEDR[3], LEDR[4] );
endmodule
module FA(a,b,cin,s,cout);
	input a, b, cin;
	output s, cout;
	assign s = (a^b)^cin;
	assign cout = (a^b) ? cin : b;
endmodule

