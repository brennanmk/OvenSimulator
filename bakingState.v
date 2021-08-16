module bakingState(input clk, input [1:0]state, input[9:0] timerVal, input [9:0]inputTemp, output reg[3:0] tempVal0, tempVal1, tempVal2);

	reg[9:0] currentTemp = 65; //variable to store temp, default temp is 65
	reg[9:0] counter = 0; //counter variable

	reg[1:0] timerComplete = 0; //timer complete variable to check when timer is done

	secondsClock clock4(clk, clock);
	

	always @ (posedge clock) begin 
		if(state == 2) begin //make sure baking state is enabled
		
			if(currentTemp == inputTemp) begin //check to make sure that the oven has reached the defined temp before starting the clock
				if(counter < timerVal) begin //every second add 1 to the timer
					counter = counter + 1;
				end else if(timerComplete == 0) begin	//make sure that timerComplete is not already set to 1
					timerComplete = 1; //if counter is equal to the inputted value set timerComplete to 1
				end
			end
		

			if(timerComplete == 0) begin
				
				if (currentTemp + 2 > inputTemp) begin //if the currentTemp + 2 is going to be higher then the inputTemp then set the currentTemp to the inputTemp so it does not go over
					currentTemp <= inputTemp;
				end else if (currentTemp < inputTemp) begin //every second add 2 to the temp input
					currentTemp <= currentTemp + 2;
				end 
				
			end else begin //if timer is complete then lower the oven temp by 2 every second until it reaches 65. 
				if(currentTemp - 2 < inputTemp) begin //if the currentTemp - 2 is going to be lower then the 65 (ambient) then set the currentTemp to the 65 as so it does not go under
						currentTemp <= 65;
				end else if(currentTemp > 65) begin //remove 2 from the current temp every second
					currentTemp <= currentTemp - 2;
				end 
			end
		end 
	
		tempVal0 <= currentTemp % 10; //turn the current temp values into seperate digits to be displayed by the sevenSeg
		tempVal1 <= (currentTemp / 10) % 10;
		tempVal2 <= (currentTemp / 100) % 10;
	end
		
		
endmodule 