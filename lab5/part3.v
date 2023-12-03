/// realtime clock
module part3(Clk50,KEY,SW,HEX5,HEX4,HEX3,HEX2,HEX1,HEX0);
		input Clk50;
		input [2:0] KEY;
		input [7:0] SW; // preset minute part 49 minute = 0100_1001
		output [6:0] HEX5,HEX4,HEX3,HEX2,HEX1,HEX0;
		
		reg temp_1, temp_2, temp_3;
		wire control_1, control_2, control_3;
		wire [25:0] cycle; // per second
		wire [5:0] second, minute;
		wire [4:0] hour;
		
		reg cycle_second, cycle_minute, cycle_hour;
		wire cycle_second2, cycle_minute2, cycle_hour2;
		
		assign cycle_second2 = cycle_second && KEY[0];
		assign cycle_minute2 = cycle_minute && KEY[0];
		assign cycle_hour2 = cycle_hour && KEY[0];
		
		assign control_1 = temp_1 && KEY[2];
		assign control_2 = temp_2 && KEY[2];
		assign control_3 = temp_3 && KEY[2];
		
		assign hour = (KEY[1] == 0) ? SW : 0;
		counter_mod_k C0 (Clk50, KEY[2], cycle); //1 cycle = 1 second
		defparam C0.n = 26;
		defparam C0.k = 50000000; //50 000 000
		
		counter_mod_k C1 (cycle_second2,control_1,second);
		defparam C1.n = 6;
		defparam C1.k = 60;
		
		counter_mod_k C2 (cycle_minute2, control_2, minute);
		defparam C1.n = 6;
		defparam C1.k = 60;
		
		counter_mod_k C3 (cycle_hour2, control_3, hour);
		defparam C3.n = 5;
		defparam C3.k = 24;
		
		always @(posedge Clk50)
		begin
			if (cycle == 49999999)
				cycle_second = 1;
			else cycle_second = 0;
			if (second == 60)
				begin
				cycle_minute = 1;
				temp_1 = 0;
				end
			else
				begin
				cycle_minute = 0;
				temp_1 = 1;
				end	
			if (minute == 60)
				begin
				cycle_hour = 1;
				temp_2 =0;
				end
			else
				begin
				cycle_hour = 0;
				temp_2 =1;
				end	
			temp_3 = 1;		
		end	
		// display on led 7 doan
		two_digit_b2d_display h_10 (second, HEX1, HEX0);
		two_digit_b2d_display h_32 (minute, HEX3, HEX2);
		two_digit_b2d_display h_54 (hour, HEX5, HEX4);
endmodule

