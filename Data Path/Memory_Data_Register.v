module Memory_Data_Register (
							output reg [31:0] MD,
							input [31:0] Memory_Data,
							input MDR_Ld,
							input Clock
							);
	always @ (negedge Clock)
		begin
		if (MDR_Ld)
			begin
			MD <= Memory_Data;
			end
		end
endmodule