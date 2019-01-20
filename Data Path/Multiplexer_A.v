module Multiplexer_A (
				output reg [31:0] Operand_A,
				input [31:0] Register_A,
				input [31:0] PC,
				input [4:0] CWP,
				input [31:0] MUX_SR,
				input [1:0] MUX_A
				);
	always @*
		begin
		case (MUX_A)
			2'b00:
				begin
				Operand_A = Register_A;
				end
			2'b01:
				begin
				Operand_A = PC;
				end
			2'b10:
				begin
				Operand_A = {{27{1'b0}}, CWP};
				end
			2'b11:
				begin
				Operand_A = MUX_SR;
				end
			default:
				begin
				//$display("Invalid MUX_A Control Signal: %d", MUX_A);
				end
		endcase
		end
endmodule