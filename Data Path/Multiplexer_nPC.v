module Multiplexer_nPC (
				output reg [31:0] nPC,
				input [31:0] Adder4_Out,
				input [31:0] Adder8_Out,
				input [31:0] ALU_Out,
				input [1:0] MUX_nPC
				);
		
	always @*
		begin
		case (MUX_nPC)
			2'b00:	// nPC + 4, TBR + 4
				begin
				nPC = Adder4_Out;
				end
			2'b01:	// nPC + 8
				begin
				nPC = Adder8_Out;
				end
			2'b10:	// PC + 4*disp30, PC + 4*disp22, rs1 + rs2, rs1 + simm13
				begin
				nPC = ALU_Out;
				end
			2'b11:	// Constant 4, from Reset trap
				begin
				nPC = 32'h4;
				end
			default:
				begin
				//$display("Invalid MUX_nPC Control Signal: %d", MUX_nPC);
				end
		endcase
		end
endmodule