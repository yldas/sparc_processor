module Multiplexer_B (
				output reg [31:0] Operand_B,
				input [31:0] Register_B,
				input [31:0] Shifter_Extender_Result,
				input [31:0] MDR,
				input [4:0] CWP,
				input [1:0] MUX_B
				);
	always @*
		begin
		case (MUX_B)
			2'b00:
				begin
				Operand_B = Register_B;
				end
			2'b01:
				begin
				Operand_B = Shifter_Extender_Result;
				end
			2'b10:
				begin
				Operand_B = MDR;
				end
			2'b11:
				begin
				Operand_B = {{27{1'b0}}, CWP};
				end
		endcase
		end
endmodule