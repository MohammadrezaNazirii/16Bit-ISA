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
	 
	 //reg [15:0] temp;
	 integer temp;


    always @(data1, data2, ALUop) begin:Alu
		  integer i;
        case(ALUop)
            ADD:begin
                result = data1 + data2;
            end
            SHIFT:begin
					 $display("shift:%d", data2[4:1]);
					 $display("shift_res: %b", result << data2[4:1]);
                //result = data1;
					 temp = data2[4:1];
					 result = (data2[0]) ? (data1 << temp) : (data1 >> temp);
                //if(data2[0] == 1)
                //    result = data1 << data2[4:1];
                //else
                //    result = data1 >> data2[4:1];
					 $display("resss:%b", result);
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
		  $display("Data1:%d  Data2:%d", data1, data2);
		  $display("result:%d", result);
        if(result == 0)
            zero = 1;
        else
            zero = 0;
		  $display("Zero:%d", zero);
    end




endmodule
