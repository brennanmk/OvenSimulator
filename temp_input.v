module temp_input(input clk, onOff, input [1:0] btn, input [3:0]sw, output reg [3:0]hex0, hex1, hex2, hex3);
	
	reg [2:0]state = 0; //variable for state
		
	secondsClock clock2(clk, clock);

	always @(negedge clock) begin
		if(onOff == 0) begin
			hex3 <= 0; //reset displays
			hex2 <= 0; 
			hex1 <= 0;
			hex0 <= 0;
			state = 0;
		end
			
		if (state == 0) begin 
			hex0 <= (sw[3] * 4) + (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit one of temp
			
			if (btn[0] ==0 ) begin
				state <= 1;
			end
		end else if (state == 1) begin
			hex1 <= (sw[3] * 4) + (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit one of temp
			
			if (btn[0] == 0) begin
				state <= 2;
			end
		end else if (state == 2) begin
			hex2 <= (sw[3] * 3) + (sw[2] * 2) + (sw[1] * 1); //set digit one of temp
			
			if (btn[1] == 0) begin //switch to timer input if push button 1 is pressed
				hex3 <= 0; //reset displays
				hex2 <= 0; 
				hex1 <= 0;
				hex0 <= 0;

				state <= 3;
			end
		end else if (state == 3) begin

			hex0 <= (sw[3] * 4) + (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit one of timer
			
			if (btn[0] == 0) begin
				state <= 4;
			end
		end else if (state == 4) begin 
			hex1 <= (sw[3] * 4) + (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit two of timer
			
			if (btn[0] == 0) begin
				state <= 5;
			end
		end else if (state == 5) begin
			hex2 <= (sw[3] * 4) + (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit three of timer
			
			if (btn[0] == 0) begin
				state <= 6;
			end
		end else if (state == 6) begin
			hex3 <= (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit four of timer
			
		end
	end
	

endmodule 