`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 10:01:02 PM
// Design Name: 
// Module Name: fa4
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

module fa (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);
    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (A & Cin) | (B & Cin);
endmodule

module fa4 (
  
// Define the input and output signals
    input wire [3:0] A,
    input wire [3:0] B,
    input wire Cin,
    output wire [3:0] Sum,
    output wire Cout
    );
// Define the full adder modules behaviour
wire c1, c2, c3; // Intermediate carry wires

    // Instantiate four 1-bit full adders
    fa fa0 
    (.A(A[0]), .B(B[0]), .Cin(Cin), .Sum(Sum[0]), .Cout(c1)
    );
    fa fa1 
    (.A(A[1]), .B(B[1]), .Cin(c1),  .Sum(Sum[1]), .Cout(c2)
    );
    fa fa2 
    (.A(A[2]), .B(B[2]), .Cin(c2),  .Sum(Sum[2]), .Cout(c3)
    );
    fa fa3 
    (.A(A[3]), .B(B[3]), .Cin(c3),  .Sum(Sum[3]), .Cout(Cout)
    );
endmodule // fa4
