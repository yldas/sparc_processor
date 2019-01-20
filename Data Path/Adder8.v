module Adder8 (
				output reg [31:0] Output,	// nPC + 8
				input [31:0] Input	// nPC
				);
	always @*
		begin
		Output = Input + 32'h8;
		end
endmodule	