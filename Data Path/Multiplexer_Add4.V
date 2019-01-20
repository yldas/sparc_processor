module Multiplexer_Add4 (
				output reg [31:0] Output,
				input [31:0] nPC,
				input [31:0] TBR,
				input [1:0] MUX_Add4
				);
				
	always @*
		begin
		case (MUX_Add4)
			2'b00:	// nPC
				begin
				Output = nPC;
				end
			2'b01:	// TBR
				begin
				Output = TBR;
				end
		endcase
		end
endmodule