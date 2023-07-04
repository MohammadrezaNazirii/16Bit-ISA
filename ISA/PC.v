`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:40 07/02/2023 
// Design Name: 
// Module Name:    PC 
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
module PC(
    input clk,
    input [15:0] oldPC,
    input PCSrc,
    input zero,
    input branch,
    input [15:0] ExtBrnImm,
    input [12:0] absjmp,
    output reg [15:0] Pc
    );

    always @(posedge clk) begin
        case(PCSrc)
            2'b10:begin //jmp
                Pc[12:0] = absjmp;
                Pc = Pc << 1;
                Pc[15:14] = oldPC[15:14];
            end
            2'b00:begin
                if(zero & branch)
                    Pc = oldPC + 2 + ExtBrnImm;
                else
                    Pc = Pc + 2;
            end
        endcase
    end


endmodule
