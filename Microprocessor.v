module Microprocessor (
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
						output reg [31:0] IR,
						output reg MOC,
						output reg Cond,
						output reg Trap,
						output reg [31:0] PSR,
						output reg [31:0] WIM,
						output reg [31:0] nPC,
						output reg [31:0] PC,
						output reg [31:0] MAR,
						// Debugging
						output reg [8:0] Current_State,
						/* -------------------- Input -------------------- */
						input Clock,
						input Reset
						);

	// Register Load Enable Control Signals
	wire RF_Ld_Wire;
	wire FR_Ld_Wire;
	wire IR_Ld_Wire;
	wire MAR_Ld_Wire;
	wire MDR_Ld_Wire;
	wire PSR_Ld_Wire;
	wire nPC_Ld_Wire;
	wire PC_Ld_Wire;
	wire TBR_Ld_Wire;
	wire TBR_tt_Ld_Wire;
	wire WIM_Ld_Wire;
	// Multiplexer Select Control Signals
	wire [1:0] MUX_A_Wire;
	wire [1:0] MUX_B_Wire;
	wire [1:0] MUX_OP_Wire;
	wire [1:0] MUX_RFA_Wire;
	wire [1:0] MUX_RFB_Wire;
	wire [2:0] MUX_RFDest_Wire;
	wire [1:0] MUX_nPC_Wire;
	wire [1:0] MUX_PC_Wire;
	wire [1:0] MUX_Add4_Wire;
	wire [1:0] MUX_MDR_Wire;
	wire [1:0] MUX_SR_Wire;
	// Memory Control Signals
	wire RW_Wire;
	wire MOV_Wire;
	wire [1:0] SIZE_Wire;
	wire SU_Wire;
	// Other Control Signals
	wire [5:0] OP_Wire;
	// Debgging
	wire [8:0] Current_State_Wire;

	wire [31:0] IR_Wire;
	wire MOC_Wire;
	wire Cond_Wire;
	wire Trap_Wire;
	wire [31:0] PSR_Wire;
	wire [31:0] WIM_Wire;
	wire [31:0] nPC_Wire;
	wire [31:0] PC_Wire;
	wire [31:0] MAR_Wire;

	Control_Unit CU (
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
					// Debugging
					Current_State_Wire,
					/* -------------------- Input -------------------- */
					IR_Wire,
					MOC_Wire,
					Cond_Wire,
					Trap_Wire,
					PSR_Wire,
					WIM_Wire,
					Clock,
					Reset
					);

	Data_Path DP	(
					/* -------------------- Output -------------------- */
					IR_Wire,
					MOC_Wire,
					Cond_Wire,
					Trap_Wire,
					PSR_Wire,
					WIM_Wire,
					nPC_Wire,
					PC_Wire,
					MAR_Wire,
					/* -------------------- Input -------------------- */
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
					Clock,
					Reset
					);
					
		always @*
			begin
			// Register Load Enable Control Signals
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
			IR <= IR_Wire;
			MOC <= MOC_Wire;
			Cond <= Cond_Wire;
			Trap <= Trap_Wire;
			PSR <= PSR_Wire;
			WIM <= WIM_Wire;
			nPC <= nPC_Wire;
			PC <= PC_Wire;
			MAR <= MAR_Wire;
			// Debgging
			Current_State <= Current_State_Wire;
			end
endmodule			