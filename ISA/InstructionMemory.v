`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:01:43 07/02/2023 
// Design Name: 
// Module Name:    InstructionMemory 
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
module InstructionMemory(
    input [15:0] pc,
    output reg [15:0] ins
    );

    reg [7:0] Memory [0:511];
    reg [15:0] temp;
    integer file;
    integer j;

    initial begin
        file = $fopen("instructions.txt", "r");
        for(j = 0;!$feof(file);j = j + 2)begin
            $fscanf(file, "%b", temp);
            Memory[j] = temp[15:8];
            Memory[j+1] = temp[7:0];
            //$display("%d. %b %b", j+1, Memory[j], Memory[j+1]);
        end
    end

    always @(*) begin
        ins[15:8] = Memory[2*pc];
        ins[7:0] = Memory[2*pc+1];
    end

endmodule
