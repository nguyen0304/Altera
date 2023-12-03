// multiplication of binary numbers
module multiplier (A, B, P);
	input [3:0] A, B;
	output [7:0] P;
	wire c_out_00, c_out_01, c_out_02, c_out_03;
	wire s01, s02, s03;
	
	wire c_out_10, c_out_11, c_out_12, c_out_13;
	wire s11, s12, s13;	
	
	wire c_out_30, c_out_31, c_out_32, c_out_33;

	assign P[0] = A[0]&B[0];
	
	full_adder FA0 (B[0]&A[1], A[0]&B[1], 0, c_out_00, P[1]);
	defparam FA0.n = 1;
	full_adder FA1 (B[0]&A[2], A[1]&B[1], c_out_00, c_out_01, s01);
	defparam FA1.n = 1;
	full_adder FA2 (B[0]&A[3], A[2]&B[1], c_out_01, c_out_02, s02);
	defparam FA2.n = 1;	
	full_adder FA3 (0, A[3]&B[1], 0, c_out_03, s03);
	defparam FA3.n = 1;
	
	full_adder FA4 (s01, B[2]&A[0], 0, c_out_10, P[2]);
	defparam FA4.n = 1;
	full_adder FA5 (s02, B[2]&A[1], c_out_10, c_out_11, s11);
	defparam FA5.n = 1;	
	full_adder FA6 (s03, B[2]&A[2], c_out_11, c_out_12, s12);
	defparam FA6.n = 1;	
	full_adder FA7 (c_out_03, B[2]&A[3], c_out_12, c_out_13, s13);
	defparam FA7.n = 1;	
	
	full_adder FA8 (s11, B[3]&A[0], 0, c_out_30, P[3]);
	defparam FA8.n = 1;
	full_adder FA9 (s12, B[3]&A[1], c_out_30, c_out_31, P[4]);
	defparam FA9.n = 1;
	full_adder FA10 (s13, B[3]&A[2], c_out_31, c_out_32, P[5]);
	defparam FA10.n = 1;
	full_adder FA11 (c_out_13, B[3]&A[3], c_out_32, c_out_33, P[6]);
	defparam FA11.n = 1;
	
	assign P[7] = c_out_33;	
endmodule	