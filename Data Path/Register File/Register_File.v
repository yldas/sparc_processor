module Register_File (
						/* -------------------- Output -------------------- */
						output reg [31:0] Register_A,
						output reg [31:0] Register_B,
						/* -------------------- Input -------------------- */
						input [31:0] Data_In,				// Data to be stored in a register; comes from ALU
						input [4:0] Destination_Register,	// Determines which register is to be loaded with data
						input [4:0] Register_A_Select,
						input [4:0] Register_B_Select,
						input [4:0] Current_Window_Pointer,
						input RF_Ld,
						input Clock
						);
						
	wire [31:0] R0;
	wire [31:0] R1;
	wire [31:0] R2;
	wire [31:0] R3;
	wire [31:0] R4;
	wire [31:0] R5;
	wire [31:0] R6;
	wire [31:0] R7;
	wire [31:0] R8;
	wire [31:0] R9;
	wire [31:0] R10;
	wire [31:0] R11;
	wire [31:0] R12;
	wire [31:0] R13;
	wire [31:0] R14;
	wire [31:0] R15;
	wire [31:0] R16;
	wire [31:0] R17;
	wire [31:0] R18;
	wire [31:0] R19;
	wire [31:0] R20;
	wire [31:0] R21;
	wire [31:0] R22;
	wire [31:0] R23;
	wire [31:0] R24;
	wire [31:0] R25;
	wire [31:0] R26;
	wire [31:0] R27;
	wire [31:0] R28;
	wire [31:0] R29;
	wire [31:0] R30;
	wire [31:0] R31;
	wire [31:0] Register_Enable;
	wire [31:0] Register_A_Wire;
	wire [31:0] Register_B_Wire;
	
	Binary_Decoder BD (
						/* -------------------- Output -------------------- */
						Register_Enable,
						/* -------------------- Input -------------------- */
						Destination_Register,
						RF_Ld
						);
						
	Register_Window RW (
						/* -------------------- Output -------------------- */
						R31,
						R30,
						R29,
						R28,
						R27,
						R26,
						R25,
						R24,
						R23,
						R22,
						R21,
						R20,
						R19,
						R18,
						R17,
						R16,
						R15,
						R14,
						R13,
						R12,
						R11,
						R10,
						R9,
						R8,
						R7,
						R6,
						R5,
						R4,
						R3,
						R2,
						R1,
						R0,
						/* -------------------- Input -------------------- */
						Data_In,
						Register_Enable,
						Clock,
						Current_Window_Pointer,
						RF_Ld
						);
		
	MUX_Register_A MUX_A (
							/* -------------------- Output -------------------- */
							Register_A_Wire,
							/* -------------------- Input -------------------- */
							Register_A_Select,
							R31,
							R30,
							R29,
							R28,
							R27,
							R26,
							R25,
							R24,
							R23,
							R22,
							R21,
							R20,
							R19,
							R18,
							R17,
							R16,
							R15,
							R14,
							R13,
							R12,
							R11,
							R10,
							R9,
							R8,
							R7,
							R6,
							R5,
							R4,
							R3,
							R2,
							R1,
							R0
							);
							
	MUX_Register_B MUX_B (
							/* -------------------- Output -------------------- */
							Register_B_Wire,
							/* -------------------- Input -------------------- */
							Register_B_Select,
							R31,
							R30,
							R29,
							R28,
							R27,
							R26,
							R25,
							R24,
							R23,
							R22,
							R21,
							R20,
							R19,
							R18,
							R17,
							R16,
							R15,
							R14,
							R13,
							R12,
							R11,
							R10,
							R9,
							R8,
							R7,
							R6,
							R5,
							R4,
							R3,
							R2,
							R1,
							R0
							);
							
	always @*
		begin
		Register_A <= Register_A_Wire;
		Register_B <= Register_B_Wire;
		end
		
endmodule