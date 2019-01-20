module Trap_Base_Register (
							/* -------------------- Output -------------------- */
							output reg [24:0] TBA,
							output reg [2:0] tt,
							output reg [3:0] Zero,
							/* -------------------- Input -------------------- */
							input [6:0] Trap_Type,
							input [31:0] ALU_Result,
							input TBR_Ld,
							input TBR_tt_Ld,
							input Clock,
							input Reset
							);
	
	initial
		begin
		TBA <= 25'd3;
		tt <= 3'd0;
		Zero <= 4'd0;
		end
		
	always @ (negedge Clock)
		begin
		if (TBR_tt_Ld && !Reset)
			begin
			tt <= Trap_Type[2:0];
			end
		else if (TBR_Ld && !Reset)
			begin
			TBA <= ALU_Result[31:7];
			tt <= ALU_Result[6:4];
			Zero <= ALU_Result[3:0];
			end
		end
endmodule