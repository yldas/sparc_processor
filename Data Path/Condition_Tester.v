module Condition_Tester (
						output reg Cond,
						input [31:0] IR,
						input N,
						input Z,
						input V,
						input C,
						input [4:0] CWP,
						input [31:0] WIM,
						input Clock
						);
	
	always @*
		begin
		if (IR[31:30] == 2'b00 && IR[24:22] == 3'b010)
			begin
			case (IR[28:25])
				4'b1000:	// BA (Branch Always)
					begin
					Cond <= 1'b1;
					end
				4'b0000:	// BN (Branch Never)
					begin
					Cond <= 1'b0;
					end
				4'b1001:	// BNE (Branch on Not Equal)
					begin
					if (!Z)
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b0001:	// BE (Branch on Equal)
					begin
					if (Z)
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b1010:	// BG (Branch on Greater)
					begin
					if (!(Z || (N ^ V)))
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b0010:	// BLE (Branch on Less or Equal)
					begin
					if (Z || (N ^ V))
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b1011:	// BGE (Branch on Greater or Equal)
					begin
					if (!(N ^ V))
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b0011:	// BL (Branch on Less)
					begin
					if (N ^ V)
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b1100:	// BGU (Branch on Greater Unsigned)
					begin
					if (!(C || Z))
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b0100:	// BLEU (Branch on Less or Equal Unsigned)
					begin
					if (C || Z)
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b1101:	// BCC (Branch on Carry Clear)
					begin
					if (!C)
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b0101:	// BCS (Branch on Carry Set)
					begin
					if (C)
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b1110:	// BPOS (Branch on Positive)
					begin
					if (!N)
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b0110:	// BNEG (Branch on Negative)
					begin
					if (N)
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b1111:	// BVC (Branch on Overflow Clear)
					begin
					if (!V)
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				4'b1111:	// BVS (Branch on Overflow Set)
					begin
					if (V)
						begin
						Cond <= 1'b1;
						end
					else
						begin
						Cond <= 1'b0;
						end
					end
				default:
					begin
					//$display("Error in Condition Tester");
					end
			endcase
			end
		else if (IR[31:30] == 2'b10 && IR[24:19] == 6'b111010)	// Trap Instructions
			begin
			case (IR[28:25])
				4'b1000:	// TA (Trap Always)
					begin
					Cond <= 1'b1;
					end
			endcase
			end
		else if (IR[31:30] == 2'b10 && IR[24:19] != 6'b111010)	// SAVE and RESTORE Instructions
			begin
			Cond <= 1;
			/*
			case (IR[24:19])
				6'b111100:	// SAVE
					begin
					if (WIM[(CWP - 1) % 1'd4] == 1'b1)
						begin
						Cond <= 1'b1;	// Overflow true
						end
					else
						begin
						Cond <= 1'b0;	// Overflow false
						end
					end
				6'b111101:	// RESTORE
					begin
					if (WIM[(CWP + 1) % 1'd4] == 1'b1)
						begin
						Cond <= 1'b1;	// Underflow true
						end
					else
						begin
						Cond <= 1'b0;	// Underflow false
						end
					end
			endcase
			*/
			end
		else
			begin
			Cond <= 1'b1;	// Don't care
			end
		end
endmodule