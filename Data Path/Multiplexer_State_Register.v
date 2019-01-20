module Multiplexer_State_Register (
				output reg [31:0] State_Register,
				input [31:0] PSR,
				input [31:0] TBR,
				input [31:0] WIM,
				input [31:0] nPC,
				input [1:0] MUX_SR
				);
				
	always @*
		begin
		case (MUX_SR)
			2'b00:
				begin
				State_Register <= PSR;
				end
			2'b01:	
				begin
				State_Register <= TBR;
				end
			2'b10:
				begin
				State_Register <= WIM;
				end
			2'b11:
				begin
				State_Register <= nPC;
				end
			default:
				begin
				//$display("Error in MUX_SR");
				end
		endcase
		end
endmodule