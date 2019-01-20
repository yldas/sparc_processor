module Adder4 (
				output reg [31:0] Output,	// nPC + 4, TBR + 4
				input [31:0] Input	// nPC, TBR
				);
	always @*
		begin
		Output = Input + 32'h4;
		end
endmodule		