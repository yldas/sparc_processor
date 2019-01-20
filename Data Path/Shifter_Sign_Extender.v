module Shifter_Sign_Extender (
								output reg [31:0] Result,
								input [31:0] Instruction
								);
								
	always @ (Instruction)
		begin
		case (Instruction[31:30])
			2'b00:	// SETHI and Branch Instructions
				begin
				case (Instruction[24:22])
					3'b100:	// SETHI Instruction
						begin
						Result = {Instruction[21:0], 10'd0};
						end
					3'b010:	// Branch Instruction
						begin
						Result = {{10{Instruction[21]}}, Instruction[21:0]} << 2; // 4*disp22
						end
					default:
						begin
						Result = 32'h0000;
						end
				endcase
				end
			2'b01:	// CALL Instruction
				begin
				Result = {{2{Instruction[29]}}, Instruction[29:0]} << 2; // 4*disp30
				end
			2'b10:	// Data Processing Instruction
				begin
				if (Instruction[13] == 1'b1)
					begin
					if (Instruction[24:19] == 6'b100101 || Instruction[24:19] == 6'b100110 || Instruction[24:19] == 6'b100111) // Shift Instruction
						begin
						Result = {Instruction[31:13], 8'b00000000, Instruction[4:0]};	// shcount
						end
					else if (Instruction[24:19] == 6'b111010)	// Trap Instruction
						begin
						Result = {{25{Instruction[6]}}, Instruction[6:0]};	// imm7
						end
					else
						begin
						Result = {{19{Instruction[12]}}, Instruction[12:0]};	// simm13
						end
					end
				else
					begin
					Result = 32'h0000;
					end
				end
			2'b11:	// Memory Instruction
				begin
				if (Instruction[13] == 1)
					begin
					Result = {{19{Instruction[12]}}, Instruction[12:0]};	// simm13
					end
				end
			default:
				begin
				Result = 32'h0000;
				end
		endcase
		end
endmodule