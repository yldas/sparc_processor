/* Written by Raul G. Cedres De Jesus
Date last edited: 5/6/2018
Description: This is the Inverter in the Microprogrammed Control Unit.
*/
module Inverter (
				output reg Condition_Control, 
				input Condition, 
				input Invert_Control
				);
	
	always @*
		begin
		if (Invert_Control == 1)
			begin
			Condition_Control = ~Condition;
			end
		else
			begin
			Condition_Control = Condition;
			end
		end	
endmodule