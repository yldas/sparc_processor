/* Written by Misael Valentin Feliciano
Date last edited: 4/21/2018
Description: This is a source for the Next State Address Multiplexer. It increments the current state address
and stores the result in a register.
*/
module Address_Incrementer (
							output reg [8:0] Next_State_Address,
							input [8:0] Current_State_Address
							);
	always @ (Current_State_Address)
		begin
		Next_State_Address = Current_State_Address + 1;
		end
endmodule