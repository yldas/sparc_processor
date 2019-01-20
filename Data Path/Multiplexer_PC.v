module Multiplexer_PC (
						output reg [31:0] PC,
						input [31:0] nPC,
						input [31:0] Adder4_Out,
						input [31:0] TBR,
						input [1:0] MUX_PC
						);
	
	always @*
		begin
		case (MUX_PC)
			2'b00:	// nPC
				begin
				PC = nPC;
				end
			2'b01:	// nPC + 4
				begin
				PC = Adder4_Out;
				end
			2'b10:	// TBR
				begin
				PC = TBR;
				end
			2'b11:	// Constant 0, from Reset trap
				begin
				PC = 32'h0;
				end
		endcase
		end
endmodule