`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:53:05 07/04/2023 
// Design Name: 
// Module Name:    Main 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Main(
    input clk
    );

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
    wire [15:0] PC;
    wire zero;
    //wire [4:0] imm;
    wire [15:0] extImm;
    //wire [12:0] absjmp;
    wire [15:0] instruction;
	 wire [15:0] WriteData;//for write back
	 wire [15:0] RegOut1;
	 wire [15:0] RegOut2;
	 wire [15:0] AluInput2;
	 wire [15:0] ALUres;
	 wire [15:0] OutMem;
	 
	 //initial begin
		 //PC = 0;
		 //zero = 0;
		 //Branch = 0;
		 //PCSrc = 2'b00;
	 //end

//    always @(posedge clk) begin
        PC instance_pc (
            .clk(clk),
            .oldPC(PC),
            .PCSrc(PCSrc),
            .zero(zero),
            .branch(Branch),
            .ExtBrnImm(extImm),
            .absjmp(instruction[12:0]),
            .Pc(PC)
            );
        InstructionMemory instance_insMemory (
            .pc(PC),
            .ins(instruction)
            );
		  SignExtend instance_signExt (
			   .in(instruction[4:0]), 
			   .out(extImm)
			   );
		  ControlUnit instance_ctrlUnit (
			   .opcode(instruction[15:13]), 
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
		assign WriteData = (MemToReg) ? OutMem : ALUres;
        RegisterFile instance_regFile (
			.clk(clk),
            .select1(instruction[12:9]),
            .select2(instruction[8:5]),
            .select3(instruction[4:1]),
            .RegDst(RegDst),
            .RegWrite(RegWrite),
            .WriteData(WriteData),//ALUres
            .out1(RegOut1),
            .out2(RegOut2)
            );
		  
		assign AluInput2 = (ALUSrc) ? extImm : RegOut2;
		  
		  //if(ALUSrc == 1)
		  //    AluInput2 = extImm;
		  //else
		  //    AluInput2 = RegOut1;
				
		  //always @(instruction) begin
		  //    if(ALUSrc == 1)
			//		AluInput2 = extImm;
			//   else
			//		AluInput2 = RegOut1;
		  //end
		  
		  
		  ALU instance_alu (
			   .data1(RegOut1), 
			   .data2(AluInput2), 
			   .ALUop(ALUop), 
			   .result(ALUres), 
			   .zero(zero)
			   );
		  
		  DataMemory instance_dataMem (
		       .clk(clk),
			   .MemRead(MemRead), 
			   .MemWrite(MemWrite), 
			   .MemtoReg(MemToReg), 
			   .Address(ALUres), 
			   .WriteData(RegOut2), 
			   .outData(OutMem)
			   );
		  
		  
//    end


endmodule
