module Processor_State_Register (
								/* -------------------- Output -------------------- */
								output reg [3:0] Impl, 			// 31-28
								output reg [3:0] Ver, 			// 24-27
								output reg N, 					// 23
								output reg Z, 					// 22
								output reg V, 					// 21
								output reg C, 					// 20
								output reg [5:0] Reserved, 		// 19-14
								output reg EC, 					// 13
								output reg EF, 					// 12
								output reg [3:0] PIL, 			// 11-8
								output reg S, 					// 7
								output reg PS, 					// 6
								output reg ET, 					// 5
								output reg [4:0] CWP, 			// 4-0
								/* -------------------- Input -------------------- */
								input Condition_N,
								input Condition_Z,
								input Condition_V,
								input Condition_C,
								input [31:0] ALU_Result,
								input [3:0] Processor_Interrupt_Level,
								input Processor_Operation_Mode,
								input Previous_Processor_Operation_Mode,
								input Trap_Enable,
								input [4:0] Current_Window_Pointer,
								input FR_Ld,
								input PSR_Ld,
								input Clock,
								input Reset
								);
		
	/* Initial Reset state */
	initial
		begin
		Impl <= 4'd0;
		Ver <= 3'd0;
		N <= 1'b0;
		Z <= 1'b0;
		V <= 1'b0;
		C <= 1'b0;
		Reserved <= 6'd0;
		EC <= 1'b0;
		EF <= 1'b0;
		PIL <= 4'b0100;
		S <= 1'b0;
		PS <= 1'b1;
		ET <= 1;
		CWP <= 5'b00011;
		end
		
	/* Asynchronous Reset Signal */		
	always @ (posedge Reset)
		begin
		Impl <= 4'd0;
		Ver <= 3'd0;
		N <= 1'b0;
		Z <= 1'b0;
		V <= 1'b0;
		C <= 1'b0;
		Reserved <= 6'd0;
		EC <= 1'b0;
		EF <= 1'b0;
		PIL <= 4'b0100;
		S <= 1'b0;
		PS <= 1'b1;
		ET <= 1;
		CWP <= 5'b00011;
		end
		
	always @ (negedge Clock)
		begin
		if (PSR_Ld && !Reset)
			begin
			N <= ALU_Result[23];
			Z <= ALU_Result[22];
			V <= ALU_Result[21];
			C <= ALU_Result[20];
			PIL <= ALU_Result[11:8];
			S <= ALU_Result[7];
			PS <= ALU_Result[6];
			ET <= ALU_Result[5];
			CWP <= ALU_Result[4:0];
			/*
			N <= Condition_N;
			Z <= Condition_Z;
			V <= Condition_V;
			C <= Condition_C;
			PIL <= Processor_Interrupt_Level;
			S <= Processor_Operation_Mode;
			PS <= Previous_Processor_Operation_Mode;
			ET <= Trap_Enable;
			CWP <= Current_Window_Pointer;
			*/
			end
		if (FR_Ld)
			begin
			//$display("%t Altering condition codes!!!", $time);
			N <= Condition_N;
			Z <= Condition_Z;
			V <= Condition_V;
			C <= Condition_C;
			end
		end
endmodule