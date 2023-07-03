`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:08 07/03/2023 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(
    input [2:0]opcode,
    output reg RegDst,
    output reg Branch,
    output reg MemRead,
    output reg MemToReg,
    output reg [1:0] ALUop,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg [1:0] PCSrc,
    output reg ExtSel
    );

    parameter ADDop = 3'b000;
    parameter ADDIop = 3'b001;
    parameter SHIFTop = 3'b010;
    parameter ROTATEop = 3'b011;
    parameter BEGop = 3'b100;
    parameter SWop = 3'b101;
    parameter LWop = 3'b110;
    parameter JMPop = 3'b111;

    always @ (opcode) begin
        case(opcode)
            ADDop:begin
                RegDst = 1;
                RegWrite = 1;
                ALUSrc = 0;
                ALUop = 2'b00;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                Branch = 0;
                PCSrc = 2'b00;//PC+4
            end
            ADDIop:begin
                RegDst = 1;
                RegWrite = 1;
                ALUSrc = 1;
                ExtSel = 1;
                ALUop = 2'b00;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                Branch = 0;
                PCSrc = 2'b00;//PC+4
            end
            SHIFTop:begin
                RegDst = 1;
                RegWrite = 1;
                ALUSrc = 1;
                ExtSel = 0;
                ALUop = 2'b01;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                Branch = 0;
                PCSrc = 2'b00;//PC+4
            end
            ROTATEop:begin
                RegDst = 1;
                RegWrite = 1;
                ALUSrc = 1;
                ExtSel = 0;
                ALUop = 2'b10;
                MemWrite = 0;
                MemRead = 0;
                MemToReg = 0;
                Branch = 0;
                PCSrc = 2'b00;//PC+4
            end
            BEGop:begin
                RegWrite = 0;
                ALUSrc = 0;
                MemWrite = 0;
                MemRead = 0;
                PCSrc = 2'b00;//PC+4 // age zero shod to alu ba meghdar branch jam mikonim    yaani yeki az vorodi haye ALU meghdar branch hast  // age zero shod bayad to blocki ke zaero shode sign extend konim va ba meghdare PC jam konim
                ALUop = 2'b11;//zero check
                Branch = 1;
            end
            SWop:begin
                RegWrite = 0;
                ExtSel = 0;
                ALUSrc = 1;
                MemWrite = 1;
                MemRead = 0;
                PCSrc = 2'b00;//PC+4
                ALUop = 2'b00;//+
            end
            LWop:begin
                RegDst = 0;
                RegWrite = 1;
                ExtSel = 0;
                ALUSrc = 1;
                MemWrite = 0;
                MemRead = 1;
                MemToReg = 1;
                PCSrc = 2'b00;//PC+4
                ALUop = 2'b00;//+
            end
            JMPop:begin
                RegWrite = 0;
                MemWrite = 0;
                MemRead = 0;
                PCSrc = 2'b10;//jump abs
            end
        endcase 
    end
endmodule
