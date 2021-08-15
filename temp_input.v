module temp_input(input clk, onOff, input [1:0] btn, input [2:0]sw, output reg [3:0]hex0, hex1, hex2, hex3);
	

	reg digit = 0;
	reg sw_value = 0;
	reg [2:0]state = 0;
	

	
	
	secondsClock clock2(clk, clock);

	//Add on off
	always @(posedge clock) begin
	// Switching between digit with Button 1
	//get temp
			
		if (state == 0) begin
			hex0 <= (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit one
			
			if (btn[0] ==0 ) begin
				state <= 1;
			end
		end else if (state == 1) begin
			hex1 <= (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit one
			
			if (btn[0] == 0) begin
				state <= 2;
			end
		end else if (state == 2) begin
			hex2 <= (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit one
			
			if (btn[1] == 0) begin
				hex3 <= 0;
				hex2 <= 0; //reset displays
				hex1 <= 0;
				hex0 <= 0;

				state <= 3;
			end
		end else if (state == 3) begin

			hex0 <= (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit one
			
			if (btn[0] == 0) begin
				state <= 4;
			end
		end else if (state == 4) begin
			hex1 <= (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit two
			
			if (btn[0] == 0) begin
				state <= 5;
			end
		end else if (state == 5) begin
			hex2 <= (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit three
			
			if (btn[0] == 0) begin
				state <= 6;
			end
		end else if (state == 6) begin
			hex3 <= (sw[2] * 3) + (sw[1] * 2) + (sw[0] * 1); //set digit four
			
		end
	end
	

endmodule 