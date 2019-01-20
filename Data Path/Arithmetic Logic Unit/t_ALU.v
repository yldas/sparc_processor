module t_ALU;
reg [31:0] Operand1;
reg [31:0] Operand2;
reg C_In;
reg [5:0] Opcode;
wire [31:0] Result;
wire Condition_N;
wire Condition_Z;
wire Condition_V;
wire Condition_C;

ALU ALU1 (
			Result,
			Condition_N, 
			Condition_Z, 
			Condition_V, 
			Condition_C,
			Operand1,
			Operand2,
			C_In,
			Opcode
			);
			
	initial
		begin
		// LOGICAL INSTRUCTIONS TESTS
		/*
		Operand1 = 32'hFFFFFFFF;
		Operand2 = 32'hFFFFFFFF;
		C_In = 1'b0;
		Opcode = 6'b000001;
		$strobe("ADD - Expected: ffffffff; Result: %h\n", Result);
		
		#10
		Operand1 = 32'hFFFFFFFF;
		Operand2 = 32'hFFFFFFFF;
		C_In = 1'b0;
		Opcode = 6'b010001;
		$strobe("ADDcc - Expected: ffffffff; Result: %h", Result);
		$strobe("Condition Codes - Expected: 1000; Result: %b\n", {Condition_N, Condition_Z, Condition_V, Condition_C});
		
		#10
		Operand1 = 32'hFFFFFFFF;
		Operand2 = 32'hFFFFFFFF;
		C_In = 1'b0;
		Opcode = 6'b000101;
		$strobe("ADDN - Expected: 00000000; Result: %h\n", Result);
		
		#10
		Operand1 = 32'hFFFFAFFF;
		Operand2 = 32'hFFFF3FFF;
		C_In = 1'b0;
		Opcode = 6'b010101;
		$strobe("ADDNcc - Expected: 00008000; Result: %h", Result);
		$strobe("Condition Codes - Expected: 0000; Result: %b\n", {Condition_N, Condition_Z, Condition_V, Condition_C});
		
		#10
		Operand1 = 32'hFFFFFFF5;
		Operand2 = 32'hFFFFFFF3;
		C_In = 1'b0;
		Opcode = 6'b000010;
		$strobe("OR - Expected: fffffff7; Result: %h\n", Result);
		
		#10
		Operand1 = 32'hFFFFFFF5;
		Operand2 = 32'hFFFFFFF3;
		C_In = 1'b0;
		Opcode = 6'b010010;
		$strobe("ORcc - Expected: fffffff7; Result: %h", Result);
		$strobe("Condition Codes - Expected: 1000; Result: %b\n", {Condition_N, Condition_Z, Condition_V, Condition_C});
		
		#10
		Operand1 = 32'h51A135BB;
		Operand2 = 32'h3AA301B3;
		C_In = 1'b0;
		Opcode = 6'b000110;
		$strobe("ORN - Expected: d5fdffff; Result: %h\n", Result);
	
		#10
		Operand1 = 32'h51A135BB;
		Operand2 = 32'hFFFF3FFF;
		C_In = 1'b0;
		Opcode = 6'b010110;
		$strobe("ORNcc - Expected: 51a1f5bb; Result: %h", Result);
		$strobe("Condition Codes - Expected: 0000; Result: %b\n", {Condition_N, Condition_Z, Condition_V, Condition_C});
		
		#10
		Operand1 = 32'hAAAA0B13;
		Operand2 = 32'h03441AB0;
		C_In = 1'b0;
		Opcode = 6'b000011;
		$strobe("XOR - Expected: a9ee11a3; Result: %h\n", Result);
		
		#10
		Operand1 = 32'hAAAA0B13;
		Operand2 = 32'h03441AB0;
		C_In = 1'b0;
		Opcode = 6'b010011;
		$strobe("XORcc - Expected: a9ee11a3; Result: %h", Result);
		$strobe("Condition Codes - Expected: 1000; Result: %b\n", {Condition_N, Condition_Z, Condition_V, Condition_C});

		#10
		Operand1 = 32'hFFFFFFFF;
		Operand2 = 32'h00000000;
		C_In = 1'b0;
		Opcode = 6'b000111;
		$strobe("XORN - Expected: 00000000; Result: %h\n", Result);
		
		#10
		Operand1 = 32'hFFFFFFFF;
		Operand2 = 32'h00000000;
		C_In = 1'b0;
		Opcode = 6'b010111;
		$strobe("XORNcc - Expected: 00000000; Result: %h", Result);
		$strobe("Condition Codes - Expected: 0100; Result: %b\n", {Condition_N, Condition_Z, Condition_V, Condition_C}); 
		
		// SHIFT INSTRUCTIONS TESTS
		#10
		Operand1 = 32'h0000000F;
		Operand2 = 32'h00000004;
		C_In = 1'b0;
		Opcode = 6'b100101;
		$strobe("SLL - Expected: 000000f0; Result: %h\n", Result);
		
		#10
		Operand1 = 32'hF0000000;
		Operand2 = 32'h00000004;
		C_In = 1'b0;
		Opcode = 6'b100110;
		$strobe("SRL - Expected: 0f000000; Result: %h\n", Result);
		
		#10
		Operand1 = 32'hF0000000;
		Operand2 = 32'h00000004;
		C_In = 1'b0;
		Opcode = 6'b100111;
		$strobe("SRA - Expected: ff000000; Result: %h\n", Result);
		
		// ADD INSTRUCTIONS TESTS
		#10
		Operand1 = 32'h0000000F;
		Operand2 = 32'h00000004;
		C_In = 1'b0;
		Opcode = 6'b000000;
		$strobe("ADD - Expected: 00000013; Result: %h\n", Result);
		*/
		#10
		Operand1 = 32'h8000000F;
		Operand2 = 32'h80000004;
		C_In = 1'b0;
		Opcode = 6'b100111;
		$strobe("ADDcc - Expected: 00000013; Result: %h", Result);
		$strobe("Condition Codes - Expected: 0000; Result: %b\n", {Condition_N, Condition_Z, Condition_V, Condition_C}); 
		/*
		#10
		Operand1 = 32'h00000001;
		Operand2 = 32'h00000001;
		C_In = 1'b1;
		Opcode = 6'b001000;
		$strobe("ADDX - Expected: 00000003; Result: %h\n", Result);
		
		#10
		Operand1 = 32'h7FFFFFFF;
		Operand2 = 32'h00000001;
		C_In = 1'b1;
		Opcode = 6'b011000;
		$strobe("ADDXcc - Expected: 80000001; Result: %h", Result);
		$strobe("Condition Codes - Expected: 1010; Result: %b\n", {Condition_N, Condition_Z, Condition_V, Condition_C}); 
	
		// SUBTRACT INSTRUCTIONS TESTS
		#10
		Operand1 = 32'h00000000;
		Operand2 = 32'h00004002;
		C_In = 1'b0;
		Opcode = 6'b000100;
		$strobe("SUB - Expected: ffffbffe; Result: %h\n", Result);
		
		#10
		Operand1 = 32'h00000000;
		Operand2 = 32'h00004004;
		C_In = 1'b0;
		Opcode = 6'b010100;
		$strobe("SUBcc - Expected: ffffbffc; Result: %h", Result);
		$strobe("Condition Codes - Expected: 1001; Result: %b\n", {Condition_N, Condition_Z, Condition_V, Condition_C}); 
		
		#10
		Operand1 = 32'h00000003;
		Operand2 = 32'h00000002;
		C_In = 1'b1;
		Opcode = 6'b001100;
		$strobe("SUBX - Expected: 00000000; Result: %h\n", Result);
		
		#10
		Operand1 = 32'h00000003;
		Operand2 = 32'h00000002;
		C_In = 1'b1;
		Opcode = 6'b011100;
		$strobe("SUBXcc - Expected: 00000000; Result: %h", Result);
		$strobe("Condition Codes - Expected: 0100; Result: %b\n", {Condition_N, Condition_Z, Condition_V, Condition_C}); 
		*/
		end
		
		initial #300 $finish;
endmodule