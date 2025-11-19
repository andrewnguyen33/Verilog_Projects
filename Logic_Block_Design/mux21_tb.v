`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 10:20:10 PM
// Design Name: 
// Module Name: mux21_tb
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


module mux21_tb();
// Declare testbench signals
    reg S_tb;
    reg D1_tb;
    reg D2_tb;
    wire Y_tb;

    // Instantiate the mux21 module
    mux21 instant (
        .S(S_tb),
        .D1(D1_tb),
        .D2(D2_tb),
        .Y(Y_tb)
    );

    initial 
        begin
        // Test 1: S=0 ? Y should be D1
        D1_tb = 1'b0;
        D2_tb = 1'b1;
        S_tb  = 1'b0;
        #20;

        // Test 2: S=1 ? Y should be D2
        D1_tb = 1'b0;
        D2_tb = 1'b1;
        S_tb  = 1'b1;
        #20;
    end
endmodule
