module ovenTimer(input clk, input [1:0]state, input [9:0] timer, output reg[1:0] timerComplete);
	wire clock;
	
	reg[9:0] counter = 0;
	reg[9:0] timeIn;

	wire[6:0] secondCount = 0;
	
	secondsClock clock3(clk, clock);
	
	//Clock
	always @ (posedge clock) begin
		timeIn <= timer;
		if(state == 2) begin //Check if oven is on
			if(counter < 5) begin
				counter = counter + 1;
			end else if(timerComplete == 0) begin	
				timerComplete = 1;
			end
		end
	
	end	

endmodule 