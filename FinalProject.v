module FinalProject(input [3:0] in, input pushButton, clk, onOff, output [0:6] Hex0, Hex1, Hex2, Hex3, Hex4, Hex5);
	wire clock;
	reg[6:0] secondCount = 0;
	
	reg[3:0] minuteCountVal1 = 0;
	reg[3:0] minuteCountVal2 = 0; //MSB Minute EG the 6 in 60

	reg[3:0] hourCountVal1 = 0;
	reg[3:0] hourCountVal2 = 0;

	ovenClock ovnClk(clk, onOff, minuteCountVal1, minuteCountVal2, hourCountVal1, hourCountVal2);
	
	
	sevenSeg Seg0(minuteCounterVal1, Hex0); //display minutes LSB
	sevenSeg Seg1(minuteCounterVal1, Hex1); //display minutes MSB
		
	sevenSeg Seg2(hourCounterVal1, Hex2); //display hours LSB
	sevenSeg Seg3(hourCounterVal2, Hex3); //display hours MSB
	

endmodule