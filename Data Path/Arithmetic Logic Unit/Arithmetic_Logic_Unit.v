module Arithmetic_Logic_Unit (
			/* -------------------- Output -------------------- */
			output reg [31:0] Result,
			output reg Condition_N,
			output reg Condition_Z,
			output reg Condition_V,
			output reg Condition_C,
			/* -------------------- Input -------------------- */
			input [31:0] Operand1,
			input [31:0] Operand2,
			input C_In,
			input [5:0] Opcode
			);
	
	reg [4:0] cwp;
	// Condition codes are cleared by default
	initial
		begin
		Condition_N <= 1'b0;
		Condition_Z <= 1'b0;
		Condition_V <= 1'b0;
		Condition_C <= 1'b0;
		end
	
	// Select instruction based on Opcode
	always @* //(Operand1, Operand2, Opcode)
		begin
		//$display("%t ALU -- Opcode: %b", $time, Opcode);
		case (Opcode)
			// Logical Instructions
			6'b000001:	// AND
				begin
				Result = Operand1 & Operand2;
				end
				
			6'b010001:	// ANDcc
				begin
				Result = Operand1 & Operand2;
				Condition_N <= Result[31];
				if (Result == 32'b0)
					begin
					Condition_Z <= 1'b1;
					end
				else
					begin
					Condition_Z <= 1'b0;
					end
				Condition_V <= 1'b0;
				Condition_C <= 1'b0;
				end
				
			6'b000101:	// ANDN
				begin
				Result = Operand1  &  ~Operand2;
				end
				
			6'b010101:	// ANDNcc
				begin
				Result = Operand1 & ~Operand2;
				Condition_N <= Result[31];
				if (Result == 32'b0)
					begin
					Condition_Z <= 1'b1;
					end
				else
					begin
					Condition_Z <= 1'b0;
					end
				Condition_V <= 1'b0;
				Condition_C <= 1'b0;
				end
				
			6'b000010:	// OR
				begin
				Result = Operand1 | Operand2;
				end
				
			6'b010010:	// ORcc
				begin
				Result = Operand1 | Operand2;
				Condition_N <= Result[31];
				if (Result == 32'b0)
					begin
					Condition_Z <= 1'b1;
					end
				else
					begin
					Condition_Z <= 1'b0;
					end
				Condition_V <= 1'b0;
				Condition_C <= 1'b0;
				end
				
			6'b000110:	// ORN
				begin
				Result = Operand1 | ~Operand2;
				end
				
			6'b010110:	// ORNcc
				begin
				Result = Operand1 | ~Operand2;
				Condition_N <= Result[31];
				if (Result == 32'b0)
					begin
					Condition_Z <= 1'b1;
					end
				else
					begin
					Condition_Z <= 1'b0;
					end
				Condition_V <= 1'b0;
				Condition_C <= 1'b0;
				end
				
			6'b000011:	// XOR
				begin
				Result = Operand1 ^ Operand2;
				end
				
			6'b010011:	// XORcc
				begin
				Result = Operand1 ^ Operand2;
				Condition_N <= Result[31];
				if (Result == 32'b0)
					begin
					Condition_Z <= 1'b1;
					end
				else
					begin
					Condition_Z <= 1'b0;
					end
				Condition_V <= 1'b0;
				Condition_C <= 1'b0;
				end
				
			6'b000111:	// XNOR
				begin
				Result = Operand1 ^ ~Operand2;
				end
				
			6'b010111:	// XNORcc
				begin
				Result = Operand1 ^ ~Operand2;
				Condition_N <= Result[31];
				if (Result == 32'b0)
					begin
					Condition_Z <= 1'b1;
					end
				else
					begin
					Condition_Z <= 1'b0;
					end
				Condition_V <= 1'b0;
				Condition_C <= 1'b0;
				end
			
			// Shift Instructions
			6'b100101:	// SLL
				begin
				Result = Operand1 << Operand2[4:0];
				end
				
			6'b100110:	// SRL
				begin
				Result = Operand1 >> Operand2[4:0];
				end
				
			6'b100111:	// SRA
				begin
				Result = $signed(Operand1) >>> Operand2[4:0];
				end
				
			// Add Instructions
			6'b000000:	// ADD
				begin
				Result = Operand1 + Operand2;
				end
				
			6'b010000:	// ADDcc
				begin
				Result = Operand1 + Operand2;
				Condition_N <= Result[31];
				if (Result == 32'b0)
					begin
					Condition_Z <= 1'b1;
					end
				else
					begin
					Condition_Z <= 1'b0;
					end
				Condition_V <= (Operand1[31] & Operand2[31] & !Result[31]) | (!Operand1[31] & !Operand2[31] & Result[31]);
				Condition_C <= (Operand1[31] & Operand2[31]) | (!Result[31] & (Operand1[31] | Operand2[31]));
				end
				
			6'b001000:	// ADDX
				begin
				Result = Operand1 + Operand2 + C_In;
				end
				
			6'b011000:	// ADDXcc
				begin
				Result = Operand1 + Operand2 + C_In;
				Condition_N <= Result[31];
				if (Result == 32'b0)
					begin
					Condition_Z <= 1'b1;
					end
				else
					begin
					Condition_Z <= 1'b0;
					end
				Condition_V <= (Operand1[31] & Operand2[31] & !Result[31]) | (!Operand1[31] & !Operand2[31] & Result[31]);
				Condition_C <= (Operand1[31] & Operand2[31]) | (!Result[31] & (Operand1[31] | Operand2[31]));
				end
			
			// Subtract Instructions
			6'b000100:	// SUB	
				begin
				Result = Operand1 - Operand2;
				end
				
			6'b010100:	// SUBcc
				begin
				Result = Operand1 - Operand2;
				Condition_N <= Result[31];
				if (Result == 32'b0)
					begin
					Condition_Z <= 1'b1;
					end
				else
					begin
					Condition_Z <= 1'b0;
					end
				Condition_V <= (Operand1[31] & (!Operand2[31]) & (!Result[31])) | ((!Operand1[31]) & Operand2[31] & Result[31]);
				Condition_C <= ((!Operand1[31]) & Operand2[31]) | (Result[31] & ((!Operand1[31]) | Operand2[31]));
				end
				
			6'b001100:	// SUBX
				begin
				Result = Operand1 - Operand2 - C_In;
				end
				
			6'b011100:	// SUBXcc
				begin
				Result = Operand1 - Operand2 - C_In;
				Condition_N <= Result[31];
				if (Result == 32'b0)
					begin
					Condition_Z <= 1'b1;
					end
				else
					begin
					Condition_Z <= 1'b0;
					end
				Condition_V <= (Operand1[31] & (!Operand2[31]) & (!Result[31])) | ((!Operand1[31]) & Operand2[31] & Result[31]);
				Condition_C <= ((!Operand1[31]) & Operand2[31]) | (Result[31] & ((!Operand1[31]) | Operand2[31]));
				end
				
			// State Register Read/Write Instructions
			6'b110001:	// WRPSR
				begin
				Result = Operand1 ^ Operand2;
				end
			
			6'b110010:	// WRWIM
				begin
				Result = Operand1 ^ Operand2;
				end
			
			6'b110011:	// WRTBR
				begin
				Result = Operand1 ^ Operand2;
				end
				
			6'b111111:	// Trap Instruction -- Write to PSR
				begin
				Result = {Operand1[31:8], 1'b1, Operand1[7], 1'b0, Operand1[4:0] - 1'b1};
				end
			
			6'b111110:	// SAVE Instruction
				begin
				cwp = ((Operand1[4:0] - 1) % 4 + 4) % 4;
				Result = {Operand1[31:5], cwp};
				end
			
			6'b111100:	// Set WIM
				begin
				case (Operand2)
					5'b00000:
						begin
						Result <= Operand1 ^ 5'b00010;
						end
					5'b00001:
						begin
						Result <= Operand1 ^ 5'b00100;
						end
					5'b00010:
						begin
						Result <= Operand1 ^ 5'b01000;
						end
					5'b00011:
						begin
						Result <= Operand1 ^ 5'b00001;
						end
				endcase
				end
				
			6'b111000:	// Window_Overflow Trap -- Writing to TBR
				begin
				Result = {{25{1'b0}}, 7'b0000001};
				end
				
			6'b110000:	// Window_Overflow Trap -- Writing to PSR
				begin
				cwp = ((Operand1[4:0] - 1) % 4 + 4) % 4;
				Result = {Operand1[31:12], 4'b0010, 1'b1, Operand1[7], 1'b0, cwp};
				end
			
			6'b101001:	// Window_Underflow Trap -- Writing to TBR
				begin
				Result = {{25{1'b0}}, 7'b0000010};
				end
			
			6'b111101:	// Window_Underflow Trap -- Writing to PSR
				begin
				Result = {Operand1[31:12], 4'b0010, 1'b1, Operand1[7], 1'b0, (Operand1[4:0] + 1) % 1'd4};
				end
			
			6'b111011:	// Illegal_Instruction Trap -- Writing to TBR
				begin
				Result = {{25{1'b0}}, 7'b0001000};
				end
				
			6'b101111:	// Illegal_Instruction Trap -- Writing to PSR
				begin
				Result = {Operand1[31:12], 4'b0010, 1'b1, Operand1[7], 1'b0, (Operand1[4:0] - 1) % 1'd4};
				end
				
			default: 
				begin
				Result = 6'b000000;
				end
		endcase
		end
endmodule