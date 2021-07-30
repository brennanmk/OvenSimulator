module FinalProject(input [3:0] in, input pushButton, clk, output [0:6] Hex0, Hex1, Hex2, Hex3, Hex4, Hex5);
	wire clock;
	reg[6:0] secondCount = 0;
	
	reg[3:0] minuteCountVal1 = 0;
	reg[3:0] minuteCountVal2 = 0; //MSB Minute EG the 6 in 60

	reg[3:0] hourCountVal1 = 0;
	reg[3:0] hourCountVal2 = 0;



	secondsClock clock1(clk, clock);
	
	always @ (posedge clock) begin 
		if(minuteCountVal2 == 6) begin //Reset min counter when 60
			minuteCountVal1 = 0;
			minuteCountVal2 = 0;
			
			if(hourCountVal1 == 4 && hourCountVal2 == 2) begin //Reset hour counter when 24
				hourCountVal1 = 0;
				hourCountVal2 = 0;

			end else begin //Add to hour counter
				if(hourCountVal1 == 9) begin
					hourCountVal2 = hourCountVal2 + 1;
					hourCountVal1 = 0;
				end else begin
					hourCountVal1 = hourCountVal1 + 1;
				end

			end

			if(minuteCountVal1 == 9) begin
				minuteCountVal1 = 0;
				minuteCountVal2 = minuteCountVal2 + 1;
			end else begin
				minuteCountVal1 = minuteCountVal1 + 1;
			end

		end
	end
	
	sevenSeg Seg0(minuteCounterVal1, Hex0); //display minutes LSB
	sevenSeg Seg1(minuteCounterVal1, Hex1); //display minutes MSB
	
	sevenSeg Seg2(hourCounterVal1, Hex2); //display hours LSB
	sevenSeg Seg3(hourCounterVal2, Hex3); //display hours MSB
	

endmodule