module ovenClock(input clk, onOff, output reg[3:0]minuteCountVal1 = 0, output reg[3:0]minuteCountVal2 = 0, output reg[3:0]hourCountVal1 = 0, output reg[3:0]hourCountVal2 = 0);
	wire clock;
	reg[6:0] secondCount = 0;
	

	secondsClock clock1(clk, clock);
	
	//Clock
	always @ (posedge clock) begin 
		if(onOff == 0) begin //Check if oven is on

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
	end	

endmodule