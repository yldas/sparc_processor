module Multiplexer_RFA (
				output reg [4:0] Register_A_Sel,
				input [4:0] IR_RS1,
				input [4:0] IR_RD,
				input [1:0] MUX_RFA
				);
	always @*
		begin
		case (MUX_RFA)
			2'b00:
				begin
				Register_A_Sel = IR_RS1;
				end
			2'b01:
				begin
				Register_A_Sel = 5'b00000;
				end
			2'b10:
				begin
				Register_A_Sel = IR_RD;
				end
			default:
				begin
				//$display("Invalid MUX_RFA Control Signal: %d", MUX_RFA);
				end
		endcase
		end
endmodule