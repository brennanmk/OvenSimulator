module temp_input(input onOff, input [1:0] btn, input [2:0]sw, output reg [9:0] temp, output reg [9:0] timer, output [0:6] Hex0, Hex1, Hex2);
	
	
	reg [3:0]hex0 = 3'b000;
	reg [3:0]hex1 = 3'b000;
	reg [3:0]hex2 = 3'b011;
	reg digit = 0;
	reg sw_value = 0;
	
	//Add on off
	always @(*) begin
		if(onOff == 1) begin
		// Switching between digit with Button 1
			if(btn[1]) begin
				if (digit == 2) begin
					digit <= 0;
				end else begin
					digit <= digit + 1;
				end
			end

			// Assign switches value to hex display
			if(sw) begin 
				if (digit == 0 ) begin
					hex0 <= sw;
				end else if (digit == 1) begin
					hex1 <= sw;
				end else begin
					hex2 <= sw;
				end
			end


			// return temperature when Button 0 is pressed
			if(btn[0]) begin //GO TO TEMP INPUT
			
			// Assign switches value to hex display
				if(sw) begin 
					if (digit == 0 ) begin
						hex0 <= sw;
					end else if (digit == 1) begin
						hex1 <= sw;
					end else begin
						hex2 <= sw;
					end
				end
				
				if(btn[0]) begin
					temp <= hex2*100 + hex1*10 + hex0;
					if (temp < 300) begin
						hex2 <= 3'b011;
						hex1 <= 3'b000;
						hex0 <= 3'b000;
						temp <= 	hex2*100 + hex1*10 + hex0;
					end else if (temp > 500) begin
						hex2 <= 3'b101;
						hex1 <= 3'b000;
						hex0 <= 3'b000;
						temp <= hex2*100 + hex1*10 + hex0;
					end
				end	
				
			end
		end
	end
	
		
	sevenSeg Seg0(hex0, Hex0); 
	sevenSeg Seg1(hex1, Hex1); 
	sevenSeg Seg2(hex3, Hex2); 
	

endmodule 