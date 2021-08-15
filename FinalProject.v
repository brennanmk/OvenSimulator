module FinalProject(input [3:0] in, input [1:0]pushButton, input clk, onOff, output [0:6] Hex0, Hex1, Hex2, Hex3, Hex4, Hex5);
	

	reg [1:0]state = 0;
		
	reg [3:0]hexVal0, hexVal1, hexVal2, hexVal3, hexVal4, hexVal5;
	
	secondsClock clock1(clk, clock);
	
	wire[3:0] minuteCountVal1; 
	wire[3:0] minuteCountVal2;
	wire[3:0] hourCountVal1;
	wire[3:0] hourCountVal2;
	
	ovenClock ovenClk(clk, onOff, minuteCountVal1, minuteCountVal2, hourCountVal1, hourCountVal2);	
	
	wire[3:0] hex0; 
	wire[3:0] hex1;
	wire[3:0] hex2;
	wire[3:0] hex3;
	
	reg[9:0] tempVal;
	reg[9:0] timerVal;
	
	temp_input tmp_in(clk, onOff, pushButton[1:0], in[3:1], hex0, hex1, hex2, hex3);
	
	wire[3:0] tempHex0; 
	wire[3:0] tempHex1;
	wire[3:0] tempHex2;
	
	bakingState bake(clk, state[1:0], timerVal, tempVal, tempHex0, tempHex1, tempHex2);


	
	always @(posedge clock) begin
		if(onOff == 0) begin
			hexVal0 <= minuteCountVal1;
			hexVal1 <= minuteCountVal2;
			hexVal2 <= hourCountVal1;
			hexVal3 <= hourCountVal2;
			hexVal4 <= 10;
			hexVal5 <= 10;
		end else begin
			if(state == 0) begin //enter temp
				hexVal0 <= hex0;
				hexVal1 <= hex1;
				hexVal2 <= hex2;
				hexVal3 <= 10;
				hexVal4 <= 10;
				hexVal5 <= 10;
				
				if(pushButton[1] == 0) begin //move to timer
					tempVal <= hex0 + (hex1 * 10) + (hex2 * 100);
					state <= 1;

				end
			end else if (state == 1) begin //enter timer
				hexVal0 <= hex0;
				hexVal1 <= hex1;
				hexVal2 <= hex2;
				hexVal3 <= hex3;
				hexVal4 <= 10;
				hexVal5 <= 10;
				
				
				if(pushButton[1] == 0) begin // move to cook
					timerVal <= hex0 + (hex1 * 6) + (hex2 * 60) + (hex3 * 600);
					state <= 2;

				end
			end else if (state == 2) begin
				hexVal0 <= tempHex0;
				hexVal1 <= tempHex1;
				hexVal2 <= tempHex2;
				hexVal3 <= 10;
				hexVal4 <= 10;
				hexVal5 <= 10;
			end
		end
	end


	sevenSeg Seg0(hexVal0, Hex0); //display minutes LSB
	sevenSeg Seg1(hexVal1, Hex1); //display minutes MSB
	
	sevenSeg Seg2(hexVal2, Hex2); //display hours LSB
	sevenSeg Seg3(hexVal3, Hex3); //display hours MSB	
	
	sevenSeg Seg4(hexVal4, Hex4); //display hours LSB
	sevenSeg Seg5(hexVal5, Hex5); //display hours MSB	
	
	
endmodule