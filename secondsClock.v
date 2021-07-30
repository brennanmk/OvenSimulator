module secondsClock(input clk, output reg new_clk);
	reg[24:0] count = 0;
	
	always @(posedge clk) begin	
			if(count < 12500000) begin //using 50 MHz clock (pin P11)
				count = count + 1;
			end else begin
				count = 0;
				new_clk = ~new_clk;
			end
	end
endmodule