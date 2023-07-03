`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:56:11 07/03/2023
// Design Name:   SignExtend
// Module Name:   C:/Users/ASUS/Desktop/University/Semester 4/CA/project/project/16Bit-ISA/ISA/SignExtend_TB.v
// Project Name:  ISA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignExtend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SignExtend_TB;

	// Inputs
	reg [4:0] in;

	// Outputs
	wire [15:0] out;

	// Instantiate the Unit Under Test (UUT)
	SignExtend uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 5'b11000;

		// Wait 100 ns for global reset to finish
		#100;
		
		
		in = 5'b01000;

		// Wait 100 ns for global reset to finish
		#100;
        

		// Add stimulus here

	end
      
endmodule

