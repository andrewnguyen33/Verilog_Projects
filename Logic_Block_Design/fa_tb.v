`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 09:02:42 PM
// Design Name: 
// Module Name: fa_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fa_tb();
// input and output ports
    reg A_tb = 0;
    reg B_tb = 0;
    reg Cin_tb =0;
    wire Sum_tb ;
    wire Cout_tb ;
    //port mapping
    fa instant(
    .A(A_tb),
    .B(B_tb),
    .Cin(Cin_tb),
    .Sum(Sum_tb),
    .Cout(Cout_tb)
    );
   // test samples
  initial
    begin
   A_tb = 1'b0; 
   B_tb = 1'b1; 
   Cin_tb = 1'b0;
    #20;

   
    A_tb = 1'b1; 
    B_tb = 1'b1; 
    Cin_tb = 1'b0;
    #20;

  
    A_tb = 1'b1; 
    B_tb = 1'b1; 
    Cin_tb = 1'b1;
    #20;
   end
   
endmodule
