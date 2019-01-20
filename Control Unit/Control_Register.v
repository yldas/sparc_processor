/* Written by Misael Valentin Feliciano
Date last edited: 5/9/2018
Description: This is the Control Register. It stores the control signals associated with the current state. It is loaded by the Microstore.
*/
module Control_Register (
						/* -------------------- Output -------------------- */
						// Register Load Enable Control Signals
						output reg RF_Ld,
						output reg FR_Ld,
						output reg IR_Ld,
						output reg MAR_Ld,
						output reg MDR_Ld,
						output reg PSR_Ld,
						output reg nPC_Ld,
						output reg PC_Ld,
						output reg TBR_Ld,
						output reg TBR_tt_Ld,
						output reg WIM_Ld,
						// Multiplexer Select Control Signals
						output reg [1:0] MUX_A,
						output reg [1:0] MUX_B,
						output reg [1:0] MUX_OP,
						output reg [1:0] MUX_RFA,
						output reg [1:0] MUX_RFB,
						output reg [2:0] MUX_RFDest,
						output reg [1:0] MUX_nPC,
						output reg [1:0] MUX_PC,
						output reg [1:0] MUX_Add4,
						output reg [1:0] MUX_MDR,
						output reg [1:0] MUX_SR,
						// Memory Control Signals
						output reg RW,
						output reg MOV,
						output reg [1:0] SIZE,
						output reg SU,
						// Other Control Signals
						output reg [5:0] OP,
						// Feedback Control Signals
						output reg [8:0] CR_Addr,
						output reg [2:0] NS_Ctrl,
						output reg INV_Ctrl,
						output reg [1:0] COND_Sel,
						// Debugging
						output reg [8:0] Current_State,
						/* -------------------- Input -------------------- */
						// Register Load Enable Control Signals
						input Register_File_Load,
						input Flags_Register_Load,
						input Instruction_Register_Load,
						input Memory_Address_Register_Load,
						input Memory_Data_Register_Load,
						input Processor_State_Register_Load,
						input Next_Program_Counter_Register_Load,
						input Program_Counter_Register_Load,
						input Trap_Base_Register_Load,
						input Trap_Base_Register_tt_Load,
						input Window_Invalid_Mask_Load,
						// Multiplexer Select Control Signals
						input [1:0] MUX_A_Sel,
						input [1:0] MUX_B_Sel,
						input [1:0] MUX_OP_Sel,
						input [1:0] MUX_RFA_Sel,
						input [1:0] MUX_RFB_Sel,
						input [2:0] MUX_RFDest_Sel,
						input [1:0] MUX_PC_Sel,
						input [1:0] MUX_nPC_Sel,
						input [1:0] MUX_Add4_Sel,
						input [1:0] MUX_MDR_Sel,
						input [1:0] MUX_SR_Sel,
						// Memory Control Signals
						input Read_Write,
						input Memory_Operation_Valid,
						input [1:0] Memory_Operation_Size,
						input Signed_Unsigned,
						// Other Control Signals
						input [5:0] Opcode,
						// Feedback Control Signals
						input [8:0] Control_Register_Address,
						input [2:0] Next_State_Selector_Control,
						input Invert_Control,
						input [1:0] Condition_Select,
						// Clock
						input Clock,
						// Debugging
						input [8:0] Next_State
						);
						
	always @ (negedge Clock)
		begin
		RF_Ld <= Register_File_Load;
		FR_Ld <= Flags_Register_Load;
		IR_Ld <= Instruction_Register_Load;
		MAR_Ld <= Memory_Address_Register_Load;
		MDR_Ld <= Memory_Data_Register_Load;
		PSR_Ld <= Processor_State_Register_Load;
		nPC_Ld <= Next_Program_Counter_Register_Load;
		PC_Ld <= Program_Counter_Register_Load;
		TBR_Ld <= Trap_Base_Register_Load;
		TBR_tt_Ld <= Trap_Base_Register_tt_Load;
		WIM_Ld <= Window_Invalid_Mask_Load;
		// Multiplexer Select Control Signals
		MUX_A <= MUX_A_Sel;
		MUX_B <= MUX_B_Sel;
		MUX_OP <= MUX_OP_Sel;
		MUX_RFA <= MUX_RFA_Sel;
		MUX_RFB <= MUX_RFB_Sel;
		MUX_RFDest <= MUX_RFDest_Sel;
		MUX_nPC <= MUX_nPC_Sel;
		MUX_PC <= MUX_PC_Sel;
		MUX_Add4 <= MUX_Add4_Sel;
		MUX_MDR <= MUX_MDR_Sel;
		MUX_SR <= MUX_SR_Sel;
		// Memory Control Signals
		RW <= Read_Write;
		MOV <= Memory_Operation_Valid;
		SIZE <= Memory_Operation_Size;
		SU <= Signed_Unsigned;
		// Other Control Signals
		OP <= Opcode;
		// Feedback Control Signals
		CR_Addr <= Control_Register_Address;
		NS_Ctrl <= Next_State_Selector_Control;
		INV_Ctrl <= Invert_Control;
		COND_Sel <= Condition_Select;
		// Debugging
		Current_State <= Next_State;
		end
endmodule	