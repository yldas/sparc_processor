module Control_Unit_Test;
	reg Clk;
	reg [31:0] IR;
	reg Memory_Operation_Complete;
	reg Cond;
	reg Reset;
	reg [1:0] test;
	
	wire RF_Ld;
	wire FR_Ld;
	wire IR_Ld;
	wire MAR_Ld;
	wire MDR_Ld;
	wire PSR_Ld;
	wire nPC_Ld;
	wire PC_Ld;
	wire TBR_Ld;
	wire WIM_Ld;
	
	wire [1:0] MUX_A;
	wire [1:0] MUX_B;
	wire [1:0] MUX_OP;
	wire [1:0] MUX_RFA;
	wire [1:0] MUX_RFB;
	wire [1:0] MUX_RFDest;
	wire [1:0] MUX_nPC;
	wire [1:0] MUX_PC;
	wire MUX_Add4;
	wire [1:0] MUX_MDR;
	
	wire RW;
	wire MOC;
	wire MOV;
	
	wire [5:0] OP;
	wire C_In;
	
	Control_Unit control_unit(
					RF_Ld,
					FR_Ld,
					IR_Ld,
					MAR_Ld,
					MDR_Ld,
					PSR_Ld,
					nPC_Ld,
					PC_Ld,
					TBR_Ld,
					WIM_Ld,
					
					MUX_A,
					MUX_B,
					MUX_OP,
					MUX_RFA,
					MUX_RFB,
					MUX_RFDest,
					MUX_nPC,
					MUX_PC,
					MUX_Add4,
					MUX_MDR,
						
					RW,
					MOV,
						
					OP,
					C_In,
						
					IR,
					Memory_Operation_Complete,
					Cond,
					Reset,
					Clk,
					test //debugging
					);
	initial 
	begin
	//Pulse 0
	#10 Clk = 1'b1;
	#10 Clk = 1'b0;
	
	//Pulse 1
	#10 Clk = 1'b1;
	#10 Clk = 1'b0;
	
	//Pulse 2
	#10 Clk = 1'b1;
	#10 Clk = 1'b0;

	//Pulse 3
	#10 Clk = 1'b1;
	#10 Clk = 1'b0;
	
	//Pulse 4
	#10 Clk = 1'b1;
	#10 Clk = 1'b0;
	//$monitor("Reach!");
	
	IR = 32'b10100010000000010001001011010000;
	//Pulse 5
	#10 Clk = 1'b1;
	#10 Clk = 1'b0;
	
	//Pulse 6
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 7
	#10 Clk = 1'b1;
	#10 Clk = 0;

	//Pulse 8
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 9
	#10 Clk = 1'b1;
	#10 Clk = 0;
	//$monitor("Reach2!");
	
	IR = 32'b11100010000001001001100101101000;
	//Pulse 10
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 11
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 12
	#10 Clk = 1'b1;
	#10 Clk = 0;

	//Pulse 13
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 14
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 15
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 16
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 17
	#10 Clk = 1'b1;
	#10 Clk = 0;
	//$monitor("Reach3!");
	
	IR = 32'b11100010001000010000100101101000;
	//Pulse 18
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 19
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 20
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 21
	#10 Clk = 1'b1;
	#10 Clk = 0;

	//Pulse 22
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 23
	#10 Clk = 1'b1;
	#10 Clk = 0;

	//Pulse 24
	#10 Clk = 1'b1;
	#10 Clk = 0;
	
	//Pulse 25
	#10 Clk = 1'b1;
	#10 Clk = 0;	
	end
	
	/*
	always @ (negedge Clk)
	begin 
	#1
	$display("The current state is: ");
	$display("");
	$display("RF_Ld:    %b", RF_Ld);
	$display("FR_Ld:    %b", FR_Ld );
	$display("IR_Ld:    %b", IR_Ld );
	$display("MAR_Ld:   %b", MAR_Ld);
	$display("MDR_Ld:   %b", MDR_Ld);
	$display("PSR_Lds:  %b", PSR_Ld);
	$display("nPC_Ld:   %b", nPC_Ld);
	$display("TBW_Ld:   %b", TBR_Ld);
	$display("WIM_Ld:   %b", WIM_Ld);
	$display("MUX_A:    %b", MUX_A);
	$display("MUX_B:    %b", MUX_B);
	$display("MUX_OP:   %b", MUX_OP);
	$display("MUX_RFA:  %b", MUX_RFA);
	$display("MUX_RFB:  %b", MUX_RFB );
	$display("MUX_RFDest: %b", MUX_RFDest);
	$display("MUX_nPC: %b", MUX_nPC);
	$display("MUX_Add4: %b", MUX_Add4);
	$display("MUX_MDR: %b", MUX_MDR);
	$display("RW: %b", RW);
	$display("MOC: %b", MOC);
	$display("MOV: %b", MOV);
	$display("OP: %b", OP);
	$display("C_In: %b", C_In);
	$display("");
	$display("The next state is: ");
	end
	//always @ (posedge Clk)
	//$display("time: %d", $time);
	*/
	
	initial #700 $finish;
	
endmodule