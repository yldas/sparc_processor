module RAM512x8 (
				output reg [31:0] DataOut,
				output reg MOC,
				input MOV,
				input ReadWrite,
				input [1:0] SIZE,
				input SignedUnsigned,
				input [31:0] Address,
				input [31:0] DataIn
				);
	
	// Internal field
	reg [7:0] Mem[0:511];	// 512 8-bit locations
	integer LogFile;
	
	initial
		begin
		// Time formatting
		$timeformat(-9, 2, " ns", 0);
		// Error logging
		LogFile = $fopen("D:\\Users\\Misael\\Documents\\Classes\\ICOM4215-001D\\SPARC Microprocessor\\Logs\\Data Path Logs\\RAM512x8_log.dat");
		MOC = 1'b0;
		end
		
	always @*
		begin
		if (MOV)
			begin
			if (Address > 9'b111111111)
				begin
				$fdisplay(LogFile, "%t Invalid Memory Address: %h", $time, Address);
				end
			else
				begin
				MOC = 1'b0;
				if (SignedUnsigned == 1'b0)
					begin
					case (SIZE)
						2'b00:	// Byte
							begin
							if (ReadWrite == 1)
								begin
								$fdisplay(LogFile, "%t Reading byte", $time);
								DataOut = {24'd0, Mem[Address]};	// Read byte; zero out 24 most significant bits
								end
							else
								begin
								$fdisplay(LogFile, "%t Writing byte", $time);
								//$display("%t Storing Byte: %d @ Address: %d", $time, DataIn[7:0], Address);
								Mem[Address] = DataIn[7:0];			// Store least significant byte
								end
							end
						2'b01:	// Half-Word
							begin
							if (ReadWrite == 1)
								begin
								$fdisplay(LogFile, "%t Reading half-word", $time);
								DataOut = {16'd0, Mem[Address], Mem[Address + 1]};	// Read word in big-endian format; zero out 16 most significant bits
								end
							else
								begin
								$fdisplay(LogFile, "%t Writing half-word", $time);
								Mem[Address] <= DataIn[15:8];		// Store most significant byte in half-word in low-address
								Mem[Address + 1] <= DataIn[7:0];	// Store least significant byte in half-word high-address
								end
							end
						2'b10:	// Word
							begin
							if (ReadWrite == 1)
								begin
								$fdisplay(LogFile, "%t Reading word", $time);
								DataOut = {Mem[Address], Mem[Address + 1], Mem[Address + 2], Mem[Address + 3]};		// Read word in big-endian format
								end
							else
								begin
								$fdisplay(LogFile, "%t Writing word", $time);
								Mem[Address] <= DataIn[31:24];			// Store most significant byte in lowest address
								Mem[Address + 1] <= DataIn[23:16];		
								Mem[Address + 2] <= DataIn[15:8];	
								Mem[Address + 3] <= DataIn[7:0];		// Store most significant byte in highest address
								end
							end
						2'b11:	// Double-Word
							begin
							if (ReadWrite == 1)
								begin
								$fdisplay(LogFile, "%t Reading double-word", $time);
								DataOut = {Mem[Address], Mem[Address + 1], Mem[Address + 2], Mem[Address + 3]};				// Read most significant word in big-endian format
								#5 DataOut = {Mem[Address + 4], Mem[Address + 5], Mem[Address + 6], Mem[Address + 7]};		// Read least significant word in big-endian format
								end
							else
								begin
								$fdisplay(LogFile, "%t Writing double-word", $time);
								Mem[Address] <= DataIn[31:24];			// Store most significant word in lowest address
								Mem[Address + 1] <= DataIn[23:16];		
								Mem[Address + 2] <= DataIn[15:8];	
								Mem[Address + 3] <= DataIn[7:0];		
								#5 	Mem[Address + 4] <= DataIn[31:24];			// Store least significant word in lowest address
									Mem[Address + 5] <= DataIn[23:16];		
									Mem[Address + 6] <= DataIn[15:8];	
									Mem[Address + 7] <= DataIn[7:0];		
								end
							end
					endcase
					end
				else
					begin
					case (SIZE)
					2'b00:	// Byte
						begin
						if (ReadWrite == 1)
							begin
							$fdisplay(LogFile, "%t Reading byte", $time);
							DataOut = {{24{Mem[Address][7]}}, Mem[Address]};	// Read byte; sign-extend
							end
						else
							begin
							$fdisplay(LogFile, "%t Writing byte", $time);
							Mem[Address] = DataIn[7:0];			// Store least significant byte
							end
						end
					2'b01:	// Half-Word
						begin
						if (ReadWrite == 1)
							begin
							$fdisplay(LogFile, "%t Reading half-word", $time);
							DataOut = {{16{Mem[Address][15]}}, Mem[Address + 1]};	// Read half-word in big-endian format; sign-extend
							end
						else
							begin
							$fdisplay(LogFile, "%t Writing half-word", $time);
							Mem[Address] <= DataIn[15:8];		// Store most significant byte in half-word in low-address
							Mem[Address + 1] <= DataIn[7:0];	// Store least significant byte in half-word high-address
							end
						end
					2'b10:	// Word
						begin
						if (ReadWrite == 1)
							begin
							$fdisplay(LogFile, "%t Reading word", $time);
							DataOut = {Mem[Address], Mem[Address + 1], Mem[Address + 2], Mem[Address + 3]};		// Read word in big-endian format
							end
						else
							begin
							$fdisplay(LogFile, "%t Writing word", $time);
							//$display("Storing %b in %d", DataIn[31:24], Address);
							Mem[Address] <= DataIn[31:24];			// Store most significant byte in lowest address
							//$display("Storing %b in %d", DataIn[23:16], Address + 1);
							Mem[Address + 1] <= DataIn[23:16];		
							//$display("Storing %b in %d", DataIn[15:8], Address + 2);
							Mem[Address + 2] <= DataIn[15:8];	
							//$display("Storing %b in %d", DataIn[7:0], Address + 3);
							Mem[Address + 3] <= DataIn[7:0];		// Store most significant byte in highest address
							end
						end
					2'b11:	// Double-Word
						begin
						if (ReadWrite == 1)
							begin
							$fdisplay(LogFile, "%t Reading double-word", $time);
							DataOut = {Mem[Address], Mem[Address + 1], Mem[Address + 2], Mem[Address + 3]};				// Read most significant word in big-endian format
							#5 DataOut = {Mem[Address + 4], Mem[Address + 5], Mem[Address + 6], Mem[Address + 7]};		// Read least significant word in big-endian format
							end
						else
							begin
							$fdisplay(LogFile, "%t Writing double-word", $time);
							Mem[Address] <= DataIn[31:24];			// Store most significant word in lowest address
							Mem[Address + 1] <= DataIn[23:16];		
							Mem[Address + 2] <= DataIn[15:8];	
							Mem[Address + 3] <= DataIn[7:0];		
							#5 	Mem[Address + 4] <= DataIn[31:24];			// Store least significant word in lowest address
								Mem[Address + 5] <= DataIn[23:16];		
								Mem[Address + 6] <= DataIn[15:8];	
								Mem[Address + 7] <= DataIn[7:0];		
							end
						end
				endcase
				end
				MOC = 1'b1;
				end
			end
		end
endmodule