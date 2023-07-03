`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:42:52 07/03/2023
// Design Name:   ControlUnit
// Module Name:   C:/Users/ASUS/Desktop/University/Semester 4/CA/project/project/16Bit-ISA/ISA/ControlUnit_TB.v
// Project Name:  ISA
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ControlUnit_TB;

	// Inputs
	reg [2:0] opcode;

	// Outputs
	wire RegDst;
	wire Branch;
	wire MemRead;
	wire MemToReg;
	wire [1:0] ALUop;
	wire MemWrite;
	wire ALUSrc;
	wire RegWrite;
	wire [1:0] PCSrc;
	wire ExtSel;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.opcode(opcode), 
		.RegDst(RegDst), 
		.Branch(Branch), 
		.MemRead(MemRead), 
		.MemToReg(MemToReg), 
		.ALUop(ALUop), 
		.MemWrite(MemWrite), 
		.ALUSrc(ALUSrc), 
		.RegWrite(RegWrite), 
		.PCSrc(PCSrc), 
		.ExtSel(ExtSel)
	);

    integer j;

	initial begin

		for(j=0;j<8;j = j+1)begin
		    opcode = j;
		    #100;
			 $display("Opcode=%d%d%d => %d %d %d %d %d%d %d %d %d %d%d %d", opcode[2], opcode[1], opcode[0], RegDst, Branch, MemRead, MemToReg, ALUop[1], ALUop[0], MemWrite, ALUSrc, RegWrite, PCSrc[1], PCSrc[0], ExtSel);
		end

	end
      
endmodule

