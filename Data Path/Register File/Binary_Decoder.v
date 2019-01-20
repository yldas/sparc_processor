module Binary_Decoder (
						output reg [31:0] Register_Enable,
						input [4:0] Register_Select,
						input RF_Ld 
						);
	initial
		begin
		Register_Enable = 32'h00000000;
		end
		
	always @*
		begin
		if (RF_Ld)
			begin
			//$display("%t Binary_Decoder -- Register_Select: %d", $time, Register_Select);
			case (Register_Select)
				5'b00000:	// R0
					begin
					Register_Enable = 32'h00000001;
					end
				5'b00001:	// R1
					begin
					Register_Enable = 32'h00000002;
					end
				5'b00010:	// R2
					begin
					Register_Enable = 32'h00000004;
					end
				5'b00011:	// R3
					begin
					Register_Enable = 32'h00000008;
					end
				5'b00100:	// R4
					begin
					Register_Enable = 32'h00000010;
					end
				5'b00101:	// R5
					begin
					Register_Enable = 32'h00000020;
					end
				5'b00110:	// R6
					begin
					Register_Enable = 32'h00000040;
					end
				5'b00111:	// R7
					begin
					Register_Enable = 32'h00000080;
					end
				5'b01000:	// R8
					begin
					Register_Enable = 32'h00000100;
					end
				5'b01001:	// R9
					begin
					Register_Enable = 32'h00000200;
					end
				5'b01010:	// R10
					begin
					Register_Enable = 32'h00000400;
					end
				5'b01011:	// R11
					begin
					Register_Enable = 32'h00000800;
					end
				5'b01100:	// R12
					begin
					Register_Enable = 32'h00001000;
					end
				5'b01101:	// R13
					begin
					Register_Enable = 32'h00002000;
					end
				5'b01110:	// R14
					begin
					Register_Enable = 32'h00004000;
					end
				5'b01111:	// R15
					begin
					Register_Enable = 32'h00008000;
					end
				5'b10000:	// R16
					begin
					Register_Enable = 32'h00010000;
					end
				5'b10001:	// R17
					begin
					Register_Enable = 32'h00020000;
					end
				5'b10010:	// R18
					begin
					Register_Enable = 32'h00040000;
					end
				5'b10011:	// R19
					begin
					Register_Enable = 32'h00080000;
					end
				5'b10100:	// R20
					begin
					Register_Enable = 32'h00100000;
					end
				5'b10101:	// R21
					begin
					Register_Enable = 32'h00200000;
					end
				5'b10110:	// R22
					begin
					Register_Enable = 32'h00400000;
					end
				5'b10111:	// R23
					begin
					Register_Enable = 32'h00800000;
					end
				5'b11000:	// R24
					begin
					Register_Enable = 32'h01000000;
					end
				5'b11001:	// R25
					begin
					Register_Enable = 32'h02000000;
					end
				5'b11010:	// R26
					begin
					Register_Enable = 32'h04000000;
					end
				5'b11011:	// R27
					begin
					Register_Enable = 32'h08000000;
					end
				5'b11100:	// R28
					begin
					Register_Enable = 32'h10000000;
					end
				5'b11101:	// R29
					begin
					Register_Enable = 32'h20000000;
					end
				5'b11110:	// R30
					begin
					Register_Enable = 32'h40000000;
					end
				5'b11111:	// R31
					begin
					Register_Enable = 32'h80000000;
					end
			endcase
			end
		else
			begin
			Register_Enable = 32'h00000000;
			end
		end
endmodule		