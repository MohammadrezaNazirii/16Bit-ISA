`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:22:22 07/04/2023 
// Design Name: 
// Module Name:    RegisterFile 
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
module RegisterFile(
	input clk,
    input [3:0] select1,//rs
    input [3:0] select2,//rt
    input [3:0] select3,//rd
    input RegDst,
    input RegWrite,
    input [15:0] WriteData,
    output reg [15:0] out1,
    output reg [15:0] out2
    );

    reg [15:0] Registers [0:15];
    reg [3:0] index;
    integer i;
	 
	 initial begin
		  for(i=0;i<16;i = i+1)
            Registers[i] = 0;
	 end

    always @(select1, select2, select3, RegDst, RegWrite, WriteData) begin
	     if(clk) begin
			  out1 = Registers[select1];
			  out2 = Registers[select2];
			  //if(RegDst == 0)
			  //    index = select2;
			  //else
			  //    index = select3;
			  //if(RegWrite == 1)
			  //    Registers[index] = WriteData;
			  //if(RegWrite == 1)begin
			  //    if(RegDst == 0)
				//	    index = select2;
				//	else
				//		 index = select3;
				//	Registers[index] = WriteData;
			  //end
			  for(i=0;i<16;i = i+1)
					$display("Register %d: %b", i, Registers[i]);
			  //$display("selectReg: select1:%d    select2:%d", select1, select2);
		     //$display("outputReg: out1:%b    out2:%b", out1, out2);
	     end
    end
	 always @(negedge clk) begin
		  $display("negedge");
		  if(RegDst == 0)
            index = select2;
        else
            index = select3;
	     if(RegWrite == 1)
            Registers[index] = WriteData;
		  $display("RegWriteIndex:%d", index);
	 end


endmodule
