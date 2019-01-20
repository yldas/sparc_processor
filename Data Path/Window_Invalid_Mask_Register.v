module Window_Invalid_Mask_Register (
							output reg [31:0] WIM,
							input [31:0] WIM_In,
							input WIM_Ld,
							input Clock
							);
	
	/* Initial reset conditions */
	initial
		begin
		WIM <= 32'd0;
		end
	
	always @ (negedge Clock)
		begin
		if (WIM_Ld)
			begin
			WIM <= WIM_In;
			end
		end
endmodule