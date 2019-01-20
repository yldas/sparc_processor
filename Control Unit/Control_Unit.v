module Control_Unit (
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
					// Debugging
					output reg [8:0] State_Number,
					/* -------------------- Input -------------------- */
					input [31:0] IR,
					input MOC,
					input Cond,
					input Trap,
					input [31:0] PSR,
					input [31:0] WIM,
					// External Signals
					input Clock,
					input Reset
					);
	
	/* ---------------------------------- Internal Wires ----------------------------------------- */
	wire [8:0] Next_State_Address_Wire;					// Output: Next_State_Address_MUX			Input: Microstore, Address_Incrementer
	
	wire [8:0] Encoder_Address_Wire;					// Output: Next_State_Address_Encoder		Input: Next_State_Address_MUX
	
	wire [8:0] Incrementer_Register_Address_Wire;		// Output: Incrementer_Register				Input: Next_State_Address_MUX
	
	wire [1:0] Next_State_Address_Select_Wire;			// Output: Next_State_Address_Selector		Input: Next_State_Address_MUX
	
	wire Condition_Control_Wire;						// Output: Inverter							Input: Next_State_Address_Selector
	
	wire [8:0] Incrementer_Address_Wire;				// Output: Address_Incrementer				Input: Incrementer_Register
	
	wire Condition_Wire;								// Output: Control_MUX						Input: Inverter
	
	// Register Load Enable Control Signals
	wire Register_File_Load_Wire;						// Output: Microstore						Input: Control_Register
	wire Flags_Register_Load_Wire;						// Output: Microstore						Input: Control_Register
	wire Instruction_Register_Load_Wire;				// Output: Microstore						Input: Control_Register
	wire Memory_Address_Register_Load_Wire;				// Output: Microstore						Input: Control_Register
	wire Memory_Data_Register_Load_Wire;				// Output: Microstore						Input: Control_Register
	wire Processor_State_Register_Load_Wire;			// Output: Microstore						Input: Control_Register
	wire Next_Program_Counter_Register_Load_Wire;		// Output: Microstore						Input: Control_Register
	wire Program_Counter_Register_Load_Wire;			// Output: Microstore						Input: Control_Register
	wire Trap_Base_Register_Load_Wire;					// Output: Microstore						Input: Control_Register
	wire Trap_Base_Register_tt_Load_Wire;				// Output: Microstore						Input: Control_Register
	wire Window_Invalid_Mask_Load_Wire;					// Output: Microstore						Input: Control_Register
	// Multiplexer Select Control Signals				
	wire [1:0] MUX_A_Sel_Wire;							// Output: Microstore						Input: Control_Register
	wire [1:0] MUX_B_Sel_Wire;							// Output: Microstore						Input: Control_Register
	wire [1:0] MUX_OP_Sel_Wire;							// Output: Microstore						Input: Control_Register
	wire [1:0] MUX_RFA_Sel_Wire;						// Output: Microstore						Input: Control_Register
	wire [1:0] MUX_RFB_Sel_Wire;						// Output: Microstore						Input: Control_Register
	wire [2:0] MUX_RFDest_Sel_Wire;						// Output: Microstore						Input: Control_Register
	wire [1:0] MUX_nPC_Sel_Wire;						// Output: Microstore						Input: Control_Register
	wire [1:0] MUX_PC_Sel_Wire;							// Output: Microstore						Input: Control_Register
	wire [1:0] MUX_Add4_Sel_Wire;						// Output: Microstore						Input: Control_Register
	wire [1:0] MUX_MDR_Sel_Wire;						// Output: Microstore						Input: Control_Register
	wire [1:0] MUX_SR_Sel_Wire;							// Output: Microstore						Input: Control_Register
	// Memory Control Signals
	wire Read_Write_Wire;								// Output: Microstore						Input: Control_Register
	wire Memory_Operation_Valid_Wire;					// Output: Microstore						Input: Control_Register
	wire [1:0] Memory_Operation_Size_Wire;				// Output: Microstore						Input: Control_Register
	wire Signed_Unsigned_Wire;							// Output: Microstore						Input: Control_Register
	// Other Control Signals
	wire [5:0] Opcode_Wire;								// Output: Microstore						Input: Control_Register
	// Feedback Control Signals
	wire [8:0] Control_Register_Address_Wire;			// Output: Microstore						Input: Control_Register
	wire [2:0] Next_State_Selector_Control_Wire;		// Output: Microstore						Input: Control_Register
	wire Invert_Control_Wire;							// Output: Microstore						Input: Control_Register
	wire [1:0] Condition_Select_Wire;					// Output: Microstore						Input: Control_Register
	// Debugging
	wire [8:0] State_Number_Wire;						// Output: Microstore						Input: Control_Register
		
	// Register Load Enable Control Signals
	wire RF_Ld_Wire;									// Output: Control_Register					Input: Control_Unit
	wire FR_Ld_Wire;									// Output: Control_Register					Input: Control_Unit
	wire IR_Ld_Wire;									// Output: Control_Register					Input: Control_Unit
	wire MAR_Ld_Wire;									// Output: Control_Register					Input: Control_Unit
	wire MDR_Ld_Wire;									// Output: Control_Register					Input: Control_Unit
	wire PSR_Ld_Wire;									// Output: Control_Register					Input: Control_Unit
	wire nPC_Ld_Wire;									// Output: Control_Register					Input: Control_Unit
	wire PC_Ld_Wire;									// Output: Control_Register					Input: Control_Unit
	wire TBR_Ld_Wire;									// Output: Control_Register					Input: Control_Unit
	wire TBR_tt_Ld_Wire;								// Output: Control_Register					Input: Control_Unit
	wire WIM_Ld_Wire;									// Output: Control_Register					Input: Control_Unit
	// Multiplexer Select Control Signals
	wire [1:0] MUX_A_Wire;								// Output: Control_Register					Input: Control_Unit
	wire [1:0] MUX_B_Wire;								// Output: Control_Register					Input: Control_Unit
	wire [1:0] MUX_OP_Wire;								// Output: Control_Register					Input: Control_Unit
	wire [1:0] MUX_RFA_Wire;							// Output: Control_Register					Input: Control_Unit
	wire [1:0] MUX_RFB_Wire;							// Output: Control_Register					Input: Control_Unit
	wire [2:0] MUX_RFDest_Wire;							// Output: Control_Register					Input: Control_Unit
	wire [1:0] MUX_nPC_Wire;							// Output: Control_Register					Input: Control_Unit
	wire [1:0] MUX_PC_Wire;								// Output: Control_Register					Input: Control_Unit
	wire [1:0] MUX_Add4_Wire;							// Output: Control_Register					Input: Control_Unit
	wire [1:0] MUX_MDR_Wire;							// Output: Control_Register					Input: Control_Unit
	wire [1:0] MUX_SR_Wire;								// Output: Control_Register					Input: Control_Unit
	// Memory Control Signals
	wire RW_Wire;										// Output: Control_Register					Input: Control_Unit
	wire MOV_Wire;										// Output: Control_Register					Input: Control_Unit
	wire [1:0] SIZE_Wire;								// Output: Control_Register					Input: Control_Unit
	wire SU_Wire;										// Output: Control_Register					Input: Control_Unit
	// Other Control Signals
	wire [5:0] OP_Wire;									// Output: Control_Register					Input: Control_Unit
	// Feedback Control Signals
	wire [8:0] CR_Addr_Wire;							// Output: Control_Register					Input: Next_State_Address_MUX
	wire [2:0] NS_Ctrl_Wire;							// Output: Control_Register					Input: Next_State_Address_Selector
	wire INV_Ctrl;										// Output: Control_Register					Input: Inverter
	wire [1:0] COND_Sel_Wire;							// Output: Control_Register					Input: Condition_MUX
	// Debugging
	wire [8:0] Next_State_Wire;
	
	/* ---------------------------------- Internal Components ------------------------------------ */
	Next_State_Address_MUX NSAM (
								/* -------------------- Output -------------------- */
								Next_State_Address_Wire,
								/* -------------------- Input -------------------- */
								Encoder_Address_Wire,
								Incrementer_Register_Address_Wire,
								Control_Register_Address_Wire,
								Next_State_Address_Select_Wire,
								Clock
								);
								
	Next_State_Address_Encoder NSAE (
									/* -------------------- Output -------------------- */
									Encoder_Address_Wire,
									/* -------------------- Input -------------------- */
									IR
									);
	
	Incrementer_Register IncReg (
								/* -------------------- Output -------------------- */
								Incrementer_Register_Address_Wire,
								/* -------------------- Input -------------------- */
								Incrementer_Address_Wire,
								Clock
								);
	
	Address_Incrementer AddrInc (
								/* -------------------- Output -------------------- */
								Incrementer_Address_Wire,
								/* -------------------- Input -------------------- */
								Next_State_Address_Wire
								);
									
	Next_State_Address_Selector NSAS (
									/* -------------------- Output -------------------- */
									Next_State_Address_Select_Wire,
									/* -------------------- Input -------------------- */
									NS_Ctrl_Wire,
									//Next_State_Selector_Control_Wire,
									Condition_Control_Wire,
									Clock
									);
	Inverter Inv		(
						/* -------------------- Output -------------------- */
						Condition_Control_Wire,
						/* -------------------- Input -------------------- */
						Condition_Wire,
						Invert_Control_Wire
						);
	
	Condition_MUX CondM (
						/* -------------------- Output -------------------- */
						Condition_Wire,
						/* -------------------- Input -------------------- */
						MOC,
						Cond,
						IR[29],
						Trap,
						COND_Sel_Wire
						);		
								
	Microstore ROM (
					/* -------------------- Output -------------------- */
					Register_File_Load_Wire,
					Flags_Register_Load_Wire,
					Instruction_Register_Load_Wire,
					Memory_Address_Register_Load_Wire,
					Memory_Data_Register_Load_Wire,
					Processor_State_Register_Load_Wire,
					Next_Program_Counter_Register_Load_Wire,
					Program_Counter_Register_Load_Wire,
					Trap_Base_Register_Load_Wire,
					Trap_Base_Register_tt_Load_Wire,
					Window_Invalid_Mask_Load_Wire,
					// Multiplexer Select Control Signals
					MUX_A_Sel_Wire,
					MUX_B_Sel_Wire,
					MUX_OP_Sel_Wire,
					MUX_RFA_Sel_Wire,
					MUX_RFB_Sel_Wire,
					MUX_RFDest_Sel_Wire,
					MUX_nPC_Sel_Wire,
					MUX_PC_Sel_Wire,
					MUX_Add4_Sel_Wire,
					MUX_MDR_Sel_Wire,
					MUX_SR_Sel_Wire,
					// Memory Control Signals
					Read_Write_Wire,
					Memory_Operation_Valid_Wire,
					Memory_Operation_Size_Wire,
					Signed_Unsigned_Wire,
					// Other Control Signals
					Opcode_Wire,
					// Feedback Control Signals
					Control_Register_Address_Wire,
					Next_State_Selector_Control_Wire,
					Invert_Control_Wire,
					Condition_Select_Wire,
					// Debugging
					State_Number_Wire,
					/* -------------------- Input -------------------- */
					Next_State_Address_Wire,
					Clock,
					Reset
					);
					
	Control_Register ControlReg (
								/* -------------------- Output -------------------- */
								// Register Load Enable Control Signals
								RF_Ld_Wire,
								FR_Ld_Wire,
								IR_Ld_Wire,
								MAR_Ld_Wire,
								MDR_Ld_Wire,
								PSR_Ld_Wire,
								nPC_Ld_Wire,
								PC_Ld_Wire,
								TBR_Ld_Wire,
								TBR_tt_Ld_Wire,
								WIM_Ld_Wire,
								// Multiplexer Select Control Signals
								MUX_A_Wire,
								MUX_B_Wire,
								MUX_OP_Wire,
								MUX_RFA_Wire,
								MUX_RFB_Wire,
								MUX_RFDest_Wire,
								MUX_nPC_Wire,
								MUX_PC_Wire,
								MUX_Add4_Wire,
								MUX_MDR_Wire,
								MUX_SR_Wire,
								// Memory Control Signals
								RW_Wire,
								MOV_Wire,
								SIZE_Wire,
								SU_Wire,
								// Other Control Signals
								OP_Wire,
								// Feedback Control Signals
								CR_Addr_Wire,
								NS_Ctrl_Wire,
								INV_Ctrl_Wire,
								COND_Sel_Wire,
								// Debugging
								Next_State_Wire,
								/* -------------------- Input -------------------- */
								// Register Load Enable Control Signals
								Register_File_Load_Wire,
								Flags_Register_Load_Wire,
								Instruction_Register_Load_Wire,
								Memory_Address_Register_Load_Wire,
								Memory_Data_Register_Load_Wire,
								Processor_State_Register_Load_Wire,
								Next_Program_Counter_Register_Load_Wire,
								Program_Counter_Register_Load_Wire,
								Trap_Base_Register_Load_Wire,
								Trap_Base_Register_tt_Load_Wire,
								Window_Invalid_Mask_Load_Wire,
								// Multiplexer Select Control Signals
								MUX_A_Sel_Wire,
								MUX_B_Sel_Wire,
								MUX_OP_Sel_Wire,
								MUX_RFA_Sel_Wire,
								MUX_RFB_Sel_Wire,
								MUX_RFDest_Sel_Wire,
								MUX_PC_Sel_Wire,
								MUX_nPC_Sel_Wire,
								MUX_Add4_Sel_Wire,
								MUX_MDR_Sel_Wire,
								MUX_SR_Sel_Wire,
								// Memory Control Signals
								Read_Write_Wire,
								Memory_Operation_Valid_Wire,
								Memory_Operation_Size_Wire,
								Signed_Unsigned_Wire,
								// Other Control Signals
								Opcode_Wire,
								// Feedback Control Signals
								Control_Register_Address_Wire,
								Next_State_Selector_Control_Wire,
								Invert_Control_Wire,
								Condition_Select_Wire,
								// Clock
								Clock,
								State_Number_Wire
								);
								
	always @*
		begin
		RF_Ld <= RF_Ld_Wire;
		FR_Ld <= FR_Ld_Wire;
		IR_Ld <= IR_Ld_Wire;
		MAR_Ld <= MAR_Ld_Wire;
		MDR_Ld <= MDR_Ld_Wire;
		PSR_Ld <= PSR_Ld_Wire;
		nPC_Ld <= nPC_Ld_Wire;
		PC_Ld <= PC_Ld_Wire;
		TBR_Ld <= TBR_Ld_Wire;
		TBR_tt_Ld <= TBR_tt_Ld_Wire;
		WIM_Ld <= WIM_Ld_Wire;
		// Multiplexer Select Control Signals
		MUX_A <= MUX_A_Wire;
		MUX_B <= MUX_B_Wire;
		MUX_OP <= MUX_OP_Wire;
		MUX_RFA <= MUX_RFA_Wire;
		MUX_RFB <= MUX_RFB_Wire;
		MUX_RFDest <= MUX_RFDest_Wire;
		MUX_nPC <= MUX_nPC_Wire;
		MUX_PC <= MUX_PC_Wire;
		MUX_Add4 <= MUX_Add4_Wire;
		MUX_MDR <= MUX_MDR_Wire;
		MUX_SR <= MUX_SR_Wire;
		// Memory Control Signals
		RW <= RW_Wire;
		MOV <= MOV_Wire;
		SIZE <= SIZE_Wire;
		SU <= SU_Wire;
		// Other Control Signals
		OP <= OP_Wire;
		// Debugging
		State_Number <= Next_State_Wire;
		end
endmodule