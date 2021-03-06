	module fastClock(input clk, output reg new_clk);
	reg[24:0] count = 0;
	
	always @(posedge clk) begin	
			if(count < 10000000) begin //using 50 MHz clock (pin P11)
				count = count + 1; //add to counter until it reaches 25000000, then update new_clk 
			end else begin
				count = 0;
				new_clk = ~new_clk;
			end
	end
endmodule