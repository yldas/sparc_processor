module General_Purpose_Registers (
									/* -------------------- Output -------------------- */
									// Window 3 Ins
									output reg [31:0] W3_R31,
									output reg [31:0] W3_R30,
									output reg [31:0] W3_R29,
									output reg [31:0] W3_R28,
									output reg [31:0] W3_R27,
									output reg [31:0] W3_R26,
									output reg [31:0] W3_R25,
									output reg [31:0] W3_R24,
									// Window 3 Locals
									output reg [31:0] W3_R23,
									output reg [31:0] W3_R22,
									output reg [31:0] W3_R21,
									output reg [31:0] W3_R20,
									output reg [31:0] W3_R19,
									output reg [31:0] W3_R18,
									output reg [31:0] W3_R17,
									output reg [31:0] W3_R16,
									// Window 3 Outs; Window 2 Ins
									output reg [31:0] W3_R15,
									output reg [31:0] W3_R14,
									output reg [31:0] W3_R13,
									output reg [31:0] W3_R12,
									output reg [31:0] W3_R11,
									output reg [31:0] W3_R10,
									output reg [31:0] W3_R9,
									output reg [31:0] W3_R8,
									// Window 2 Locals
									output reg [31:0] W2_R23,
									output reg [31:0] W2_R22,
									output reg [31:0] W2_R21,
									output reg [31:0] W2_R20,
									output reg [31:0] W2_R19,
									output reg [31:0] W2_R18,
									output reg [31:0] W2_R17,
									output reg [31:0] W2_R16,
									// Window 2 Outs; Window 1 Ins
									output reg [31:0] W2_R15,
									output reg [31:0] W2_R14,
									output reg [31:0] W2_R13,
									output reg [31:0] W2_R12,
									output reg [31:0] W2_R11,
									output reg [31:0] W2_R10,
									output reg [31:0] W2_R9,
									output reg [31:0] W2_R8,
									// Window 1 Locals
									output reg [31:0] W1_R23,
									output reg [31:0] W1_R22,
									output reg [31:0] W1_R21,
									output reg [31:0] W1_R20,
									output reg [31:0] W1_R19,
									output reg [31:0] W1_R18,
									output reg [31:0] W1_R17,
									output reg [31:0] W1_R16,
									// Window 1 Outs; Window 0 Ins
									output reg [31:0] W1_R15,
									output reg [31:0] W1_R14,
									output reg [31:0] W1_R13,
									output reg [31:0] W1_R12,
									output reg [31:0] W1_R11,
									output reg [31:0] W1_R10,
									output reg [31:0] W1_R9,
									output reg [31:0] W1_R8,
									// Window 0 Locals
									output reg [31:0] W0_R23,
									output reg [31:0] W0_R22,
									output reg [31:0] W0_R21,
									output reg [31:0] W0_R20,
									output reg [31:0] W0_R19,
									output reg [31:0] W0_R18,
									output reg [31:0] W0_R17,
									output reg [31:0] W0_R16,
									// Window 0 Outs
									output reg [31:0] W0_R15,
									output reg [31:0] W0_R14,
									output reg [31:0] W0_R13,
									output reg [31:0] W0_R12,
									output reg [31:0] W0_R11,
									output reg [31:0] W0_R10,
									output reg [31:0] W0_R9,
									output reg [31:0] W0_R8,
									// Globals
									output reg [31:0] G7,
									output reg [31:0] G6,
									output reg [31:0] G5,
									output reg [31:0] G4,
									output reg [31:0] G3,
									output reg [31:0] G2,
									output reg [31:0] G1,
									output reg [31:0] G0,	// Should be hardcoded to 0
									/* -------------------- Input -------------------- */
									input [31:0] Data_In,		// Data to be stored in a register
									input [6:0] Load_Enable,	// Determines which of 80 available registers is to be loaded
									input RF_LD,
									input Clock
									);
									
		initial
			begin
			// Error logging
			// Initialize all registers to 0
			W3_R31 <= 32'h00000000;
			W3_R30 <= 32'h00000000;
			W3_R29 <= 32'h00000000;
			W3_R28 <= 32'h00000000;
			W3_R27 <= 32'h00000000;
			W3_R26 <= 32'h00000000;
			W3_R25 <= 32'h00000000;
			W3_R24 <= 32'h00000000;
			W3_R23 <= 32'h00000000;
			W3_R22 <= 32'h00000000;
			W3_R21 <= 32'h00000000;
			W3_R20 <= 32'h00000000; 
			W3_R19 <= 32'h00000000;
			W3_R18 <= 32'h00000000;
			W3_R17 <= 32'h00000000;
			W3_R16 <= 32'h00000000;
			W3_R15 <= 32'h00000000;
			W3_R14 <= 32'h00000000;
			W3_R13 <= 32'h00000000;
			W3_R12 <= 32'h00000000;
			W3_R11 <= 32'h00000000;
			W3_R10 <= 32'h00000000;
			W3_R9 <= 32'h00000000;
			W3_R8 <= 32'h00000000;
			W2_R23 <= 32'h00000000;
			W2_R22 <= 32'h00000000; 
			W2_R21 <= 32'h00000000;
			W2_R20 <= 32'h00000000;
			W2_R19 <= 32'h00000000;
			W2_R18 <= 32'h00000000;
			W2_R17 <= 32'h00000000;
			W2_R16 <= 32'h00000000;
			W2_R15 <= 32'h00000000;
			W2_R14 <= 32'h00000000;
			W2_R13 <= 32'h00000000;
			W2_R12 <= 32'h00000000;
			W2_R11 <= 32'h00000000;
			W2_R10 <= 32'h00000000;
			W2_R9 <= 32'h00000000;
			W2_R8 <= 32'h00000000;
			W1_R23 <= 32'h00000000;
			W1_R22 <= 32'h00000000;
			W1_R21 <= 32'h00000000;
			W1_R20 <= 32'h00000000;
			W1_R19 <= 32'h00000000;
			W1_R18 <= 32'h00000000;
			W1_R17 <= 32'h00000000;
			W1_R16 <= 32'h00000000;
			W1_R15 <= 32'h00000000;
			W1_R14 <= 32'h00000000;
			W1_R13 <= 32'h00000000;
			W1_R12 <= 32'h00000000;
			W1_R11 <= 32'h00000000;
			W1_R10 <= 32'h00000000;
			W1_R9 <= 32'h00000000;
			W1_R8 <= 32'h00000000;
			W0_R23 <= 32'h00000000;
			W0_R22 <= 32'h00000000;
			W0_R21 <= 32'h00000000;
			W0_R20 <= 32'h00000000;
			W0_R19 <= 32'h00000000;
			W0_R18 <= 32'h00000000;
			W0_R17 <= 32'h00000000;
			W0_R16 <= 32'h00000000;
			W0_R15 <= 32'h00000000;
			W0_R14 <= 32'h00000000;
			W0_R13 <= 32'h00000000;
			W0_R12 <= 32'h00000000;
			W0_R11 <= 32'h00000000;
			W0_R10 <= 32'h00000000;
			W0_R9 <= 32'h00000000;
			W0_R8 <= 32'h00000000;
			G7 <= 32'h00000000;
			G6 <= 32'h00000000;
			G5 <= 32'h00000000;
			G4 <= 32'h00000000;
			G3 <= 32'h00000000;
			G2 <= 32'h00000000;
			G1 <= 32'h00000000;
			G0 <= 32'h00000000;
			end
	
	always @ (negedge Clock)
		begin
		if (RF_LD)
			begin
			//$display("%t GPRs -- GPR_Load_Enable: %b", $time, Load_Enable);
			case (Load_Enable)
				// Window 0
				7'b0000000:	// R31
					begin
					W1_R15 = Data_In;
					end
				7'b0000001:	// R30
					begin
					W1_R14 = Data_In;
					end
				7'b0000010: // R29
					begin
					W1_R13 = Data_In;
					end
				7'b0000011: // R28
					begin
					W1_R12 = Data_In;
					end
				7'b0000100: // R27
					begin
					W1_R11 = Data_In;
					end
				7'b0000101: // R26
					begin
					W1_R10 = Data_In;
					end
				7'b0000110: // R25
					begin
					W1_R9 = Data_In;
					end
				7'b0000111: // R24
					begin
					W1_R8 = Data_In;
					end
				7'b0001000: // R23
					begin
					W0_R23 = Data_In;
					end
				7'b0001001: // R22
					begin
					W0_R22 = Data_In;
					end
				7'b0001010: // R21
					begin
					W0_R21 = Data_In;
					end
				7'b0001011: // R20
					begin
					W0_R20 = Data_In;
					end
				7'b0001100: // R19
					begin
					W0_R19 = Data_In;
					end
				7'b0001101: // R18
					begin 
					W0_R18 = Data_In;
					end
				7'b0001110: // R17
					begin
					W0_R17 = Data_In;
					end
				7'b0001111: // R16
					begin
					W0_R16 = Data_In;
					end
				7'b0010000: // R15
					begin
					W0_R15 = Data_In;
					end 
				7'b0010001: // R14
					begin
					W0_R14 = Data_In;
					end
				7'b0010010: // R13
					begin
					W0_R13 = Data_In;
					end
				7'b0010011: // R12
					begin
					W0_R12 = Data_In;
					end
				7'b0010100: // R11
					begin
					W0_R11 = Data_In;
					end
				7'b0010101: // R10
					begin
					W0_R10 = Data_In;
					end
				7'b0010110: // R9
					begin
					W0_R9 = Data_In;
					end
				7'b0010111: // R8
					begin
					W0_R8 = Data_In;
					end
				
				// Window 1
				7'b0000000 + 7'b0011000:	// R31
					begin
					W2_R15 = Data_In;
					end
				7'b0000001 + 7'b0011000:	// R30
					begin
					W2_R14 = Data_In;
					end
				7'b0000010 + 7'b0011000:	// R29
					begin
					W2_R13 = Data_In;
					end
				7'b0000011 + 7'b0011000:	// R28
					begin
					W2_R12 = Data_In;
					end
				7'b0000100 + 7'b0011000:	// R27
					begin
					W2_R11 = Data_In;
					end
				7'b0000101 + 7'b0011000:	// R26
					begin
					W2_R10 = Data_In;
					end
				7'b0000110 + 7'b0011000:	// R25
					begin
					W2_R9 = Data_In;
					end
				7'b0000111 + 7'b0011000:	// R24
					begin
					W2_R8 = Data_In;
					end
				7'b0001000 + 7'b0011000:	// R23
					begin
					W1_R23 = Data_In;
					end
				7'b0001001 + 7'b0011000:	// R22
					begin
					W1_R22 = Data_In;
					end
				7'b0001010 + 7'b0011000:	// R21
					begin
					W1_R21 = Data_In;
					end
				7'b0001011 + 7'b0011000:	// R20
					begin
					W1_R20 = Data_In;
					end
				7'b0001100 + 7'b0011000:	// R19
					begin
					W1_R19 = Data_In;
					end
				7'b0001101 + 7'b0011000:	// R18
					begin
					W1_R18 = Data_In;
					end
				7'b0001110 + 7'b0011000:	// R17
					begin
					W1_R17 = Data_In;
					end
				7'b0001111 + 7'b0011000:	// R16
					begin	
					W1_R16 = Data_In;
					end
				7'b0010000 + 7'b0011000:	// R15
					begin
					W1_R15 = Data_In;
					end
				7'b0010001 + 7'b0011000:	// R14
					begin
					W1_R14 = Data_In;
					end
				7'b0010010 + 7'b0011000:	// R13
					begin
					W1_R13 = Data_In;
					end
				7'b0010011 + 7'b0011000:	// R12
					begin
					W1_R12 = Data_In;
					end
				7'b0010100 + 7'b0011000:	// R11
					begin
					W1_R11 = Data_In;
					end
				7'b0010101 + 7'b0011000:	// R10
					begin
					W1_R10 = Data_In;
					end
				7'b0010110 + 7'b0011000:	// R9
					begin
					W1_R9 = Data_In;
					end
				7'b0010111 + 7'b0011000:	// R8
					begin
					W1_R8 = Data_In;
					end
				
				// Window 2
				7'b0000000 + 7'b0110000:	// R31
					begin
					W3_R15 = Data_In;
					end
				7'b0000001 + 7'b0110000:	// R30
					begin
					W3_R14 = Data_In;
					end
				7'b0000010 + 7'b0110000:	// R29
					begin
					W3_R13 = Data_In;
					end
				7'b0000011 + 7'b0110000:	// R28
					begin
					W3_R12 = Data_In;
					end
				7'b0000100 + 7'b0110000:	// R27
					begin	
					W3_R11 = Data_In;
					end
				7'b0000101 + 7'b0110000:	// R26
					begin
					W3_R10 = Data_In;
					end
				7'b0000110 + 7'b0110000:	// R25
					begin
					W3_R9 = Data_In;
					end
				7'b0000111 + 7'b0110000:	// R24
					begin
					W3_R8 = Data_In;
					end
				7'b0001000 + 7'b0110000:	// R23
					begin
					W2_R23 = Data_In;
					end
				7'b0001001 + 7'b0110000:	// R22
					begin
					W2_R22 = Data_In;
					end
				7'b0001010 + 7'b0110000:	// R21
					begin
					W2_R21 = Data_In;
					end
				7'b0001011 + 7'b0110000:	// R20
					begin
					W2_R20 = Data_In;
					end
				7'b0001100 + 7'b0110000:	// R19
					begin
					W2_R19 = Data_In;
					end
				7'b0001101 + 7'b0110000:	// R18
					begin
					W2_R18 = Data_In;
					end
				7'b0001110 + 7'b0110000:	// R17
					begin
					W2_R17 = Data_In;
					end
				7'b0001111 + 7'b0110000:	// R16
					begin
					W2_R16 = Data_In;
					end
				7'b0010000 + 7'b0110000:	// R15
					begin
					W2_R15 = Data_In;
					end
				7'b0010001 + 7'b0110000:	// R14
					begin	
					W2_R14 = Data_In;
					end
				7'b0010010 + 7'b0110000:	// R13
					begin
					W2_R13 = Data_In;
					end
				7'b0010011 + 7'b0110000:	// R12
					begin
					W2_R12 = Data_In;
					end
				7'b0010100 + 7'b0110000:	// R11
					begin
					W2_R11 = Data_In;
					end
				7'b0010101 + 7'b0110000:	// R10
					begin
					W2_R10 = Data_In;
					end
				7'b0010110 + 7'b0110000:	// R9
					begin
					W2_R9 = Data_In;
					end
				7'b0010111 + 7'b0110000:	// R8
					begin
					W2_R8 = Data_In;
					end
				
				// Window 3
				7'b0000000 + 7'b1001000:	// R31
					begin
					W3_R31 = Data_In;
					end
				7'b0000001 + 7'b1001000:	// R30
					begin
					W3_R30 = Data_In;
					end
				7'b0000010 + 7'b1001000:	// R29
					begin
					W3_R29 = Data_In;
					end
				7'b0000011 + 7'b1001000:	// R28
					begin
					W3_R28 = Data_In;
					end
				7'b0000100 + 7'b1001000:	// R27
					begin
					W3_R27 = Data_In;
					end
				7'b0000101 + 7'b1001000:	// R26
					begin
					W3_R26 = Data_In;
					end
				7'b0000110 + 7'b1001000:	// R25
					begin
					W3_R25 = Data_In;
					end
				7'b0000111 + 7'b1001000:	// R24
					begin
					W3_R24 = Data_In;
					end
				7'b0001000 + 7'b1001000:	// R23
					begin	
					W3_R23 = Data_In;
					end
				7'b0001001 + 7'b1001000:	// R22
					begin
					W3_R22 = Data_In;
					end
				7'b0001010 + 7'b1001000:	// R21
					begin
					W3_R21 = Data_In;
					end
				7'b0001011 + 7'b1001000:	// R20
					begin
					W3_R20 = Data_In;
					end	
				7'b0001100 + 7'b1001000:	// R19
					begin
					W3_R19 = Data_In;
					end
				7'b0001101 + 7'b1001000:	// R18
					begin
					W3_R18 = Data_In;
					end
				7'b0001110 + 7'b1001000:	// R17
					begin
					W3_R17 = Data_In;
					end
				7'b0001111 + 7'b1001000:	// R16
					begin
					W3_R16 = Data_In;
					end
				7'b0010000 + 7'b1001000:	// R15
					begin
					W3_R15 = Data_In;
					end
				7'b0010001 + 7'b1001000:	// R14
					begin
					W3_R14 = Data_In;
					end
				7'b0010010 + 7'b1001000:	// R13
					begin
					W3_R13 = Data_In;
					end
				7'b0010011 + 7'b1001000:	// R12
					begin
					W3_R12 = Data_In;
					end
				7'b0010100 + 7'b1001000:	// R11
					begin
					W3_R11 = Data_In;
					end
				7'b0010101 + 7'b1001000:	// R10
					begin
					W3_R10 = Data_In;
					end
				7'b0010110 + 7'b1001000:	// R9
					begin
					W3_R9 = Data_In;
					end
				7'b0010111 + 7'b1001000:	// R8
					begin
					W3_R8 = Data_In;
					end
				
				// Globals	
				7'b1100000:	// R0
					begin
					G0 = 0;	
					end
				7'b1100001:	// R1
					begin
					G1 = Data_In;
					end
				7'b1100010:	// R2
					begin
					G2 = Data_In;
					end
				7'b1100011:	// R3
					begin
					G3 = Data_In;
					end
				7'b1100100:	// R4
					begin
					G4 = Data_In;
					end
				7'b1100101:	// R5
					begin
					G5 = Data_In;
					end
				7'b1100110:	// R6
					begin
					G6 = Data_In;
					end	
				7'b1100111:	// R7
					begin
					G7 = Data_In;
					end
			endcase
			end
		end
endmodule