module Instruction_Register (
							output reg [31:0] IR,
							input [31:0] Memory_Data_Out,
							input Load_Enable,
							input Clock
							);
		
	always @ (negedge Clock)
		begin
		if (Load_Enable)
			begin
			IR <= Memory_Data_Out;
			end
		end
endmodule