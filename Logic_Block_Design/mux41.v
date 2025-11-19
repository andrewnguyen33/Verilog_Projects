`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/15/2025 10:25:12 PM
// Design Name: 
// Module Name: mux41
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


module mux41 (
    input [1:0] S,
    input D1,
    input D2,
    input D3,
    input D4,
    output reg Y
);
    always @(*) begin
        case (S)
            2'b00: Y = D1;
            2'b01: Y = D2;
            2'b10: Y = D3;
            2'b11: Y = D4;
        endcase
    end
endmodule
