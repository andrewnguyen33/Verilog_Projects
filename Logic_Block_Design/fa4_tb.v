`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 10:08:39 PM
// Design Name: 
// Module Name: fa4_tb
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


module fa4_tb();
reg [3:0] A_tb, B_tb;
    reg Cin_tb;
    wire [3:0] Sum_tb;
    wire Cout_tb;

    // Instantiate the fa4 module
    fa4 instant (
        .A(A_tb),
        .B(B_tb),
        .Cin(Cin_tb),
        .Sum(Sum_tb),
        .Cout(Cout_tb)
    );

    initial 
        begin
        // Test 1
        A_tb = 4'b0110; B_tb = 4'b0100; Cin_tb = 1'b0;
        #20;
        
        // Test 2
        A_tb = 4'b1000; B_tb = 4'b1001; Cin_tb = 1'b1;
        #20;

        // Test 3
        A_tb = 4'b1110; B_tb = 4'b0010; Cin_tb = 1'b0;
        #20;

        // Test 4
        A_tb = 4'b1010; B_tb = 4'b1011; Cin_tb = 1'b0;
        #20;

        
    end
endmodule
