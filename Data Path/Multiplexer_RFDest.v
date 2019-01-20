module Multiplexer_RFDest (
				output reg [4:0] Register_Dest_Sel,
				input [4:0] IR_RD,
				input [2:0] MUX_RFDest
				);
				
	always @*
		begin
		case (MUX_RFDest)
			3'b000:
				begin
				Register_Dest_Sel = IR_RD;	// Select RD field from IR
				end
			3'b001:
				begin
				Register_Dest_Sel = 5'b00000;	// Select G0, which is hardcoded to 0
				end
			3'b010:
				begin
				Register_Dest_Sel = 5'b01111;	// Select R15
				end
			3'b011:
				begin
				Register_Dest_Sel = 5'b10001;	// Select R17
				end
			3'b100:
				begin
				Register_Dest_Sel = 5'b10010;	// Select R18
				end
			default:
				begin
				//$display("Invalid MUX_RFDest Control Signal: %d", MUX_RFDest);
				end
		endcase
		end
endmodule