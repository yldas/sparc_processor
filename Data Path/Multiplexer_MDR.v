module Multiplexer_MDR (
				output reg [31:0] Memory_Data,
				input [31:0] Memory_Out,
				input [31:0] ALU_Out,
				input [1:0] MUX_MDR
				);
	always @*
		begin
		case (MUX_MDR)
			2'b00:
				begin
				Memory_Data <= Memory_Out;
				end
			2'b01:	
				begin
				Memory_Data <= ALU_Out;
				end
			default:
				begin
				//$display("Error in MUX_MDR");
				end
		endcase
		end
endmodule