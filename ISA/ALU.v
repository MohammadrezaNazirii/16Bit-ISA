`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:19:51 07/03/2023 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [15:0] data1,
    input [15:0] data2,
    input [1:0] ALUop,
    output reg [15:0] result,
    output reg zero
    );

    parameter ADD = 2'b00;
    parameter SHIFT = 2'b01;
    parameter ROTATE = 2'b10;
    parameter ZERO = 2'b11;


    always @(*) begin:Alu
		  integer i;
        case(ALUop)
            ADD:begin
                result = data1 + data2;
            end
            SHIFT:begin
                result = data1;
                if(data2[0] == 1)
                    result = result << data2[4:1];
                else
                    result = result >> data2[4:1];
            end
            ROTATE:begin
                result = data1;
                if(data2[0] == 1)
                    for(i=0;i<data2[4:1];i = i+1)
                        result = (result << 1) + result[15];
                else
                    for(i=0;i<data2[4:1];i = i+1)
                        result = (result >> 1) + (result[0] << 15);
            end
            ZERO:begin
                result = data1 - data2;
            end
        endcase
        if(result == 0)
            zero = 1;
        else
            zero = 0;
    end




endmodule
