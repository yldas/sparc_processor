module Multiplexer_OP (
				output reg [5:0] OP,
				input [5:0] IR_OP3,
				input [5:0] CR_OP,
				input [1:0] MUX_OP
				);
	always @*
		begin
		case (MUX_OP)
			2'b00:
				begin
				OP <= IR_OP3;
				end
			2'b01:	
				begin
				OP <= CR_OP;
				end
			default:
				begin
				//$display("Error in MUX_OP");
				end
		endcase
		end
endmodule