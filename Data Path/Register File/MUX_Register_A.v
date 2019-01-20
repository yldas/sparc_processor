module MUX_Register_A (
						output reg [31:0] Register_A,
						
						input [4:0] Register_A_Select,
						
						input [31:0] R31,
						input [31:0] R30,
						input [31:0] R29,
						input [31:0] R28,
						input [31:0] R27,
						input [31:0] R26,
						input [31:0] R25,
						input [31:0] R24,
						input [31:0] R23,
						input [31:0] R22,
						input [31:0] R21,
						input [31:0] R20,
						input [31:0] R19,
						input [31:0] R18,
						input [31:0] R17,
						input [31:0] R16,
						input [31:0] R15,
						input [31:0] R14,
						input [31:0] R13,
						input [31:0] R12,
						input [31:0] R11,
						input [31:0] R10,
						input [31:0] R9,
						input [31:0] R8,
						input [31:0] R7,
						input [31:0] R6,
						input [31:0] R5,
						input [31:0] R4,
						input [31:0] R3,
						input [31:0] R2,
						input [31:0] R1,
						input [31:0] R0
						);
	always @*
		begin
		case (Register_A_Select)
			5'b00000:
				begin
				Register_A = R0;
				end
			5'b00001:
				begin
				Register_A = R1;
				end
			5'b00010:
				begin
				Register_A = R2;
				end
			5'b00011:
				begin
				Register_A = R3;
				end
			5'b00100:
				begin
				Register_A = R4;
				end
			5'b00101:
				begin
				Register_A = R5;
				end
			5'b00110:
				begin
				Register_A = R6;
				end
			5'b00111:
				begin
				Register_A = R7;
				end
			5'b01000:
				begin
				Register_A = R8;
				end
			5'b01001:
				begin
				Register_A = R9;
				end
			5'b01010:
				begin
				Register_A = R10;
				end
			5'b01011:
				begin
				Register_A = R11;
				end
			5'b01100:
				begin
				Register_A = R12;
				end
			5'b01101:
				begin
				Register_A = R13;
				end
			5'b01110:
				begin
				Register_A = R14;
				end
			5'b01111:
				begin
				Register_A = R15;
				end
			5'b10000:
				begin
				Register_A = R16;
				end
			5'b10001:
				begin
				Register_A = R17;
				end
			5'b10010:
				begin
				Register_A = R18;
				end
			5'b10011:
				begin
				Register_A = R19;
				end
			5'b10100:
				begin
				Register_A = R20;
				end
			5'b10101:
				begin
				Register_A = R21;
				end
			5'b10110:
				begin
				Register_A = R22;
				end
			5'b10111:
				begin
				Register_A = R23;
				end
			5'b11000:
				begin
				Register_A = R24;
				end
			5'b11001:
				begin
				Register_A = R25;
				end
			5'b11010:
				begin
				Register_A = R26;
				end
			5'b11011:
				begin
				Register_A = R27;
				end
			5'b11100:
				begin
				Register_A = R28;
				end
			5'b11101:
				begin
				Register_A = R29;
				end
			5'b11110:
				begin
				Register_A = R30;
				end
			5'b11111:
				begin
				Register_A = R31;
				end
		endcase
		end
endmodule