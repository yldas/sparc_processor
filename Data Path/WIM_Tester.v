module WIM_Tester (
					output reg Trap,
					input [31:0] Instruction,
					input [4:0] CWP,
					input [31:0] WIM
					);
	
	always @*
		begin
		case (Instruction[24:19])
			6'b111100:	// SAVE
				begin
				if (WIM[(((CWP - 1) % 4) + 4) % 4] == 1'b1)
					begin
					Trap = 1'b1;	// Overflow true
					end
				else
					begin
					Trap = 1'b0;	// Overflow false
					end
				end
			6'b111101:	// RESTORE
				begin
				if (WIM[(((CWP + 1) % 4) + 4) % 4] == 1'b1)
					begin
					Trap = 1'b1;	// Underflow true
					end
				else
					begin
					Trap = 1'b0;	// Underflow false
					end
				end
		endcase
		end
endmodule
	