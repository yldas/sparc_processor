module Condition_MUX (
						output reg Condition,
						input Memory_Operation_Complete,
						input Branch_Condition,
						input Branch_Annul,
						input Trap,
						input [1:0] Condition_Select
						);
	
	always @*
		begin
		case (Condition_Select)
			2'b00:	// Memory Operation Complete
				begin
				Condition = Memory_Operation_Complete;
				end
			2'b01:	// Branch Condition
				begin
				Condition = Branch_Condition;
				end
			2'b10: // Branch Annul Condition
				begin
				Condition = Branch_Annul;
				end
			2'b11: // Trap Condition
				begin
				Condition = Trap;
				end
		endcase
		end
endmodule