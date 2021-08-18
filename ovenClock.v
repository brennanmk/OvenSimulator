module ovenClock(input clk, onOff, output reg[3:0]minuteCountVal1 = 0, output reg[3:0]minuteCountVal2 = 0, output reg[3:0]hourCountVal1 = 0, output reg[3:0]hourCountVal2 = 0, output [0:6] Hex0, Hex1, Hex2, Hex3);
	wire clock;
	reg[6:0] secondCount = 0;
	

	secondsClock clock1(clk, clock);
	
	//Clock
	always @ (posedge clock) begin 
			if(minuteCountVal1 == 9) begin //check if minuteCountVal1 is 9, reset to 0
				minuteCountVal1 <= 0;
				if(minuteCountVal2 == 5) begin //When minute counter reaches 60 minutes reset to 0 minutes
					minuteCountVal1 <= 0;
					minuteCountVal2 <= 0;
					
					if(hourCountVal2 == 2 && hourCountVal2 == 4) begin //if the hour counter is at 24 hours reset to 0 hours
						hourCountVal2 <= 0;
						hourCountVal1 <= 0;
					end
						
					if(hourCountVal1 == 9) begin  //if hour counter is 09 hours or 19 hours change it to 10 or 20 hours
						hourCountVal1 <= 0;
						hourCountVal2 <= hourCountVal2 + 1;
						
					end else begin
						hourCountVal1 <= hourCountVal1 + 1; //add 1 to the hour count
					end
				end else begin
					minuteCountVal2 <= minuteCountVal2 + 1; //add 1 to minuteCountVal2
				end
			end else begin
				minuteCountVal1 <= minuteCountVal1 + 1; //add 1 minute to the minute counter
			end
	end	

endmodule 