module bakingState(input clk, input [1:0]state, input[9:0] timerVal, input [9:0]inputTemp, output reg[3:0] tempVal0, tempVal1, tempVal2);

	reg[9:0] currentTemp = 65; //default temp to 65
	reg[9:0] counter = 0;

	reg[1:0] timerComplete = 0;

	secondsClock clock4(clk, clock);
	

	always @ (posedge clock) begin 
		if(state == 2) begin //make sure baking state is enabled
		
			if(counter < timerVal) begin
				counter = counter + 1;
			end else if(timerComplete == 0) begin	
				timerComplete = 1;
			end
		

			if(timerComplete == 0) begin

				if (currentTemp < inputTemp) begin
					currentTemp <= currentTemp + 2;
				end else if (currentTemp > inputTemp) begin
					currentTemp <= inputTemp;
				
				end
				
			end else begin
				if(currentTemp > 65) begin
					currentTemp <= currentTemp - 2;
				end else if(currentTemp < inputTemp) begin
					currentTemp <= 65;
				end
			end
		end 
	
		tempVal0 <= currentTemp % 10;
		tempVal1 <= (currentTemp / 10) % 10;
		tempVal2 <= (currentTemp / 100) % 10;
	end
		
		
endmodule 