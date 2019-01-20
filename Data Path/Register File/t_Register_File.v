module t_Register_File;


reg [31:0] Data_In;
reg [4:0] Destination_Register;
reg [4:0] Register_A_Select;
reg [4:0] Register_B_Select;
reg [4:0] Current_Window_Pointer;
reg Load_Enable;
reg Clock;

wire [31:0] Register_A;
wire [31:0] Register_B;

Register_File RF (
					
					Register_A,
					Register_B,
					Data_In,
					Destination_Register,
					Register_A_Select,
					Register_B_Select,
					Current_Window_Pointer,
					Load_Enable,
					Clock
					);
			
	initial
		begin
		Data_In <= 32'h12345678;
		Destination_Register <= 5'b01010;
		Register_A_Select <= 5'b00000;
		Register_B_Select <= 5'b00000;
		Current_Window_Pointer <= 5'b00011;
		Load_Enable <= 1'b1;
		Clock <= 0;
	
		#100
		Load_Enable <= 1'b0;
		Register_A_Select <= 5'b01010;
		Register_B_Select <= 5'b01010;
		
		#100
		Current_Window_Pointer <= 5'b00000;
		
		#100
		Current_Window_Pointer <= 5'b00011;
		end
		
	always
		begin
		#10 Clock = ~Clock;
		end
		
	initial #500 $finish;
	
endmodule