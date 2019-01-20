/* Written by Misael Valentin Feliciano
Date last edited: 5/9/2018
Description: This is the Next State Address Multiplexer. It chooses one among several next state adddress
sources to pass the address provided by that source to the Microstore.
The source of these addresses may be: an Encoder, an Incrementer Register, and a Control Register.
The selection is determined by the Next State Address Selector.
*/
module Next_State_Address_MUX (
								output reg [8:0] Next_State_Address,
								input [8:0] Encoder_Address,
								input [8:0] Incrementer_Register_Address,
								input [8:0] Control_Register_Address,
								input [1:0] Next_State_Address_Select,
								input Clock
								);
	always @*
		begin
		//$display("%t Next_State_Address_Select: %b", $time, Next_State_Address_Select);
		case (Next_State_Address_Select)
			2'b00:
				begin
				//$display("%t Next_State_Address generated from Encoder: %d", $time, Encoder_Address);
				Next_State_Address = Encoder_Address;
				end
			2'b01:
				begin
				//$display("%t Fetching next Instruction", $time);
				Next_State_Address = 9'd1;	// Fetch State
				end
			2'b10:
				begin
				//$display("%t Next_State_Address generated from Control_Register: %d", $time, Control_Register_Address);
				Next_State_Address = Control_Register_Address;
				end
			2'b11:
				begin
				//$display("%t Next_State_Address generated from Incrementer", $time);
				Next_State_Address = Incrementer_Register_Address;
				end
			default:
				begin
				//$display("%t Invalid Next_State_Address_Select", $time); 
				end
		endcase
		end
endmodule