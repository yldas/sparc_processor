module Memory_Address_Register (
							output reg [31:0] MA,
							input [31:0] Memory_Address,
							input MAR_Ld,
							input Clock
							);
	integer LogFile;
	
	initial
		begin
		// Time formatting
		$timeformat(-9, 2, " ns", 0);
		// Error logging
		LogFile = $fopen("D:\\Users\\Misael\\Documents\\Classes\\ICOM4215-001D\\SPARC Microprocessor\\Logs\\Control Unit Logs\\Memory_Address_Register_log.dat");
		end
	always @ (negedge Clock)
		begin
		if (MAR_Ld)
			begin
			$fdisplay(LogFile, "%t MAR: %d", $time, Memory_Address);
			MA <= Memory_Address;
			end
		end
endmodule