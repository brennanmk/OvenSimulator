module compareTemp(input inputTemp, currentTemp, output reg heatChange);
	
	always @(inputTemp) begin	
			if(inputTemp < currentTemp) begin 
				heatChange = 1;
			end else begin
				heatChange = 0;
			end
	end
endmodule