module Multiplexer_RFB (
				output reg [4:0] Register_B_Sel,
				input [4:0] IR_RS2,
				input [1:0] MUX_RFB
				);
	always @*
		begin
		case (MUX_RFB)
			2'b00:
				begin
				Register_B_Sel = IR_RS2;
				end
			2'b01:
				begin
				Register_B_Sel = 5'b00000;
				end
		endcase
		end
endmodule