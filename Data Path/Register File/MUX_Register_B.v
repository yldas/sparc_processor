module MUX_Register_B (
						output reg [31:0] Register_B,
						
						input [4:0] Register_B_Select,
						
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
		case (Register_B_Select)
			5'b00000:
				begin
				Register_B = R0;
				end
			5'b00001:
				begin
				Register_B = R1;
				end
			5'b00010:
				begin
				Register_B = R2;
				end
			5'b00011:
				begin
				Register_B = R3;
				end
			5'b00100:
				begin
				Register_B = R4;
				end
			5'b00101:
				begin
				Register_B = R5;
				end
			5'b00110:
				begin
				Register_B = R6;
				end
			5'b00111:
				begin
				Register_B = R7;
				end
			5'b01000:
				begin
				Register_B = R8;
				end
			5'b01001:
				begin
				Register_B = R9;
				end
			5'b01010:
				begin
				Register_B = R10;
				end
			5'b01011:
				begin
				Register_B = R11;
				end
			5'b01100:
				begin
				Register_B = R12;
				end
			5'b01101:
				begin
				Register_B = R13;
				end
			5'b01110:
				begin
				Register_B = R14;
				end
			5'b01111:
				begin
				Register_B = R15;
				end
			5'b10000:
				begin
				Register_B = R16;
				end
			5'b10001:
				begin
				Register_B = R17;
				end
			5'b10010:
				begin
				Register_B = R18;
				end
			5'b10011:
				begin
				Register_B = R19;
				end
			5'b10100:
				begin
				Register_B = R20;
				end
			5'b10101:
				begin
				Register_B = R21;
				end
			5'b10110:
				begin
				Register_B = R22;
				end
			5'b10111:
				begin
				Register_B = R23;
				end
			5'b11000:
				begin
				Register_B = R24;
				end
			5'b11001:
				begin
				Register_B = R25;
				end
			5'b11010:
				begin
				Register_B = R26;
				end
			5'b11011:
				begin
				Register_B = R27;
				end
			5'b11100:
				begin
				Register_B = R28;
				end
			5'b11101:
				begin
				Register_B = R29;
				end
			5'b11110:
				begin
				Register_B = R30;
				end
			5'b11111:
				begin
				Register_B = R31;
				end
		endcase
		end
endmodule