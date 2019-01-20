module Register_Window (
						/* -------------------- Output -------------------- */
						output reg [31:0] R31,
						output reg [31:0] R30,
						output reg [31:0] R29,
						output reg [31:0] R28,
						output reg [31:0] R27,
						output reg [31:0] R26,
						output reg [31:0] R25,
						output reg [31:0] R24,
						output reg [31:0] R23,
						output reg [31:0] R22,
						output reg [31:0] R21,
						output reg [31:0] R20,
						output reg [31:0] R19,
						output reg [31:0] R18,
						output reg [31:0] R17,
						output reg [31:0] R16,
						output reg [31:0] R15,
						output reg [31:0] R14,
						output reg [31:0] R13,
						output reg [31:0] R12,
						output reg [31:0] R11,
						output reg [31:0] R10,
						output reg [31:0] R9,
						output reg [31:0] R8,
						output reg [31:0] R7,
						output reg [31:0] R6,
						output reg [31:0] R5,
						output reg [31:0] R4,
						output reg [31:0] R3,
						output reg [31:0] R2,
						output reg [31:0] R1,
						output reg [31:0] R0,
						/* -------------------- Input -------------------- */
						input [31:0] Data_In,			// Data to be stored in a register
						input [31:0] Register_Enable,	// Output from Binary Decoder; determines which register is to be loaded with data
						input Clock,
						input [4:0] CWP,
						input RF_Ld
						);
	
	wire [31:0] W3_R31;
	wire [31:0] W3_R30;
	wire [31:0] W3_R29;
	wire [31:0] W3_R28;
	wire [31:0] W3_R27;
	wire [31:0] W3_R26;
	wire [31:0] W3_R25;
	wire [31:0] W3_R24;
	wire [31:0] W3_R23;
	wire [31:0] W3_R22;
	wire [31:0] W3_R21;
	wire [31:0] W3_R20;
	wire [31:0] W3_R19;
	wire [31:0] W3_R18;
	wire [31:0] W3_R17;
	wire [31:0] W3_R16;
	wire [31:0] W3_R15;
	wire [31:0] W3_R14;
	wire [31:0] W3_R13;
	wire [31:0] W3_R12;
	wire [31:0] W3_R11;
	wire [31:0] W3_R10;
	wire [31:0] W3_R9;
	wire [31:0] W3_R8;
	wire [31:0] W2_R23;
	wire [31:0] W2_R22;
	wire [31:0] W2_R21;
	wire [31:0] W2_R20;
	wire [31:0] W2_R19;
	wire [31:0] W2_R18;
	wire [31:0] W2_R17;
	wire [31:0] W2_R16;
	wire [31:0] W2_R15;
	wire [31:0] W2_R14;
	wire [31:0] W2_R13;
	wire [31:0] W2_R12;
	wire [31:0] W2_R11;
	wire [31:0] W2_R10;
	wire [31:0] W2_R9;
	wire [31:0] W2_R8;
	wire [31:0] W1_R23;
	wire [31:0] W1_R22;
	wire [31:0] W1_R21;
	wire [31:0] W1_R20;
	wire [31:0] W1_R19;
	wire [31:0] W1_R18;
	wire [31:0] W1_R17;
	wire [31:0] W1_R16;
	wire [31:0] W1_R15;
	wire [31:0] W1_R14;
	wire [31:0] W1_R13;
	wire [31:0] W1_R12;
	wire [31:0] W1_R11;
	wire [31:0] W1_R10;
	wire [31:0] W1_R9;
	wire [31:0] W1_R8;
	wire [31:0] W0_R23;
	wire [31:0] W0_R22;
	wire [31:0] W0_R21;
	wire [31:0] W0_R20;
	wire [31:0] W0_R19;
	wire [31:0] W0_R18;
	wire [31:0] W0_R17;
	wire [31:0] W0_R16;
	wire [31:0] W0_R15;
	wire [31:0] W0_R14;
	wire [31:0] W0_R13;
	wire [31:0] W0_R12;
	wire [31:0] W0_R11;
	wire [31:0] W0_R10;
	wire [31:0] W0_R9;
	wire [31:0] W0_R8;
	wire [31:0] G7;
	wire [31:0] G6;
	wire [31:0] G5;
	wire [31:0] G4;
	wire [31:0] G3;
	wire [31:0] G2;
	wire [31:0] G1;
	wire [31:0] G0;
	reg [6:0] GPR_Load_Enable;
	
	integer LogFile;
	
	initial
		begin
		// Time formatting
		$timeformat(-9, 2, " ns", 0);
		// Error logging
		LogFile = $fopen("D:\\Users\\Misael\\Documents\\Classes\\ICOM4215-001D\\SPARC Microprocessor\\Logs\\Data Path Logs\\Register_Window_log.dat");
		end
	
	General_Purpose_Registers GPRs (
									// Window 3 Ins
									W3_R31,
									W3_R30,
									W3_R29,
									W3_R28,
									W3_R27,
									W3_R26,
									W3_R25,
									W3_R24,
									// Window 3 Locals
									W3_R23,
									W3_R22,
									W3_R21,
									W3_R20,
									W3_R19,
									W3_R18,
									W3_R17,
									W3_R16,
									// Window 3 Outs; Window 2 Ins
									W3_R15,
									W3_R14,
									W3_R13,
									W3_R12,
									W3_R11,
									W3_R10,
									W3_R9,
									W3_R8,
									// Window 2 Locals
									W2_R23,
									W2_R22,
									W2_R21,
									W2_R20,
									W2_R19,
									W2_R18,
									W2_R17,
									W2_R16,
									// Window 2 Outs; Window 1 Ins
									W2_R15,
									W2_R14,
									W2_R13,
									W2_R12,
									W2_R11,
									W2_R10,
									W2_R9,
									W2_R8,
									// Window 1 Locals
									W1_R23,
									W1_R22,
									W1_R21,
									W1_R20,
									W1_R19,
									W1_R18,
									W1_R17,
									W1_R16,
									// Window 1 Outs; Window 0 Ins
									W1_R15,
									W1_R14,
									W1_R13,
									W1_R12,
									W1_R11,
									W1_R10,
									W1_R9,
									W1_R8,
									// Window 0 Locals
									W0_R23,
									W0_R22,
									W0_R21,
									W0_R20,
									W0_R19,
									W0_R18,
									W0_R17,
									W0_R16,
									// Window 0 Outs
									W0_R15,
									W0_R14,
									W0_R13,
									W0_R12,
									W0_R11,
									W0_R10,
									W0_R9,
									W0_R8,
									// Globals
									G7,
									G6,
									G5,
									G4,
									G3,
									G2,
									G1,
									G0,
									Data_In,
									GPR_Load_Enable,	// Determines which register is to be loaded with data; forwarded and translated from Register_Enable signal
									RF_Ld,
									Clock
									);
	always @*	
		begin
		$fdisplay(LogFile, "%t Current Window Pointer: %d", $time, CWP);
		// Determine the current window, and assign corresponding registers as visible registers
		case (CWP)
			5'b00000:	// Window 0
				begin
				R31 <= W1_R15;
				R30 <= W1_R14;
				R29 <= W1_R13;
				R28 <= W1_R12;
				R27 <= W1_R11;
				R26 <= W1_R10;
				R25 <= W1_R9;
				R24 <= W1_R8;
				R23 <= W0_R23;
				R22 <= W0_R22;
				R21 <= W0_R21;
				R20 <= W0_R20;
				R19 <= W0_R19;
				R18 <= W0_R18;
				R17 <= W0_R17;
				R16 <= W0_R16;
				R15 <= W0_R15;
				R14 <= W0_R14;
				R13 <= W0_R13;
				R12 <= W0_R12;
				R11 <= W0_R11;
				R10 <= W0_R10;
				R9 <= W0_R9;
				R8 <= W0_R8;
				R7 <= G7;
				R6 <= G6;
				R5 <= G5;
				R4 <= G4;
				R3 <= G3;
				R2 <= G2;
				R1 <= G1;
				R0 <= G0;
				end
			5'b00001:	// Window 1
				begin
				R31 <= W2_R15;
				R30 <= W2_R14;
				R29 <= W2_R13;
				R28 <= W2_R12;
				R27 <= W2_R11;
				R26 <= W2_R10;
				R25 <= W2_R9;
				R24 <= W2_R8;
				R23 <= W1_R23;
				R22 <= W1_R22;
				R21 <= W1_R21;
				R20 <= W1_R20;
				R19 <= W1_R19;
				R18 <= W1_R18;
				R17 <= W1_R17;
				R16 <= W1_R16;
				R15 <= W1_R15;
				R14 <= W1_R14;
				R13 <= W1_R13;
				R12 <= W1_R12;
				R11 <= W1_R11;
				R10 <= W1_R10;
				R9 <= W1_R9;
				R8 <= W1_R8;
				R7 <= G7;
				R6 <= G6;
				R5 <= G5;
				R4 <= G4;
				R3 <= G3;
				R2 <= G2;
				R1 <= G1;
				R0 <= G0;
				end
			5'b00010:	// Window 2
				begin
				R31 <= W3_R15;
				R30 <= W3_R14;
				R29 <= W3_R13;
				R28 <= W3_R12;
				R27 <= W3_R11;
				R26 <= W3_R10;
				R25 <= W3_R9;
				R24 <= W3_R8;
				R23 <= W2_R23;
				R22 <= W2_R22;
				R21 <= W2_R21;
				R20 <= W2_R20;
				R19 <= W2_R19;
				R18 <= W2_R18;
				R17 <= W2_R17;
				R16 <= W2_R16;
				R15 <= W2_R15;
				R14 <= W2_R14;
				R13 <= W2_R13;
				R12 <= W2_R12;
				R11 <= W2_R11;
				R10 <= W2_R10;
				R9 <= W2_R9;
				R8 <= W2_R8;
				R7 <= G7;
				R6 <= G6;
				R5 <= G5;
				R4 <= G4;
				R3 <= G3;
				R2 <= G2;
				R1 <= G1;
				R0 <= G0;
				end
			5'b00011:	// Window 3
				begin
				R31 <= W3_R31;
				R30 <= W3_R30;
				R29 <= W3_R29;
				R28 <= W3_R28;
				R27 <= W3_R27;
				R26 <= W3_R26;
				R25 <= W3_R25;
				R24 <= W3_R24;
				R23 <= W3_R23;
				R22 <= W3_R22;
				R21 <= W3_R21;
				R20 <= W3_R20;
				R19 <= W3_R19;
				R18 <= W3_R18;
				R17 <= W3_R17;
				R16 <= W3_R16;
				R15 <= W3_R15;
				R14 <= W3_R14;
				R13 <= W3_R13;
				R12 <= W3_R12;
				R11 <= W3_R11;
				R10 <= W3_R10;
				R9 <= W3_R9;
				R8 <= W3_R8;
				R7 <= G7;
				R6 <= G6;
				R5 <= G5;
				R4 <= G4;
				R3 <= G3;
				R2 <= G2;
				R1 <= G1;
				R0 <= G0;
				end
			default:
				begin
				$fdisplay(LogFile, "%t Invalid Window Pointer: %d", $time, CWP);
				end
		endcase
		end
	
	always @ (negedge Clock, Register_Enable)
		begin
		//$display("%t Register Window -- Register_Enable: %h", $time, Register_Enable);
		// Determine which register in visible window is to be loaded, if any
		case (CWP)
			5'b00000:	// Window 0
				begin
				case (Register_Enable)
					// Globals
					32'h00000001:	// G0
						begin
						GPR_Load_Enable = 7'b1100000;
						end
					32'h00000002:	// G1
						begin
						GPR_Load_Enable = 7'b1100001;
						end
					32'h00000004:	// G2
						begin
						GPR_Load_Enable = 7'b1100010;
						end
					32'h00000008:	// G3
						begin
						GPR_Load_Enable = 7'b1100011;
						end
					32'h00000010:	// G4
						begin
						GPR_Load_Enable = 7'b1100100;
						end
					32'h00000020:	// G5
						begin
						GPR_Load_Enable = 7'b1100101;
						end
					32'h00000040:	// G6
						begin
						GPR_Load_Enable = 7'b1100110;
						end
					32'h00000080:	// G7
						begin
						GPR_Load_Enable = 7'b1100111;
						end
					// Window 0
					32'h00000100:	// R8
						begin
						GPR_Load_Enable = 7'b0010111;
						end
					32'h00000200:	// R9
						begin
						GPR_Load_Enable = 7'b0010110;
						end
					32'h00000400:	// R10
						begin
						GPR_Load_Enable = 7'b0010101;
						end
					32'h00000800:	// R11
						begin
						GPR_Load_Enable = 7'b0010100;
						end
					32'h00001000:	// R12
						begin
						GPR_Load_Enable = 7'b0010011;
						end
					32'h00002000:	// R13
						begin
						GPR_Load_Enable = 7'b0010010;
						end
					32'h00004000:	// R14
						begin
						GPR_Load_Enable = 7'b0010001;
						end
					32'h00008000:	// R15
						begin
						GPR_Load_Enable = 7'b0010000;
						end
					32'h00010000:	// R16
						begin
						GPR_Load_Enable = 7'b0001111;
						end
					32'h00020000:	// R17
						begin
						GPR_Load_Enable = 7'b0001110;
						end
					32'h00040000:	// R18
						begin
						GPR_Load_Enable = 7'b0001101;
						end
					32'h00080000:	// R19
						begin
						GPR_Load_Enable = 7'b0001100;
						end
					32'h00100000:	// R20
						begin
						GPR_Load_Enable = 7'b0001011;
						end
					32'h00200000:	// R21
						begin
						GPR_Load_Enable = 7'b0001010;
						end
					32'h00400000:	// R22
						begin
						GPR_Load_Enable = 7'b0001001;
						end
					32'h00800000:	// R23
						begin
						GPR_Load_Enable = 7'b0001000;
						end
					32'h01000000:	// R24
						begin
						GPR_Load_Enable = 7'b0000111;
						end
					32'h02000000:	// R25
						begin
						GPR_Load_Enable = 7'b0000110;
						end
					32'h04000000:	// R26
						begin
						GPR_Load_Enable = 7'b0000101;
						end
					32'h08000000:	// R27
						begin
						GPR_Load_Enable = 7'b0000100;
						end
					32'h10000000:	// R28
						begin
						GPR_Load_Enable = 7'b0000011;
						end	
					32'h20000000:	// R29
						begin
						GPR_Load_Enable = 7'b0000010;
						end
					32'h40000000:	// R30
						begin
						GPR_Load_Enable = 7'b0000001;
						end
					32'h80000000:	// R31
						begin
						GPR_Load_Enable = 7'b0000000;
						end
					default:
						begin
						GPR_Load_Enable = 7'b1111111;	// Intentionally set to invalid value; no register is being loaded
						end
				endcase
				end
			5'b00001:	// Window 1
				begin
				case (Register_Enable)
					// Globals
					32'h00000001:
						begin
						GPR_Load_Enable = 7'b1100000;
						end
					32'h00000002:
						begin
						GPR_Load_Enable = 7'b1100001;
						end
					32'h00000004:
						begin
						GPR_Load_Enable = 7'b1100010;
						end
					32'h00000008:
						begin
						GPR_Load_Enable = 7'b1100011;
						end
					32'h00000010:
						begin
						GPR_Load_Enable = 7'b1100100;
						end
					32'h00000020:
						begin
						GPR_Load_Enable = 7'b1100101;
						end
					32'h00000040:
						begin
						GPR_Load_Enable = 7'b1100110;
						end
					32'h00000080:
						begin
						GPR_Load_Enable = 7'b1100111;
						end
					// Window 1
					32'h00000100:
						begin
						GPR_Load_Enable = 7'b0010111 + 7'b0011000;
						end
					32'h00000200:
						begin
						GPR_Load_Enable = 7'b0010110 + 7'b0011000;
						end
					32'h00000400:
						begin
						GPR_Load_Enable = 7'b0010101 + 7'b0011000;
						end
					32'h00000800:
						begin
						GPR_Load_Enable = 7'b0010100 + 7'b0011000;
						end
					32'h00001000:
						begin
						GPR_Load_Enable = 7'b0010011 + 7'b0011000;
						end
					32'h00002000:
						begin
						GPR_Load_Enable = 7'b0010010 + 7'b0011000;
						end
					32'h00004000:
						begin
						GPR_Load_Enable = 7'b0010001 + 7'b0011000;
						end
					32'h00008000:
						begin
						GPR_Load_Enable = 7'b0010000 + 7'b0011000;
						end
					32'h00010000:
						begin
						GPR_Load_Enable = 7'b0001111 + 7'b0011000;
						end
					32'h00020000:
						begin
						GPR_Load_Enable = 7'b0001110 + 7'b0011000;
						end
					32'h00040000:
						begin
						GPR_Load_Enable = 7'b0001101 + 7'b0011000;
						end
					32'h00080000:
						begin
						GPR_Load_Enable = 7'b0001100 + 7'b0011000;
						end
					32'h00100000:
						begin
						GPR_Load_Enable = 7'b0001011 + 7'b0011000;
						end
					32'h00200000:
						begin
						GPR_Load_Enable = 7'b0001010 + 7'b0011000;
						end
					32'h00400000:
						begin
						GPR_Load_Enable = 7'b0001001 + 7'b0011000;
						end
					32'h00800000:
						begin
						GPR_Load_Enable = 7'b0001000 + 7'b0011000;
						end
					32'h01000000:
						begin
						GPR_Load_Enable = 7'b0000111 + 7'b0011000;
						end
					32'h02000000:
						begin
						GPR_Load_Enable = 7'b0000110 + 7'b0011000;
						end
					32'h04000000:
						begin
						GPR_Load_Enable = 7'b0000101 + 7'b0011000;
						end
					32'h08000000:
						begin
						GPR_Load_Enable = 7'b0000100 + 7'b0011000;
						end
					32'h10000000:
						begin
						GPR_Load_Enable = 7'b0000011 + 7'b0011000;
						end
					32'h20000000:
						begin
						GPR_Load_Enable = 7'b0000010 + 7'b0011000;
						end
					32'h40000000:
						begin
						GPR_Load_Enable = 7'b0000001 + 7'b0011000;
						end
					32'h80000000:
						begin
						GPR_Load_Enable = 7'b0000000 + 7'b0011000;
						end
					default:
						begin
						GPR_Load_Enable = 7'b1111111;	// Intentionally set to invalid value; no register is being loaded
						end
				endcase
				end
			5'b00010:	// Window 2
				begin
				case (Register_Enable)
					// Globals
					32'h00000001:
						begin
						GPR_Load_Enable = 7'b1100000;
						end
					32'h00000002:
						begin
						GPR_Load_Enable = 7'b1100001;
						end
					32'h00000004:
						begin
						GPR_Load_Enable = 7'b1100010;
						end
					32'h00000008:
						begin
						GPR_Load_Enable = 7'b1100011;
						end
					32'h00000010:
						begin
						GPR_Load_Enable = 7'b1100100;
						end
					32'h00000020:
						begin
						GPR_Load_Enable = 7'b1100101;
						end
					32'h00000040:
						begin
						GPR_Load_Enable = 7'b1100110;
						end
					32'h00000080:
						begin
						GPR_Load_Enable = 7'b1100111;
						end
					// Window 2
					32'h00000100:
						begin
						GPR_Load_Enable = 7'b0010111 + 7'b0110000;
						end
					32'h00000200:
						begin
						GPR_Load_Enable = 7'b0010110 + 7'b0110000;
						end
					32'h00000400:
						begin
						GPR_Load_Enable = 7'b0010101 + 7'b0110000;
						end
					32'h00000800:
						begin
						GPR_Load_Enable = 7'b0010100 + 7'b0110000;
						end
					32'h00001000:
						begin
						GPR_Load_Enable = 7'b0010011 + 7'b0110000;
						end
					32'h00002000:
						begin
						GPR_Load_Enable = 7'b0010010 + 7'b0110000;
						end
					32'h00004000:
						begin
						GPR_Load_Enable = 7'b0010001 + 7'b0110000;
						end
					32'h00008000:
						begin
						GPR_Load_Enable = 7'b0010000 + 7'b0110000;
						end
					32'h00010000:
						begin
						GPR_Load_Enable = 7'b0001111 + 7'b0110000;
						end
					32'h00020000:
						begin
						GPR_Load_Enable = 7'b0001110 + 7'b0110000;
						end
					32'h00040000:
						begin
						GPR_Load_Enable = 7'b0001101 + 7'b0110000;
						end
					32'h00080000:
						begin
						GPR_Load_Enable = 7'b0001100 + 7'b0110000;
						end
					32'h00100000:
						begin
						GPR_Load_Enable = 7'b0001011 + 7'b0110000;
						end
					32'h00200000:
						begin
						GPR_Load_Enable = 7'b0001010 + 7'b0110000;
						end
					32'h00400000:
						begin
						GPR_Load_Enable = 7'b0001001 + 7'b0110000;
						end
					32'h00800000:
						begin
						GPR_Load_Enable = 7'b0001000 + 7'b0110000;
						end
					32'h01000000:
						begin
						GPR_Load_Enable = 7'b0000111 + 7'b0110000;
						end
					32'h02000000:
						begin
						GPR_Load_Enable = 7'b0000110 + 7'b0110000;
						end
					32'h04000000:
						begin
						GPR_Load_Enable = 7'b0000101 + 7'b0110000;
						end
					32'h08000000:
						begin
						GPR_Load_Enable = 7'b0000100 + 7'b0110000;
						end
					32'h10000000:
						begin
						GPR_Load_Enable = 7'b0000011 + 7'b0110000;
						end
					32'h20000000:
						begin
						GPR_Load_Enable = 7'b0000010 + 7'b0110000;
						end
					32'h40000000:
						begin
						GPR_Load_Enable = 7'b0000001 + 7'b0110000;
						end
					32'h80000000:
						begin
						GPR_Load_Enable = 7'b0000000 + 7'b0110000;
						end
					default:
						begin
						GPR_Load_Enable = 7'b1111111;	// Intentionally set to invalid value; no register is being loaded
						end
				endcase
				end
				5'b00011:	// Window 3
				begin
				case (Register_Enable)
					// Globals
					32'h00000001:
						begin
						GPR_Load_Enable = 7'b1100000;
						end
					32'h00000002:
						begin
						GPR_Load_Enable = 7'b1100001;
						end
					32'h00000004:
						begin
						GPR_Load_Enable = 7'b1100010;
						end
					32'h00000008:
						begin
						GPR_Load_Enable = 7'b1100011;
						end
					32'h00000010:
						begin
						GPR_Load_Enable = 7'b1100100;
						end
					32'h00000020:
						begin
						GPR_Load_Enable = 7'b1100101;
						end
					32'h00000040:
						begin
						GPR_Load_Enable = 7'b1100110;
						end
					32'h00000080:
						begin
						GPR_Load_Enable = 7'b1100111;
						end
					// Window 3
					32'h00000100:
						begin
						GPR_Load_Enable = 7'b0010111 + 7'b1001000;
						end
					32'h00000200:
						begin
						GPR_Load_Enable = 7'b0010110 + 7'b1001000;
						end
					32'h00000400:
						begin
						GPR_Load_Enable = 7'b0010101 + 7'b1001000;
						end
					32'h00000800:
						begin
						GPR_Load_Enable = 7'b0010100 + 7'b1001000;
						end
					32'h00001000:
						begin
						GPR_Load_Enable = 7'b0010011 + 7'b1001000;
						end
					32'h00002000:
						begin
						GPR_Load_Enable = 7'b0010010 + 7'b1001000;
						end
					32'h00004000:
						begin
						GPR_Load_Enable = 7'b0010001 + 7'b1001000;
						end
					32'h00008000:
						begin
						GPR_Load_Enable = 7'b0010000 + 7'b1001000;
						end
					32'h00010000:
						begin
						GPR_Load_Enable = 7'b0001111 + 7'b1001000;
						end
					32'h00020000:
						begin
						GPR_Load_Enable = 7'b0001110 + 7'b1001000;
						end
					32'h00040000:
						begin
						GPR_Load_Enable = 7'b0001101 + 7'b1001000;
						end
					32'h00080000:
						begin
						GPR_Load_Enable = 7'b0001100 + 7'b1001000;
						end
					32'h00100000:
						begin
						GPR_Load_Enable = 7'b0001011 + 7'b1001000;
						end
					32'h00200000:
						begin
						GPR_Load_Enable = 7'b0001010 + 7'b1001000;
						end
					32'h00400000:
						begin
						GPR_Load_Enable = 7'b0001001 + 7'b1001000;
						end
					32'h00800000:
						begin
						GPR_Load_Enable = 7'b0001000 + 7'b1001000;
						end
					32'h01000000:
						begin
						GPR_Load_Enable = 7'b0000111 + 7'b1001000;
						end
					32'h02000000:
						begin
						GPR_Load_Enable = 7'b0000110 + 7'b1001000;
						end
					32'h04000000:
						begin
						GPR_Load_Enable = 7'b0000101 + 7'b1001000;
						end
					32'h08000000:
						begin
						GPR_Load_Enable = 7'b0000100 + 7'b1001000;
						end
					32'h10000000:
						begin
						GPR_Load_Enable = 7'b0000011 + 7'b1001000;
						end
					32'h20000000:
						begin
						GPR_Load_Enable = 7'b0000010 + 7'b1001000;
						end
					32'h40000000:
						begin
						GPR_Load_Enable = 7'b0000001 + 7'b1001000;
						end
					32'h80000000:
						begin
						GPR_Load_Enable = 7'b0000000 + 7'b1001000;
						end
					default:
						begin
						GPR_Load_Enable = 7'b1111111;	// Intentionally set to invalid value; no register is being loaded
						end
				endcase
				end
		endcase
		//$display("%t Register Window -- GPR_Load_Enable: %b", $time, GPR_Load_Enable); 
		//$display("\n");
		end
endmodule