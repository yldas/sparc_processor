module Next_State_Address_Selector (
									output reg [1:0] Next_State_Address_Select,
									input [2:0] Next_State_Control,
									input Condition_Control,
									input Clock
									);
	
	always @*
		begin
		//$display("%t Next_State_Control: %b", $time, Next_State_Control);
		//$display("%t Condition_Control: %d", $time, Condition_Control);
		case (Next_State_Control)
			/* Select Encoder, Condition_Control don't care */
			3'b000:
				begin
				Next_State_Address_Select = 2'b00;
				end
			/* Select Fetch State, Condition_Control don't care */
			3'b001:
				begin
				Next_State_Address_Select = 2'b01;
				end
			/* Select Control Register, Condition_Control don't care */
			3'b010:
				begin
				//$display("%t Select Control Register, Condition_Control don't care", $time);
				Next_State_Address_Select = 2'b10;
				end
			/* Select Incrementer, Condition_Control don't care */
			3'b011:
				begin
				Next_State_Address_Select = 2'b11;
				end
			/* Condition do care*/
			/* Select Control_Register if Condition not met; Encoder if Condition met */
			3'b100:
				begin
				case (Condition_Control)
					/*Select Control_Register if conditions (COND or MOC) are not met*/
					1'b0:
						begin
						//$display("%t Select Control Register if Condition not met; Encoder if Condition met", $time);
						Next_State_Address_Select = 2'b10;
						end
					/*Select Encoder if conditions (COND or MOC) are met*/
					1'b1:
						begin 
						Next_State_Address_Select = 2'b00;
						end
				endcase
				end
			/* Select Control_Register if Condition not met; Fetch State if Condition met */
			3'b101:
				begin
				case (Condition_Control)
					/*Select Control_Register if conditions (COND or MOC) are not met*/
					1'b0:
						begin
						//$display("%t Select Control Register if Condition not met; Fetch State if Condition Met", $time);
						Next_State_Address_Select = 2'b10;
						end
					/*Select Fetch State if conditions (COND or MOC) are met*/
					1'b1:
						begin 
						Next_State_Address_Select = 2'b01;
						end
				endcase
				end
			/* Select Control_Register if Condition not met; Incrementer if Condition met */
			3'b110:
				begin
				case (Condition_Control)
					/*Select Control_Register if conditions (COND or MOC) are not met*/
					1'b0:
						begin
						//$display("%t Select Control Register if Condition not met; Incrementer if Condition met (1)", $time);
						Next_State_Address_Select = 2'b10;
						end
					/*Select Incrementer if conditions (COND or MOC) are met*/
					1'b1:
						begin 
						Next_State_Address_Select = 2'b11;
						end
				endcase
				end
			/* Select Control_Register if Condition not met; Incrementer if Condition met */
			3'b111:	// Used for MOC with Invert_Control = 0
				begin
				case (Condition_Control)
					/*Select Control_Register if conditions (COND or MOC) are not met*/
					1'b0:
						begin
						//$display("%t Select Control Register if Condition not met; Incrementer if Condition met (2)", $time);
						Next_State_Address_Select = 2'b10;
						end
					/*Select Incrementer if conditions (COND or MOC) are met*/
					1'b1:
						begin 
						Next_State_Address_Select = 2'b11;
						end
				endcase
				end
		endcase
		end
endmodule