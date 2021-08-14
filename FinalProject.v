module FinalProject(input [3:0] in, input [1:0]pushButton, input clk, onOff, output [0:6] Hex0, Hex1, Hex2, Hex3, output [9:0]a, output [9:0]timer);
	
	localparam OVENCLOCK = 0, TEMPINPUT = 1, INCREASE = 2, HOLD = 3, DECREASE = 4;

	reg current_state = OVENCLOCK;
	
	
	wire clock;
	
	
	wire[3:0] minuteCountVal1;
	wire[3:0] minuteCountVal2; //MSB Minute EG the 6 in 60

	wire[3:0] hourCountVal1;
	wire[3:0] hourCountVal2;

	
	ovenClock ovenClk(clk, onOff, minuteCountVal1, minuteCountVal2, hourCountVal1, hourCountVal2);
	//temp_input temp_in(onOff, pushButton, in, a, timer, Hex0, Hex1, Hex2);
	//	compareTemp()
	
	
	sevenSeg Seg0(minuteCounterVal1, Hex0); //display minutes LSB
	sevenSeg Seg1(minuteCounterVal2, Hex1); //display minutes MSB
//		
	sevenSeg Seg2(hourCounterVal1, Hex2); //display hours LSB
	sevenSeg Seg3(hourCounterVal2, Hex3); //display hours MSB
	

endmodule