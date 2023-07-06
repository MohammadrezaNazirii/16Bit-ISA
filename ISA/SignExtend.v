`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:51:33 07/03/2023 
// Design Name: 
// Module Name:    SignExtend 
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
module SignExtend(
    input [4:0] in,
    output reg [15:0] out
    );

    integer i;

    always @(in) begin
        for(i=0;i<16;i = i+1)
            out[i] = in[4];
        out[4:0] = in;
		  //$display("extended: %b", out);
    end

endmodule
