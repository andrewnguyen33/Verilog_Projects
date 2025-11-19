`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 08:55:00 PM
// Design Name: 
// Module Name: fa
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


module fa(
    A ,
    B ,
    Cin,
    Sum,
    Cout
    );
    
    input A;      // First input bit
    input B;      // Second input bit
    input Cin;    // Carry-in
    output Sum;   // Sum output
    output Cout;   // Carry-out
    
    assign Sum = A ^ B ^ Cin;                  // XOR for sum
    assign Cout = (A & B) | (A & Cin) | (B & Cin);  // Carry-out logic
endmodule
