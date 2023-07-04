`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:03:58 07/04/2023
// Design Name:   RegisterFile
// Module Name:   C:/Users/ASUS/Desktop/University/Semester 4/CA/project/project/16Bit-ISA/ISA/RegisterFile_TB.v
// Project Name:  ISA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegisterFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegisterFile_TB;

	// Inputs
	reg [3:0] select1;
	reg [3:0] select2;
	reg [3:0] select3;
	reg RegDst;
	reg RegWrite;
	reg [15:0] WriteData;

	// Outputs
	wire [15:0] out1;
	wire [15:0] out2;

	// Instantiate the Unit Under Test (UUT)
	RegisterFile uut (
		.select1(select1), 
		.select2(select2), 
		.select3(select3), 
		.RegDst(RegDst), 
		.RegWrite(RegWrite), 
		.WriteData(WriteData), 
		.out1(out1), 
		.out2(out2)
	);

	initial begin
		// Initialize Inputs
		
		#200
		
		select1 = 0;
		select2 = 0;
		select3 = 5;
		RegDst = 1;
		RegWrite = 1;
		WriteData = 16'b0011010110100101;

		// Wait 100 ns for global reset to finish
		#100;
		
		select1 = 5;
		select2 = 0;
		select3 = 0;
		RegDst = 1;
		RegWrite = 0;
		WriteData = 16'b0011010110100101;

		// Wait 100 ns for global reset to finish
		#100;
		
		
		select1 = 0;
		select2 = 5;
		select3 = 0;
		RegDst = 1;
		RegWrite = 0;
		WriteData = 16'b0011010110100101;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Add stimulus here

	end
      
endmodule

