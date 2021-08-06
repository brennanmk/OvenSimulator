module temp_input(input [1:0] btn, input [2:0]sw, output reg [9:0] temp, output reg [2:0] temp_hex0 = 3'b000, temp_hex1 = 3'b000, temp_hex2 = 3'b011);
	
	reg digit = 0;
	reg sw_value = 0;
	
	// Switching between digit with Button 1
	always @(btn[1]) begin
		if (digit == 2) begin
			digit = 0;
		end else begin
			digit = digit + 1;
		end
		
	end
	
	// Assign switches value to hex display
	always @(sw) begin 
		if (digit == 0) begin
			temp_hex0 <= sw;
		end else if (digit == 1) begin
			temp_hex1 <= sw;
		end else begin
			temp_hex2 <= sw;
		end
	end
	
	// return temperature when Button 0 is pressed
	always@(btn[0]) begin
		temp = temp_hex2*100 + temp_hex1*10 + temp_hex0;
	end
	
endmodule 