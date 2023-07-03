`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:44:35 07/03/2023
// Design Name:   ALU
// Module Name:   C:/Users/ASUS/Desktop/University/Semester 4/CA/project/project/16Bit-ISA/ISA/ALU_TB.v
// Project Name:  ISA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_TB;

	// Inputs
	reg [15:0] data1;
	reg [15:0] data2;
	reg [1:0] ALUop;

	// Outputs
	wire [15:0] result;
	wire zero;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (
		.data1(data1), 
		.data2(data2), 
		.ALUop(ALUop), 
		.result(result), 
		.zero(zero)
	);

	initial begin
		// Initialize Inputs
		data1 = 16'b1110101011110101;
		data2 = 5'b00111;
		ALUop = 2'b01;
		#10;
		$display("result = %b    |    zero = %b", result, zero);

		// Wait 100 ns for global reset to finish
		#100;
		
		data1 = 16'b1110101011110101;
		data2 = 5'b00110;
		ALUop = 2'b01;
		#10;
		$display("result = %b    |    zero = %b", result, zero);

		// Wait 100 ns for global reset to finish
		#100;
		
		data1 = 16'b1110101011110101;
		data2 = 5'b00101;
		ALUop = 2'b10;
		#10;
		$display("result = %b    |    zero = %b", result, zero);

		// Wait 100 ns for global reset to finish
		#100;
		
		data1 = 16'b1110101011110101;
		data2 = 5'b00100;
		ALUop = 2'b10;
		#10;
		$display("result = %b    |    zero = %b", result, zero);

		// Wait 100 ns for global reset to finish
		#100;
		
		data1 = 10;
		data2 = -2;
		ALUop = 2'b00;
		#10;
		$display("result = %b    |    zero = %b", result, zero);

		// Wait 100 ns for global reset to finish
		#100;
		
		data1 = -10;
		data2 = 2;
		ALUop = 2'b00;
		#10;
		$display("result = %b    |    zero = %b", result, zero);

		// Wait 100 ns for global reset to finish
		#100;
		
		data1 = 10;
		data2 = 10;
		ALUop = 2'b11;
		#10;
		$display("result = %b    |    zero = %b", result, zero);

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

