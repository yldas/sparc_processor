module Data_Path (
					/* -------------------- Output -------------------- */
					output reg [31:0] IR,
					output reg MOC,
					output reg Cond,
					output reg Trap,
					output reg [31:0] PSR,
					output reg [31:0] WIM,
					output reg [31:0] nPC,
					output reg [31:0] PC,
					output reg [31:0] MAR,
					/* -------------------- Input -------------------- */
					// Register Load Enable Control Signals
					input RF_Ld,
					input FR_Ld,
					input IR_Ld,
					input MAR_Ld,
					input MDR_Ld,
					input PSR_Ld,
					input nPC_Ld,
					input PC_Ld,
					input TBR_Ld,
					input TBR_tt_Ld,
					input WIM_Ld,
					// Multiplexer Select Control Signals
					input [1:0] MUX_A,
					input [1:0] MUX_B,
					input [1:0] MUX_OP,
					input [1:0] MUX_RFA,
					input [1:0] MUX_RFB,
					input [2:0] MUX_RFDest,
					input [1:0] MUX_nPC,
					input [1:0] MUX_PC,
					input [1:0] MUX_Add4,
					input [1:0] MUX_MDR,
					input [1:0] MUX_SR,
					// Memory Control Signals
					input RW,
					input MOV,
					input [1:0] SIZE,
					input SU,
					// Other Control Signals
					input [5:0] OP,
					// External Signals
					input Clock,
					input Reset
					);
	
	/* ---------------------------------- Internal Wires ----------------------------------------- */
	wire [31:0] ALU_Result_Wire;		// Output: Arithmetic_Logic_Unit	Input: Register_File, Multiplexer_MDR, Multiplexer_nPC, Window_Invalid_Mask_Register, Memory_Address_Register, Processor_State_Register, Trap_Base_Register
	wire Condition_N_Wire;				// Output: Arithmetic_Logic_Unit	Input: Processor_State_Register
	wire Condition_Z_Wire;				// Output: Arithmetic_Logic_Unit	Input: Processor_State_Register
	wire Condition_V_Wire;				// Output: Arithmetic_Logic_Unit	Input: Processor_State_Register
	wire Condition_C_Wire;				// Output: Arithmetic_Logic_Unit	Input: Processor_State_Register
	
	wire [4:0] Register_Dest_Sel_Wire;	// Output: Multiplexer_RFDest		Input: Register_File
	
	wire [4:0] Register_A_Sel_Wire;		// Output: Multiplexer_RFA			Input: Register_File
	
	wire [4:0] Register_B_Sel_Wire;		// Output: Multiplexer_RFB			Input: Register_File
	
	wire [31:0] ALU_A_In_Wire;			// Output: Multiplexer_A			Input: Arithmetic_Logic_Unit
	
	wire [31:0] ALU_B_In_Wire;			// Output: Multiplexer_B			Input: Arithmetic_Logic_Unit
	
	wire [5:0] ALU_OP_In_Wire;			// Output: Multiplexer_OP			Input: Arithmetic_Logic_Unit
	
	wire [31:0] IR_Wire;				// Output: Instruction_Register		Input: Multiplexer_RFA, Multiplexer_RFB, Multiplexer_RFDest, Shifter_Sign_Extender, Control_Unit, Multiplexer_OP, Condition_Tester
	
	wire [31:0] Memory_Data_Out_Wire;	// Output: RAM512x8					Input: Instruction_Register, Multiplexer_MDR
	wire MOC_Wire;						// Output: RAM512x8					Input: Data_Path
	
	wire [31:0] nPC_Wire;				// Output: nPC_Register				Input: Multiplexer_PC, Multiplexer_Add4, Adder8
	
	wire [31:0] nPC_In_Wire;			// Output: Multiplexer_nPC			Input: nPC_Register
	
	wire [31:0] SR_Wire;				// Output: Multiplexer_State_Register	Input: Multiplexer_A
	
	wire [31:0] PC_Wire;				// Output: PC_Register				Input: Multiplexer_A
	
	wire [31:0] PC_In_Wire;				// Output: Multiplexer_PC			Input: PC_Register
	
	wire [31:0] Adder4_Out_Wire;		// Output: Adder4					Input: Multiplexer_nPC
	
	wire [31:0] Adder8_Out_Wire;		// Output: Adder8					Input: Multiplexer_nPC
	
	wire [31:0] Adder4_In_Wire;			// Output: Multiplexer_Add4			Input: Adder4
	
	wire [24:0] TBR_TBA_Wire;			// Output: Trap_Base_Register		Input: Multiplexer_Add4, Multiplexer_PC
	wire [2:0] TBR_tt_Wire;				// Output: Trap_Base_Register		Input: Multiplexer_Add4, Multiplexer_PC
	wire [3:0] TBR_Zero_Wire;			// Output: Trap_Base_Register		Input: Multiplexer_Add4, Multiplexer_PC
	
	wire [3:0] PSR_Impl_Wire;			// Output: Processor_State_Register		Input: Data_Path
	wire [3:0] PSR_Ver_Wire;			// Output: Processor_State_Register		Input: Data_Path
	wire PSR_N_Wire;					// Output: Processor_State_Register		Input: Data_Path, Condition_Tester
	wire PSR_Z_Wire;					// Output: Processor_State_Register		Input: Data_Path, Condition_Tester
	wire PSR_V_Wire;					// Output: Processor_State_Register		Input: Data_Path, Condition_Tester
	wire PSR_C_Wire;					// Output: Processor_State_Register		Input: Data_Path, Condition_Tester
	wire [5:0] PSR_Reserved_Wire;		// Output: Processor_State_Register		Input: Data_Path
	wire PSR_EC_Wire;					// Output: Processor_State_Register		Input: Data_Path
	wire PSR_EF_Wire;					// Output: Processor_State_Register		Input: Data_Path
	wire [3:0] PSR_PIL_Wire;			// Output: Processor_State_Register		Input: Data_Path
	wire PSR_S_Wire;					// Output: Processor_State_Register		Input: Data_Path
	wire PSR_PS_Wire;					// Output: Processor_State_Register		Input: Data_Path
	wire PSR_ET_Wire;					// Output: Processor_State_Register		Input: Data_Path
	wire [4:0] PSR_CWP_Wire;			// Output: Processor_State_Register		Input: Data_Path, Register_File
	
	wire [31:0] WIM_Wire;				// Output: Window_Invalid_Mask_Register		Input: Data_Path
	
	wire [31:0] MAR_Wire;				// Output: Memory_Address_Register		Input: RAM512x8
	
	wire [31:0] MDR_Wire;				// Output: Memory_Data_Register			Input: Multiplexer_B, RAM512x8
	
	wire [31:0] MDR_In_Wire;			// Output: Multiplexer_MDR				Input: Memory_Data_Register
	
	
	wire [31:0] Shifter_Sign_Extender_Wire;		// Output: Shifter_Sign_Extender	Input: Multiplexer_B
	
	wire [31:0] Register_A_Wire;		// Output: Register_File		Input: Multiplexer_A
	wire [31:0] Register_B_Wire;		// Output: Register_File		Input: Multiplexer_B
	
	wire Cond_Wire;						// Output: Condition_Tester		Input: Data_Path
	
	wire Trap_Wire;
	
	/* ---------------------------------- Internal Components ------------------------------------ */
	Arithmetic_Logic_Unit ALU 	(
								/* -------------------- Output -------------------- */
								ALU_Result_Wire,
								Condition_N_Wire,
								Condition_Z_Wire,
								Condition_V_Wire,
								Condition_C_Wire,
								/* -------------------- Input -------------------- */
								ALU_A_In_Wire,
								ALU_B_In_Wire,
								PSR_C_Wire,
								ALU_OP_In_Wire
								);
	
	Multiplexer_RFDest MRFDest  (
								/* -------------------- Output -------------------- */
								Register_Dest_Sel_Wire,
								/* -------------------- Input -------------------- */
								IR_Wire[29:25],	// IR_RD Field
								MUX_RFDest
								);
	
	Multiplexer_RFA MRFA 		(
								/* -------------------- Output -------------------- */
								Register_A_Sel_Wire,
								/* -------------------- Input -------------------- */
								IR_Wire[18:14],	// IR_RS1 Field
								IR_Wire[29:25],	// IR_RD Field
								MUX_RFA
								);
								
	Multiplexer_RFB MRFB 		(
								/* -------------------- Output -------------------- */
								Register_B_Sel_Wire,
								/* -------------------- Input -------------------- */
								IR_Wire[4:0],	// IR_RS2 Field
								MUX_RFB
								);
								
	Multiplexer_A MA			(
								/* -------------------- Output -------------------- */
								ALU_A_In_Wire,
								/* -------------------- Input -------------------- */
								Register_A_Wire,
								PC_Wire,
								PSR_CWP_Wire,
								SR_Wire,
								MUX_A
								);
	
	Multiplexer_B MB			(
								/* -------------------- Output -------------------- */
								ALU_B_In_Wire,
								/* -------------------- Input -------------------- */
								Register_B_Wire,
								Shifter_Sign_Extender_Wire,
								MDR_Wire,
								PSR_CWP_Wire,
								MUX_B
								);
								
	Multiplexer_OP MOP			(
								/* -------------------- Output -------------------- */
								ALU_OP_In_Wire,
								/* -------------------- Input -------------------- */
								IR_Wire[24:19],	// IR_OP3 Field
								OP,
								MUX_OP
								);
								
	Instruction_Register IRReg		(
									/* -------------------- Output -------------------- */
									IR_Wire,
									/* -------------------- Input -------------------- */
									Memory_Data_Out_Wire,
									IR_Ld,
									Clock
									);
	
	nPC_Register nPCReg			(
								/* -------------------- Output -------------------- */
								nPC_Wire,
								/* -------------------- Input -------------------- */
								nPC_In_Wire,
								nPC_Ld,
								Clock
								);
	
	PC_Register PCReg			(
								/* -------------------- Output -------------------- */
								PC_Wire,
								/* -------------------- Input -------------------- */
								PC_In_Wire,
								PC_Ld,
								Clock
								);
	
	Multiplexer_nPC MnPC		(
								/* -------------------- Output -------------------- */
								nPC_In_Wire,
								/* -------------------- Input -------------------- */
								Adder4_Out_Wire,
								Adder4_Out_Wire,
								ALU_Result_Wire,
								MUX_nPC
								);
	
	Multiplexer_PC MPC			(
								/* -------------------- Output -------------------- */
								PC_In_Wire,
								/* -------------------- Input -------------------- */
								nPC_Wire,
								Adder4_Out_Wire,
								{TBR_TBA_Wire, TBR_tt_Wire, TBR_Zero_Wire},
								MUX_PC
								);
	
	Trap_Base_Register TBR		(	
								/* -------------------- Output -------------------- */
								TBR_TBA_Wire,
								TBR_tt_Wire,
								TBR_Zero_Wire,
								/* -------------------- Input -------------------- */
								ALU_Result_Wire[6:0],
								ALU_Result_Wire,
								TBR_Ld,
								TBR_tt_Ld,
								Clock,
								Reset
								);
	
	Processor_State_Register PSRReg (
									/* -------------------- Output -------------------- */
									PSR_Impl_Wire,
									PSR_Ver_Wire,
									PSR_N_Wire,
									PSR_Z_Wire,
									PSR_V_Wire,
									PSR_C_Wire,
									PSR_Reserved_Wire,
									PSR_EC_Wire,
									PSR_EF_Wire,
									PSR_PIL_Wire,
									PSR_S_Wire,
									PSR_PS_Wire,
									PSR_ET_Wire,
									PSR_CWP_Wire,
									/* -------------------- Input -------------------- */
									Condition_N_Wire,
									Condition_Z_Wire,
									Condition_V_Wire,
									Condition_C_Wire,
									ALU_Result_Wire,
									ALU_Result_Wire[11:8],	// PIL field
									ALU_Result_Wire[7],		// S field
									ALU_Result_Wire[6],		// PS field
									ALU_Result_Wire[5],		// ET field
									ALU_Result_Wire[4:0],	// CWP field
									FR_Ld,
									PSR_Ld,
									Clock,
									Reset
									);
	
	Window_Invalid_Mask_Register WIMReg (
										/* -------------------- Output -------------------- */
										WIM_Wire,
										/* -------------------- Input -------------------- */
										ALU_Result_Wire,
										WIM_Ld,
										Clock
										);
	
	Memory_Address_Register MARReg	(
									/* -------------------- Output -------------------- */
									MAR_Wire,
									/* -------------------- Input -------------------- */
									ALU_Result_Wire,
									MAR_Ld,
									Clock
									);
	
	Memory_Data_Register MDRReg	(
								/* -------------------- Output -------------------- */
								MDR_Wire,
								/* -------------------- Input -------------------- */
								MDR_In_Wire,
								MDR_Ld,
								Clock
								);
	
	Multiplexer_State_Register MSR (
									/* -------------------- Output -------------------- */
									SR_Wire,
									/* -------------------- Input -------------------- */
									{PSR_Impl_Wire, PSR_Ver_Wire, PSR_N_Wire, PSR_Z_Wire, PSR_V_Wire, PSR_C_Wire, PSR_Reserved_Wire, 
									PSR_EC_Wire, PSR_EF_Wire, PSR_PIL_Wire, PSR_S_Wire, PSR_PS_Wire, PSR_ET_Wire, PSR_CWP_Wire},
									{TBR_TBA_Wire, TBR_tt_Wire, TBR_Zero_Wire},
									WIM_Wire,
									nPC_Wire,
									MUX_SR
									);
	
	Multiplexer_MDR MMDR		(
								/* -------------------- Output -------------------- */
								MDR_In_Wire,
								/* -------------------- Input -------------------- */
								Memory_Data_Out_Wire,
								ALU_Result_Wire,
								MUX_MDR
								);
	
	Adder4 ADD4 				(
								/* -------------------- Output -------------------- */
								Adder4_Out_Wire,
								/* -------------------- Input -------------------- */
								Adder4_In_Wire
								);
								
	Adder8 ADD8 				(
								/* -------------------- Output -------------------- */
								Adder8_Out_Wire,
								/* -------------------- Input -------------------- */
								nPC_Wire
								);
								
	Multiplexer_Add4 MADD4		(
								/* -------------------- Output -------------------- */
								Adder4_In_Wire,
								/* -------------------- Input -------------------- */
								nPC_Wire,
								{TBR_TBA_Wire, TBR_tt_Wire, TBR_Zero_Wire},
								MUX_Add4
								);
	
	Shifter_Sign_Extender SSE	(
								/* -------------------- Output -------------------- */
								Shifter_Sign_Extender_Wire,
								/* -------------------- Input -------------------- */
								IR_Wire
								);
	
	Condition_Tester CondTest	(
								/* -------------------- Output -------------------- */
								Cond_Wire,
								/* -------------------- Input -------------------- */
								IR_Wire,
								PSR_N_Wire,
								PSR_Z_Wire,
								PSR_V_Wire,
								PSR_C_Wire,
								PSR_CWP_Wire,
								WIM_Wire,
								Clock
								);
	
	WIM_Tester Trap_Test		(
								/* -------------------- Output -------------------- */
								Trap_Wire,
								/* -------------------- Input -------------------- */
								IR_Wire,
								PSR_CWP_Wire,
								WIM_Wire
								);
								
	Register_File RF			(
								/* -------------------- Output -------------------- */
								Register_A_Wire,
								Register_B_Wire,
								/* -------------------- Input -------------------- */
								ALU_Result_Wire,
								Register_Dest_Sel_Wire,
								Register_A_Sel_Wire,
								Register_B_Sel_Wire,
								PSR_CWP_Wire,
								RF_Ld,
								Clock
								);
		
	RAM512x8 RAM				(
								/* -------------------- Output -------------------- */
								Memory_Data_Out_Wire,
								MOC_Wire,
								/* -------------------- Input -------------------- */
								MOV,
								RW,
								SIZE,
								SU,
								MAR_Wire,
								MDR_Wire
								);
		
	/* ---------------------------------- Data transfer ----------------------------------------- */
	always @*
		begin
		IR <= IR_Wire;
		MOC <= MOC_Wire;
		Cond <= Cond_Wire;
		Trap <= Trap_Wire;
		PSR <= {PSR_Impl_Wire, PSR_Ver_Wire, PSR_N_Wire, PSR_Z_Wire, PSR_V_Wire, PSR_C_Wire, PSR_Reserved_Wire, 
				PSR_EC_Wire, PSR_EF_Wire, PSR_PIL_Wire, PSR_S_Wire, PSR_PS_Wire, PSR_ET_Wire, PSR_CWP_Wire};
		WIM <= WIM_Wire;
		nPC <= nPC_Wire;
		PC <= PC_Wire;
		MAR <= MAR_Wire;
		end
								
	/* ---------------------------------- Other Initializations ------------------------------------ */
	// Internal variables
	// Memory initialization variables
	integer fi, fo, code, i;
	reg [7:0] data;
	reg Enable;
	reg ReadWrite;
	reg [7:0] DataIn;
	reg [8:0] Address;
	wire [7:0] DataOut;
	// Error logging variables
	integer LogFile;
	
	initial
		begin
		// Time formatting
		$timeformat(-9, 2, " ns", 0);
		LogFile = $fopen("D:\\Users\\Misael\\Documents\\Classes\\ICOM4215-001D\\SPARC Microprocessor\\Logs\\Data Path Logs\\Data_Path_log.dat");
		// Memory pre-loading
		$fdisplay(LogFile, "%t Starting to load memory...", $time);
		fi = $fopen("D:\\Users\\Misael\\Documents\\Classes\\ICOM4215-001D\\SPARC Microprocessor\\Data Path\\Memory Unit\\input_file.txt", "r");
		Address = 9'b000000000;
		if (fi != 0)
			begin
			while (!$feof(fi))
				begin
				code = $fscanf(fi, "%B", data);
				RAM.Mem[Address] = data;
				Address = Address + 1;
				$fdisplay(LogFile, "%t Storing byte", $time);
				end
				$fclose(fi);
			end
			$fdisplay(LogFile, "%t Finished loading memory", $time);
		end
endmodule