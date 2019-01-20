module Next_State_Address_Encoder (
				output reg [8:0] Next_State_Address,
				input [31:0] Instruction
				);
	
	integer LogFile;
	
	initial
		begin
		// Time formatting
		$timeformat(-9, 2, " ns", 0);
		// Error logging
		LogFile = $fopen("D:\\Users\\Misael\\Documents\\Classes\\ICOM4215-001D\\SPARC Microprocessor\\Logs\\Control Unit Logs\\Next_State_Address_Encoder_log.dat");
		end
		
	always @ (Instruction)
		begin
		/* FORMAT 1 BEGIN */
		if (Instruction[31:30] == 2'b01)
			begin
			// CALL Instruction
			$fdisplay(LogFile, "%t CALL", $time);
			Next_State_Address = 9'd71;
			end
		/* FORMAT 1 END */
		/* FORMAT 2 BEGIN */	
		else if (Instruction[31:30] == 2'b00)
			begin
			// SETHI & Branch Instructions
			if (Instruction[24:22] == 3'b100)	// SETHI
				begin
				$fdisplay(LogFile, "%t SETHI", $time);
				Next_State_Address = 9'd51;
				end
			else if (Instruction[24:22] == 3'b010)	// Branch
				begin
				case (Instruction[28:25])	// Cond
					4'b1000:	// Ba
						begin
						$fdisplay(LogFile, "%t Ba", $time);
						Next_State_Address = 9'd101;
						end
						
					4'b0000:	// Bn
						begin
						$fdisplay(LogFile, "%t Bn", $time);
						Next_State_Address = 9'd101;
						end
						
					4'b1001:	// Bne
						begin
						$fdisplay(LogFile, "%t Bne", $time);
						Next_State_Address = 9'd73;
						end
						
					4'b0001:	// Be
						begin
						$fdisplay(LogFile, "%t Be", $time);
						Next_State_Address = 9'd73;
						end
						
					4'b1010:	// Bg
						begin
						$fdisplay(LogFile, "%t Bg", $time);
						Next_State_Address = 9'd73;
						end
						
					4'b0010:	// Ble
						begin
						$fdisplay(LogFile, "%t Ble", $time);
						Next_State_Address = 9'd73;
						end
						
					4'b1011:	// Bge
						begin
						$fdisplay(LogFile, "%t Bge", $time);
						Next_State_Address = 9'd73;
						end
						
					4'b0011:	// Bl
						begin
						$fdisplay(LogFile, "%t Bl", $time);
						Next_State_Address = 9'd73;
						end
						
					4'b1100:	// Bgu
						begin
						$fdisplay(LogFile, "%t Bgu", $time);
						Next_State_Address = 9'd73;
						end
						
					4'b0100:	// Bleu
						begin
						$fdisplay(LogFile, "%t Bleu", $time);
						Next_State_Address = 9'd73;
						end
					
					4'b1101:	// Bcc
						begin
						$fdisplay(LogFile, "%t Bcc", $time);
						Next_State_Address = 9'd73;
						end
					
					4'b0101:	// Bcs
						begin
						$fdisplay(LogFile, "%t Bcs", $time);
						Next_State_Address = 9'd73;
						end
					
					4'b1110:	// Bpos
						begin
						$fdisplay(LogFile, "%t Bpos", $time);
						Next_State_Address = 9'd73;
						end
					
					4'b0110:	// Bneg
						begin
						$fdisplay(LogFile, "%t Bneg", $time);
						Next_State_Address = 9'd73;
						end
						
					4'b1111:	// Bvc
						begin
						$fdisplay(LogFile, "%t Bvc", $time);
						Next_State_Address = 9'd73;
						end
					
					4'b0111:	// Bvs
						begin
						$fdisplay(LogFile, "%t Bvs", $time);
						Next_State_Address = 9'd73;
						end
					endcase
				end
			end
		/* FORMAT 2 END */
		/* FORMAT 3 BEGIN */	
		else
			begin
			// Data Processing Instructions
			if (Instruction[31:30] == 2'b10)
				begin
					if (Instruction[13] == 1'b0)
						begin
						// rd <= rs1 OP rs2
						if (Instruction[24:19] == 6'b000000) // ADD (R-R)
							begin
							$fdisplay(LogFile, "%t ADD (R-R)", $time);
							Next_State_Address = 9'd5;
							end
							
						else if (Instruction[24:19] == 6'b010000)	// ADDcc (R-R)
							begin
							$fdisplay(LogFile, "%t ADDcc (R-R)", $time);
							Next_State_Address = 9'd7;
							end
							
						else if (Instruction[24:19] == 6'b001000)	// ADDx (R-R)
							begin
							$fdisplay(LogFile, "%t ADDx (R-R)", $time);
							Next_State_Address = 9'd9;
							end
							
						else if (Instruction[24:19] == 6'b011000)	// ADDxcc (R-R)
							begin
							$fdisplay(LogFile, "%t ADDxcc (R-R)", $time);
							Next_State_Address = 9'd11;
							end
							
						else if (Instruction[24:19] == 6'b000100)	// SUB (R-R)
							begin
							$fdisplay(LogFile, "%t SUB (R-R)", $time);
							Next_State_Address = 9'd13;
							end
							
						else if (Instruction[24:19] == 6'b010100)	// SUBcc (R-R)
							begin
							$fdisplay(LogFile, "%t SUBcc (R-R)", $time);
							Next_State_Address = 9'd15;
							end
							
						else if (Instruction[24:19] == 6'b011000)	// SUBx (R-R)
							begin
							$fdisplay(LogFile, "%t SUBx (R-R)", $time);
							Next_State_Address = 9'd17;
							end
						
						else if (Instruction[24:19] == 6'b011100)	// SUBxcc (R-R)
							begin
							$fdisplay(LogFile, "%t SUBxcc (R-R)", $time);
							Next_State_Address = 9'd19;
							end
							
						else if (Instruction[24:19] == 6'b000001)	// AND (R-R)
							begin
							$fdisplay(LogFile, "%t AND (R-R)", $time);
							Next_State_Address = 9'd21;
							end
						
						else if (Instruction[24:19] == 6'b010001)	// ANDcc (R-R)
							begin
							$fdisplay(LogFile, "%t ANDcc (R-R)", $time);
							Next_State_Address = 9'd23;
							end
						
						else if (Instruction[24:19] == 6'b000101)	// ANDn (R-R)
							begin
							$fdisplay(LogFile, "%t ANDn (R-R)", $time);
							Next_State_Address = 9'd25;
							end
						
						else if (Instruction[24:19] == 6'b010101)	// ANDncc (R-R)
							begin
							$fdisplay(LogFile, "%t ANDncc (R-R)", $time);
							Next_State_Address = 9'd27;
							end
						
						else if (Instruction[24:19] == 6'b000010)	// OR (R-R)
							begin
							$fdisplay(LogFile, "%t OR (R-R)", $time);
							Next_State_Address = 9'd29;
							end
						
						else if (Instruction[24:19] == 6'b010010)	// ORcc (R-R)
							begin
							$fdisplay(LogFile, "%t ORcc (R-R)", $time);
							Next_State_Address = 9'd31;
							end
						
						else if (Instruction[24:19] == 6'b000110)	// ORn (R-R)
							begin
							$fdisplay(LogFile, "%t ORn (R-R)", $time);
							Next_State_Address = 9'd33;
							end
						
						else if (Instruction[24:19] == 6'b010110)	// ORncc (R-R)
							begin
							$fdisplay(LogFile, "%t ORncc (R-R)", $time);
							Next_State_Address = 9'd35;
							end
						
						else if (Instruction[24:19] == 6'b000011)	// XOR (R-R)
							begin
							$fdisplay(LogFile, "%t XOR (R-R)", $time);
							Next_State_Address = 9'd37;
							end
						
						else if (Instruction[24:19] == 6'b010011)	// XORcc (R-R)
							begin
							$fdisplay(LogFile, "%t XORcc (R-R)", $time);
							Next_State_Address = 9'd39;
							end
						
						else if (Instruction[24:19] == 6'b000111)	// XNOR (R-R)
							begin
							$fdisplay(LogFile, "%t XNOR (R-R)", $time);
							Next_State_Address = 9'd41;
							end
						
						else if (Instruction[24:19] == 6'b010111)	// XNORcc (R-R)
							begin
							$fdisplay(LogFile, "%t XNORcc (R-R)", $time);
							Next_State_Address = 9'd43;
							end
						
						else if (Instruction[24:19] == 6'b100110)	// SRL (R-R)
							begin
							$fdisplay(LogFile, "%t SRL (R-R)", $time);
							Next_State_Address = 9'd45;
							end
						
						else if (Instruction[24:19] == 6'b100101)	// SLL (R-R)
							begin
							$fdisplay(LogFile, "%t SLL (R-R)", $time);
							Next_State_Address = 9'd47;
							end
						
						else if (Instruction[24:19] == 6'b100111)	// SRA (R-R)
							begin
							$fdisplay(LogFile, "%t SRA (R-R)", $time);
							Next_State_Address = 9'd49;
							end
						
						else if (Instruction[24:19] == 6'b111000)	// Jmpl (R-R)
							begin
							$fdisplay(LogFile, "%t Jmpl (R-R)", $time);
							Next_State_Address = 9'd69;
							end
							
						else if (Instruction[24:19] == 6'b100101)	// Jmpl (R-R)		
							begin
							$fdisplay(LogFile, "%t Jmpl (R-R)", $time);
							Next_State_Address = 9'd69;
							end
							
						else if (Instruction[24:19] == 6'b001010)	// Umul (R-R)		
							begin
							$fdisplay(LogFile, "%t Umul (R-R)", $time);
							Next_State_Address = 9'd5;
							end
						
						else if (Instruction[24:19] == 6'b101001)	// RDPSR 
							begin
							$fdisplay(LogFile, "%t RDPSR (R-R)", $time);
							Next_State_Address = 9'd160;
							end
						
						else if (Instruction[24:19] == 6'b101010)	// RDWIM 	
							begin
							$fdisplay(LogFile, "%t RDWIM (R-R)", $time);
							Next_State_Address = 9'd161;
							end
						
						else if (Instruction[24:19] == 6'b101011)	// RDTBR 	
							begin
							$fdisplay(LogFile, "%t RDTBR (R-R)", $time);
							Next_State_Address = 9'd162;
							end
						
						else if (Instruction[24:19] == 6'b110001)	// WRPSR (R-R)		
							begin
							$fdisplay(LogFile, "%t WRPSR (R-R)", $time);
							Next_State_Address = 9'd166;
							end
						
						else if (Instruction[24:19] == 6'b110010)	// WRWIM (R-R)		
							begin
							$fdisplay(LogFile, "%t WRWIM (R-R)", $time);
							Next_State_Address = 9'd168;
							end
							
						else if (Instruction[24:19] == 6'b110011)	// WRTBR (R-R)		
							begin
							$fdisplay(LogFile, "%t WRTBR (R-R)", $time);
							Next_State_Address = 9'd170;
							end
						
						else if (Instruction[24:19] == 6'b111100)	// SAVE (R-R)		
							begin
							$fdisplay(LogFile, "%t SAVE (R-R)", $time);
							Next_State_Address = 9'd180;
							end
						
						else if (Instruction[24:19] == 6'b111101)	// RESTORE (R-R)		
							begin
							$fdisplay(LogFile, "%t RESTORE (R-R)", $time);
							Next_State_Address = 9'd205;
							end
						
						else if (Instruction[24:19] == 6'b111001)	// RETT (R-R)		
							begin
							$fdisplay(LogFile, "%t RETT (R-R)", $time);
							Next_State_Address = 9'd222;
							end
						end
					else
						begin
						// rd <= rs1 OP simm13
						if (Instruction[24:19] == 6'b000000) // ADD (simm13)
							begin
							$fdisplay(LogFile, "%t ADD (simm13)", $time);
							Next_State_Address = 9'd6;
							end
							
						else if (Instruction[24:19] == 6'b010000)	// ADDcc (simm13)
							begin
							$fdisplay(LogFile, "%t ADDcc (simm13)", $time);
							Next_State_Address = 9'd8;
							end
							
						else if (Instruction[24:19] == 6'b001000)	// ADDx (simm13)
							begin
							$fdisplay(LogFile, "%t ADDx (simm13)", $time);
							Next_State_Address = 9'd10;
							end
							
						else if (Instruction[24:19] == 6'b011000)	// ADDxcc (simm13)
							begin
							$fdisplay(LogFile, "%t ADDxcc (simm13)", $time);
							Next_State_Address = 9'd12;
							end
							
						else if (Instruction[24:19] == 6'b000100)	// SUB (simm13)
							begin
							$fdisplay(LogFile, "%t SUB (simm13)", $time);
							Next_State_Address = 9'd14;
							end
							
						else if (Instruction[24:19] == 6'b010100)	// SUBcc (simm13)
							begin
							$fdisplay(LogFile, "%t SUBcc (simm13)", $time);
							Next_State_Address = 9'd16;
							end
							
						else if (Instruction[24:19] == 6'b011000)	// SUBx (simm13)
							begin
							$fdisplay(LogFile, "%t SUBx (simm13)", $time);
							Next_State_Address = 9'd18;
							end
						
						else if (Instruction[24:19] == 6'b011100)	// SUBxcc (simm13)
							begin
							$fdisplay(LogFile, "%t SUBxcc (simm13)", $time);
							Next_State_Address = 9'd20;
							end
							
						else if (Instruction[24:19] == 6'b000001)	// AND (simm13)
							begin
							$fdisplay(LogFile, "%t AND (simm13)", $time);
							Next_State_Address = 9'd22;
							end
						
						else if (Instruction[24:19] == 6'b010001)	// ANDcc (simm13)
							begin
							$fdisplay(LogFile, "%t ANDcc (simm13)", $time);
							Next_State_Address = 9'd24;
							end
						
						else if (Instruction[24:19] == 6'b000101)	// ANDn (simm13)
							begin
							$fdisplay(LogFile, "%t ANDn (simm13)", $time);
							Next_State_Address = 9'd26;
							end
						
						else if (Instruction[24:19] == 6'b010101)	// ANDncc (simm13)
							begin
							$fdisplay(LogFile, "%t ANDncc (simm13)", $time);
							Next_State_Address = 9'd28;
							end
						
						else if (Instruction[24:19] == 6'b000010)	// OR (simm13)
							begin
							$fdisplay(LogFile, "%t OR (simm13)", $time);
							Next_State_Address = 9'd30;
							end
						
						else if (Instruction[24:19] == 6'b010010)	// ORcc (simm13)
							begin
							$fdisplay(LogFile, "%t ORcc (simm13)", $time);
							Next_State_Address = 9'd32;
							end
						
						else if (Instruction[24:19] == 6'b000110)	// ORn (simm13)
							begin
							$fdisplay(LogFile, "%t ORn (simm13)", $time);
							Next_State_Address = 9'd34;
							end
						
						else if (Instruction[24:19] == 6'b010110)	// ORncc (simm13)
							begin
							$fdisplay(LogFile, "%t ORncc (simm13)", $time);
							Next_State_Address = 9'd36;
							end
						
						else if (Instruction[24:19] == 6'b000011)	// XOR (simm13)
							begin
							$fdisplay(LogFile, "%t XOR (simm13)", $time);
							Next_State_Address = 9'd38;
							end
						
						else if (Instruction[24:19] == 6'b010011)	// XORcc (simm13)
							begin
							$fdisplay(LogFile, "%t XORcc (simm13)", $time);
							Next_State_Address = 9'd40;
							end
						
						else if (Instruction[24:19] == 6'b000111)	// XORn (simm13)
							begin
							$fdisplay(LogFile, "%t XORn (simm13)", $time);
							Next_State_Address = 9'd42;
							end
						
						else if (Instruction[24:19] == 6'b010111)	// XORncc (simm13)
							begin
							$fdisplay(LogFile, "%t XORncc (simm13)", $time);
							Next_State_Address = 9'd44;
							end
						
						else if (Instruction[24:19] == 6'b100110)	// SRL (simm13)
							begin
							$fdisplay(LogFile, "%t SRL (simm13)", $time);
							Next_State_Address = 9'd46;
							end
						
						else if (Instruction[24:19] == 6'b100101)	// SLL (simm13)
							begin
							$fdisplay(LogFile, "%t SLL (simm13)", $time);
							Next_State_Address = 9'd48;
							end
						
						else if (Instruction[24:19] == 6'b100111)	// SRA (simm13)
							begin
							$fdisplay(LogFile, "%t SRA (simm13)", $time);
							Next_State_Address = 9'd50;
							end
						
						else if (Instruction[24:19] == 6'b111000)	// Jmpl (simm13)
							begin
							$fdisplay(LogFile, "%t Jmpl (simm13)", $time);
							Next_State_Address = 9'd70;
							end
						
						else if (Instruction[24:19] == 6'b111010)	// Trap Instruction (imm7)
							begin
							$fdisplay(LogFile, "%t Trap Instruction (imm7)", $time);
							Next_State_Address = 9'd150;
							end
						
						else if (Instruction[24:19] == 6'b110001)	// WRPSR (simm13)		
							begin
							$fdisplay(LogFile, "%t WRPSR (simm13)", $time);
							Next_State_Address = 9'd167;
							end
						
						else if (Instruction[24:19] == 6'b110010)	// WRWIM (simm13)		
							begin
							$fdisplay(LogFile, "%t WRWIM (simm13)", $time);
							Next_State_Address = 9'd169;
							end
							
						else if (Instruction[24:19] == 6'b110011)	// WRTBR (simm13)		
							begin
							$fdisplay(LogFile, "%t WRTBR (simm13)", $time);
							Next_State_Address = 9'd171;
							end
						
						else if (Instruction[24:19] == 6'b111100)	// SAVE (simm13)		
							begin
							$fdisplay(LogFile, "%t SAVE (simm13)", $time);
							Next_State_Address = 9'd185;
							end
						
						else if (Instruction[24:19] == 6'b111101)	// RESTORE (simm13)		
							begin
							$fdisplay(LogFile, "%t RESTORE (simm13)", $time);
							Next_State_Address = 9'd210;
							end
						
						else if (Instruction[24:19] == 6'b111001)	// RETT (simm13)		
							begin
							$fdisplay(LogFile, "%t RETT (simm13)", $time);
							Next_State_Address = 9'd232;
							end
						end
				end
			// Memory Instructions
			else if (Instruction[31:30] == 2'b11)
				begin
				if (Instruction[13] == 1'b0)	// (R-R)
					begin
					if (Instruction[24:19] == 6'b001001)	// Lsb (R-R)
						begin
						$fdisplay(LogFile, "%t Lsb (R-R)", $time);
						Next_State_Address = 9'd53;
						end
					
					else if (Instruction[24:19] == 6'b001010)	// Ldsh (R-R)
						begin
						$fdisplay(LogFile, "%t Ldsh (R-R)", $time);
						Next_State_Address = 9'd96;
						end
					
					else if (Instruction[24:19] == 6'b000000)	// Ld (R-R)
						begin
						$fdisplay(LogFile, "%t Ld (R-R)", $time);
						Next_State_Address = 9'd104;
						end
					
					else if (Instruction[24:19] == 6'b000001)	// Ldub (R-R)
						begin
						$fdisplay(LogFile, "%t Ldub (R-R)", $time);
						Next_State_Address = 9'd80;
						end
					
					else if (Instruction[24:19] == 6'b000010)	// Lduh (R-R)
						begin
						$fdisplay(LogFile, "%t Lduh (R-R)", $time);
						Next_State_Address = 9'd112;
						end
					
					else if (Instruction[24:19] == 6'b000011)	// Ldd (R-R)
						begin
						$fdisplay(LogFile, "%t Ldd (R-R)", $time);
						Next_State_Address = 9'd120;
						end
						
					else if (Instruction[24:19] == 6'b000101)	// Stb (R-R)
						begin
						$fdisplay(LogFile, "%t Stb (R-R)", $time);
						Next_State_Address = 9'd88;
						end
						
					else if (Instruction[24:19] == 6'b000110)	// Sth (R-R)
						begin
						$fdisplay(LogFile, "%t Sth (R-R)", $time);
						Next_State_Address = 9'd136;
						end
						
					else if (Instruction[24:19] == 6'b000100)	// St (R-R)
						begin
						$fdisplay(LogFile, "%t St (R-R)", $time);
						Next_State_Address = 9'd61;
						end
						
					else if (Instruction[24:19] == 6'b000111)	// Std (R-R)
						begin
						$fdisplay(LogFile, "%t Std (R-R)", $time);
						Next_State_Address = 9'd120;
						end
					end
				else	// simm13
					begin
					if (Instruction[24:19] == 6'b001001)	// Lsb (simm13)
						begin
						$fdisplay(LogFile, "%t Lsb (simm13)", $time);
						Next_State_Address = 9'd57;
						end
					
					else if (Instruction[24:19] == 6'b001010)	// Ldsh (simm13)
						begin
						$fdisplay(LogFile, "%t Ldsh (simm13)", $time);
						Next_State_Address = 9'd100;
						end
					
					else if (Instruction[24:19] == 6'b000000)	// Ld (simm13)
						begin
						$fdisplay(LogFile, "%t Ld (simm13)", $time);
						Next_State_Address = 9'd108;
						end
					
					else if (Instruction[24:19] == 6'b000001)	// Ldub (simm13)
						begin
						$fdisplay(LogFile, "%t Ldub (simm13)", $time);
						Next_State_Address = 9'd84;
						end
					
					else if (Instruction[24:19] == 6'b000010)	// Lduh (simm13)
						begin
						$fdisplay(LogFile, "%t Lduh (simm13)", $time);
						Next_State_Address = 9'd116;
						end
					
					else if (Instruction[24:19] == 6'b000011)	// Ldd (simm13)
						begin
						$fdisplay(LogFile, "%t Ldd (simm13)", $time);
						Next_State_Address = 9'd124;
						end
						
					else if (Instruction[24:19] == 6'b000101)	// Stb (simm13)
						begin
						$fdisplay(LogFile, "%t Stb (simm13)", $time);
						Next_State_Address = 9'd92;
						end
						
					else if (Instruction[24:19] == 6'b000110)	// Sth (simm13)
						begin
						$fdisplay(LogFile, "%t Sth (simm13)", $time);
						Next_State_Address = 9'd140;
						end
						
					else if (Instruction[24:19] == 6'b000100)	// St (simm13)
						begin
						$fdisplay(LogFile, "%t St (simm13)", $time);
						Next_State_Address = 9'd65;
						end
						
					else if (Instruction[24:19] == 6'b000111)	// Std (simm13)
						begin
						$fdisplay(LogFile, "%t Std (simm13)", $time);
						Next_State_Address = 9'd124;
						end
					end
				end
			/* FORMAT 3 END*/
			else
				begin
				Next_State_Address = 9'd300;	// Illegal_Instruction Trap
				$fdisplay(LogFile, "%t Illegal Instruction: %d", $time, Instruction);
				$display(LogFile, "%t Illegal Instruction: %d", $time, Instruction);
				end
			end
		end
endmodule