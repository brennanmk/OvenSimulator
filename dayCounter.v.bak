module dayCounter(input [3:0] in, input pushButton, clk, output [0:6] Hex0, Hex1, Hex2, Hex3, Hex4, Hex5);
	wire clock;
	reg[24:0] secondCount = 0;
	reg[24:0] minuteCount = 0;
	reg[4:0] hourCountVal1 = 0;


	New_Clk clock1(clk, clock);
	
	always @ (posedge clock) begin 
		if(secondCount < 60) begin //Count to 60 seconds
				secondCount = secondCount + 1; //Add to second counter
		end else begin
			secondCount = 0; //Reset second counter
			
			if(minuteCount == 60) begin //Reset min counter when 60
				minuteCount = 0;
				
				if(hourCount == 24) begin //Reset hour counter when 24
					hourCount = 0;
				
				end else begin //Add to hour counter
					hourCount = hourCount + 1;
				end

			end else begin //Add to minute counter
				minuteCount = minuteCount + 1;
			end
					end
	end
	
	sevenSeg Seg0(minuteCounter, Hex0, Hex1); //display minutes
	sevenSeg Seg1(hourCounter, Hex2, Hex3); //display hours
	

endmodule