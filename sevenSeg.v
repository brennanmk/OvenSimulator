//Brennan Miller-Klugman
//seven segment
module sevenSeg(input [3:0]A, output reg [0:6] Seg);
	always @(A) begin		
		case (A)
			0: begin                
				Seg = 7'b0000001;       
				end
			1: begin                
				Seg = 7'b1001111;       
				end
			2: begin               
				Seg = 7'b0010010;
				end
			3: begin                
				Seg = 7'b0000110;
				end
			4: begin                
				Seg = 7'b1001100;
				end
			5: begin
				Seg = 7'b0100100;
				end
			6: begin   
				Seg = 7'b0100000;
				end
			7: begin
				Seg = 7'b0001111;
				end
			8: begin
				Seg = 7'b0000000;
				end
			9: begin
				Seg = 7'b0000100;
				end
		  10: begin
				Seg = 7'b0001000;
				end
		  11: begin
				Seg = 7'b1100000;
				end
		  12: begin
				Seg = 7'b0110001;
				end
		  13: begin
				Seg = 7'b1000010;
				end
		  14: begin
				Seg = 7'b0110000;
				end
		  15: begin
				Seg = 7'b0111000;
				end
					
		endcase
	end
endmodule 	