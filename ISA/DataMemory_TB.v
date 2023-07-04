`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:44:17 07/04/2023
// Design Name:   DataMemory
// Module Name:   C:/Users/ASUS/Desktop/University/Semester 4/CA/project/project/16Bit-ISA/ISA/DataMemory_TB.v
// Project Name:  ISA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataMemory_TB;

	// Inputs
	reg MemRead;
	reg MemWrite;
	reg MemtoReg;
	reg [15:0] Address;
	reg [15:0] WriteData;

	// Outputs
	wire [15:0] outData;

	// Instantiate the Unit Under Test (UUT)
	DataMemory uut (
		.MemRead(MemRead), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.Address(Address), 
		.WriteData(WriteData), 
		.outData(outData)
	);

	initial begin
		// Initialize Inputs
		MemRead = 0;
		MemWrite = 1;
		MemtoReg = 0;
		Address = 20;
		WriteData = 10'b1010101111;

		// Wait 100 ns for global reset to finish
		#100;
		
		MemRead = 1;
		MemWrite = 0;
		MemtoReg = 1;
		Address = 20;
		WriteData = 10'b1010101111;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

