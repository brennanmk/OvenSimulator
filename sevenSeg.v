module sevenSeg(input [3:0]A, output reg [0:6] Seg);
	always @(A) begin		
		case (A) //check what the value of A is and display on the sevenSeg
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
			10: begin //overflow incase 10 is entered - just stay at 9
				Seg = 7'b0000100;
				end
			11: begin //if A is 11 then turn the display off
				Seg = 7'b1111111;
				end
			default: begin
				Seg = 7'b1111111;
				end
					
		endcase
	end
endmodule 	