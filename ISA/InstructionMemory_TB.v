`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:36:41 07/03/2023
// Design Name:   InstructionMemory
// Module Name:   C:/Users/ASUS/Desktop/University/Semester 4/CA/project/project/16Bit-ISA/ISA/InstructionMemory_TB.v
// Project Name:  ISA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: InstructionMemory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module InstructionMemory_TB;

	// Inputs
	reg [15:0] pc;

	// Outputs
	wire [15:0] ins;

	// Instantiate the Unit Under Test (UUT)
	InstructionMemory uut (
		.pc(pc), 
		.ins(ins)
	);

	initial begin
		// Initialize Inputs
		#100
		pc = 0;

		// Wait 100 ns for global reset to finish
		#100;

		pc = 1;

      // Wait 100 ns for global reset to finish
      #100;
		
		pc = 10;

      // Wait 100 ns for global reset to finish
      #100;
		
		pc = 11;

      // Wait 100 ns for global reset to finish
      #100;
        
		// Add stimulus here

	end
      
endmodule

