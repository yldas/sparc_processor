module t_Microprocessor;

	// Register Load Enable Control Signals
	wire RF_Ld;
	wire FR_Ld;
	wire IR_Ld;
	wire MAR_Ld;
	wire MDR_Ld;
	wire PSR_Ld;
	wire nPC_Ld;
	wire PC_Ld;
	wire TBR_Ld;
	wire TBR_tt_Ld;
	wire WIM_Ld;
	// Multiplexer Select Control Signals
	wire [1:0] MUX_A;
	wire [1:0] MUX_B;
	wire [1:0] MUX_OP;
	wire [1:0] MUX_RFA;
	wire [1:0] MUX_RFB;
	wire [2:0] MUX_RFDest;
	wire [1:0] MUX_nPC;
	wire [1:0] MUX_PC;
	wire [1:0] MUX_Add4;
	wire [1:0] MUX_MDR;
	wire [1:0] MUX_SR;
	// Memory Control Signals
	wire RW;
	wire MOV;
	wire [1:0] SIZE;
	wire SU;
	// Other Control Signals
	wire [5:0] OP;
	// Debugging
	wire [8:0] Current_State;
	
	wire [31:0] IR;
	wire MOC;
	wire Cond;
	wire Trap;
	wire [31:0] PSR;
	wire [31:0] WIM;
	wire [31:0] nPC;
	wire [31:0] PC;
	wire [31:0] MAR;
	// External Signals
	reg Clock;
	reg Reset;
		
	initial
		begin
		// Error logging
		//$dumpfile("D:\\Users\\Misael\\Documents\\Classes\\ICOM4215-001D\\SPARC Microprocessor\\Logs\\Data Path Logs\\t_Microprocessor_log.vcd");
		//$dumpvars;
		// External signals
		Clock <= 0;
		Reset <= 0;
		#4000 Reset = 1;
		end

	always
		begin
		#5 Clock = ~Clock;
		end
	
	Microprocessor Microprocessor1 (
									/* -------------------- Output -------------------- */
									RF_Ld,
									FR_Ld,
									IR_Ld,
									MAR_Ld,
									MDR_Ld,
									PSR_Ld,
									nPC_Ld,
									PC_Ld,
									TBR_Ld,
									TBR_tt_Ld,
									WIM_Ld,
									// Multiplexer Select Control Signals
									MUX_A,
									MUX_B,
									MUX_OP,
									MUX_RFA,
									MUX_RFB,
									MUX_RFDest,
									MUX_nPC,
									MUX_PC,
									MUX_Add4,
									MUX_MDR,
									MUX_SR,
									// Memory Control Signals
									RW,
									MOV,
									SIZE,
									SU,
									// Other Control Signals
									OP,
									IR,
									MOC,
									Cond,
									Trap,
									PSR,
									WIM,
									nPC,
									PC,
									MAR,
									// Debugging
									Current_State,
									/* -------------------- Input -------------------- */
									Clock,
									Reset
									);
endmodule				