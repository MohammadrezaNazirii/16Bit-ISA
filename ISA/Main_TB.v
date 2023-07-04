`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:17:12 07/04/2023
// Design Name:   Main
// Module Name:   C:/Users/ASUS/Desktop/University/Semester 4/CA/project/project/16Bit-ISA/ISA/Main_TB.v
// Project Name:  ISA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Main
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Main_TB;

	// Inputs
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	Main uut (
		.clk(clk)
	);
	
	always #200 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		#20;

		// Wait 100 ns for global reset to finish
		//#100;
        
		// Add stimulus here

	end
      
endmodule

