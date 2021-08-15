module ovenClock(input clk, onOff, output reg[3:0]minuteCountVal1 = 0, output reg[3:0]minuteCountVal2 = 0, output reg[3:0]hourCountVal1 = 0, output reg[3:0]hourCountVal2 = 0, output [0:6] Hex0, Hex1, Hex2, Hex3);
	wire clock;
	reg[6:0] secondCount = 0;
	

	secondsClock clock1(clk, clock);
	
	//Clock
	always @ (posedge clock) begin 
			if(minuteCountVal1 == 9) begin
				minuteCountVal1 <= 0;
				if(minuteCountVal2 == 5) begin //Reset min counter when 60
					minuteCountVal1 <= 0;
					minuteCountVal2 <= 0;
					
					if(hourCountVal1 == 9) begin 
						hourCountVal1 = 0;
						if(hourCountVal2 == 2) begin
							hourCountVal2 = 0;
							hourCountVal1 = 0;
						end else begin
							hourCountVal2 = hourCountVal2 + 1;
						end
					end else begin
						hourCountVal1 = hourCountVal1 + 1;
					end
				end else begin
					minuteCountVal2 = minuteCountVal2 + 1;
				end
			end else begin
				minuteCountVal1 <= minuteCountVal1 + 1;
			end
	end	

endmodule 