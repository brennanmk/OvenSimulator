module FinalProject(input [3:0] in, input [1:0]pushButton, input clk, onOff, output [0:6] Hex0, Hex1, Hex2, Hex3, Hex4, Hex5);
	

	reg [1:0]state = 0; //variable to keep track of state
		
	reg [3:0]hexVal0, hexVal1, hexVal2, hexVal3, hexVal4, hexVal5; //hex val variable to be used by sevenSeg calls
	
	secondsClock clock1(clk, clock);
	
	wire[3:0] minuteCountVal1; //hex variables to be used by secondsClock module
	wire[3:0] minuteCountVal2;
	wire[3:0] hourCountVal1;
	wire[3:0] hourCountVal2;
	
	ovenClock ovenClk(clk, onOff, minuteCountVal1, minuteCountVal2, hourCountVal1, hourCountVal2); //clock when oven is off
	
	wire[3:0] hex0; //hex variables to be used by temp and timer input module
	wire[3:0] hex1;
	wire[3:0] hex2;
	wire[3:0] hex3;
	
	reg[9:0] tempVal;
	reg[9:0] timerVal;
	
	temp_input tmp_in(clk, onOff, pushButton[1:0], in[3:1], hex0, hex1, hex2, hex3); //temp and timer input
	
	wire[3:0] tempHex0; //hex variables to be used by baking state
	wire[3:0] tempHex1;
	wire[3:0] tempHex2;
	
	bakingState bake(clk, state[1:0], timerVal, tempVal, tempHex0, tempHex1, tempHex2); //baking state module returns the temp while the oven is running


	
	always @(posedge clock) begin
		if(onOff == 0) begin //if the oven on/off switch is off then display the oven clock on the seven segment displays
			hexVal0 <= minuteCountVal1;
			hexVal1 <= minuteCountVal2;
			hexVal2 <= hourCountVal1;
			hexVal3 <= hourCountVal2;
			hexVal4 <= 10; //setting this to 10 means the display is off
			hexVal5 <= 10;
		end else begin
			if(state == 0) begin //display temp input on sevenSeg
				hexVal0 <= hex0;
				hexVal1 <= hex1;
				hexVal2 <= hex2;
				hexVal3 <= 10;
				hexVal4 <= 10;
				hexVal5 <= 10;
				
				if(pushButton[1] == 0) begin //move to timer input when push button is pressed
					tempVal <= hex0 + (hex1 * 10) + (hex2 * 100); //calculate the temp from user input
					state <= 1;

				end
			end else if (state == 1) begin //display timer input on sevenSeg
				hexVal0 <= hex0;
				hexVal1 <= hex1;
				hexVal2 <= hex2;
				hexVal3 <= hex3;
				hexVal4 <= 10;
				hexVal5 <= 10;
				
				
				if(pushButton[1] == 0) begin // move to cook when push button is pressed
					timerVal <= hex0 + (hex1 * 6) + (hex2 * 60) + (hex3 * 600); //calculate the timer in minutes from user entry
					state <= 2;

				end
			end else if (state == 2) begin //use sevenSeg to display the tempeture while cooking
				hexVal0 <= tempHex0;
				hexVal1 <= tempHex1;
				hexVal2 <= tempHex2;
				hexVal3 <= 10;
				hexVal4 <= 10;
				hexVal5 <= 10;
			end
		end
	end


	sevenSeg Seg0(hexVal0, Hex0); //display values on sevenSeg
	sevenSeg Seg1(hexVal1, Hex1); 
	sevenSeg Seg2(hexVal2, Hex2);
	sevenSeg Seg3(hexVal3, Hex3); 
	sevenSeg Seg4(hexVal4, Hex4); 
	sevenSeg Seg5(hexVal5, Hex5);
	
	
endmodule