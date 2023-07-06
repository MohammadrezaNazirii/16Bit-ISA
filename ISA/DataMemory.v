`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:12:29 07/04/2023 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(
    input clk,
    input MemRead,
    input MemWrite,
    input MemtoReg,
    input [15:0] Address,
    input [15:0] WriteData,
    output reg [15:0] outData
    );
	

    reg [7:0] Memory [0:511];
	 reg [15:0] temp [0:255];
	 integer j;
	 
	 initial begin  
         $readmemb("memory.txt", temp);
	      for (j=0 ; j<512;j=j+1)begin 
		       Memory[2*j] = temp[j][15:8];
             Memory[2*j+1] = temp[j][7:0];
	      end
     end

    always @(MemRead, MemWrite, MemtoReg, Address, WriteData) begin
        if(MemRead & !MemWrite)begin
            outData[15:8] = Memory[2*Address];
            outData[7:0] = Memory[2*Address+1];
        end
    end

    always @(negedge clk)begin
        if(!MemRead & MemWrite)begin
            Memory[2*Address] = WriteData[15:8];
            Memory[2*Address+1] = WriteData[7:0];
        end
    end


endmodule
