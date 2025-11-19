`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 10:17:25 PM
// Design Name: 
// Module Name: mux21
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


module mux21 (
    input S,
    input D1,
    input D2,
    output Y
);

// MUX behavior: Y = D1 if S = 0, else Y = D2
assign Y = (S == 1'b0) ? D1 : D2;

endmodule // mux21
