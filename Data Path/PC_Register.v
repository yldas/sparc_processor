module PC_Register (
					output reg [31:0] PC,
					input [31:0] PC_In,
					input Load_Enable,
					input Clock
					);
	
	integer LogFile;
	
	initial
		begin
		// Time formatting
		$timeformat(-9, 2, " ns", 0);
		// Error logging
		LogFile = $fopen("D:\\Users\\Misael\\Documents\\Classes\\ICOM4215-001D\\SPARC Microprocessor\\Logs\\Data Path Logs\\PC_log.dat");
		end
		
	always @ (negedge Clock)
		begin
		$fdisplay(LogFile, "%t PC: %d", $time, PC);
		if (Load_Enable)
			begin
			PC = PC_In;
			end
		end
endmodule