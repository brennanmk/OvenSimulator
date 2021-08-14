module ovenClock(input clk, state, input [9:0] timer, output updateTemp, timerComplete);
	wire clock;
	reg[6:0] secondCount = 0;
	

	secondsClock clock1(clk, clock);
	
	//Clock
	always @ (posedge clock) begin 
		if(state == 3) begin //Check if oven is on
			if(timer != 0) begin
				timer = timer - 1;
			end else begin
				timerComplete = 1;
			end
		end
	
	end	

endmodule 