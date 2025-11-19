`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 10:26:28 PM
// Design Name: 
// Module Name: mux41_tb
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


module mux41_tb();
reg [1:0] S_tb;
    reg D1_tb, D2_tb, D3_tb, D4_tb;
    wire Y_tb;

    mux41 instant (
        .S(S_tb),
        .D1(D1_tb),
        .D2(D2_tb),
        .D3(D3_tb),
        .D4(D4_tb),
        .Y(Y_tb)
    );

    initial 
        begin
        // Set inputs
        D1_tb = 0; D2_tb = 1; D3_tb = 0; D4_tb = 1;

        // Test 1: S = 00 ? Y = D1 = 0
        S_tb = 2'b00; #20;
        // Test 2: S = 01 ? Y = D2 = 1
        S_tb = 2'b01; #20;
        // Test 3: S = 10 ? Y = D3 = 0
        S_tb = 2'b10; #20;
        // Test 4: S = 11 ? Y = D4 = 1
        S_tb = 2'b11; #20;

    end
endmodule

