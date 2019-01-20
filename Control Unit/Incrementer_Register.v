module Incrementer_Register (
								output reg [8:0] Next_State_Address,
								input [8:0] Incremented_Address,
								input Clock
								);
	always @ (posedge Clock)
		begin
		Next_State_Address <= Incremented_Address;
		end
endmodule