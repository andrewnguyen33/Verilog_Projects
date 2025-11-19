`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 09:37:16 PM
// Design Name: 
// Module Name: ALU
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


module ALU ( 
     input  [31:0] A_in,
    input  [31:0] B_in,
    input  [3:0]  ALU_ctrl,
    output reg [31:0] ALU_out,
    output reg carry_out,
    output reg zero,
    output reg overflow
    );
    wire [31:0] and_result = A_in & B_in;
    wire [31:0] or_result  = A_in | B_in;
    wire [31:0] nor_result = ~(A_in | B_in);
    wire [31:0] add_result = A_in + B_in;
    wire [31:0] sub_result = A_in - B_in;

    wire signed [31:0] signed_A = $signed(A_in);
    wire signed [31:0] signed_B = $signed(B_in);
    wire signed [31:0] signed_add = signed_A + signed_B;
    wire signed [31:0] signed_sub = signed_A - signed_B;
    wire [31:0] slt_result = (signed_A < signed_B) ? 32'b1 : 32'b0;
    wire [31:0] eq_result = (A_in == B_in) ? 32'b1 : 32'b0;

    always @(*) begin
        carry_out = 0;
        overflow  = 0;

        case (ALU_ctrl)
            4'b0000: ALU_out = and_result;        // AND
            4'b0001: ALU_out = or_result;         // OR
            4'b0010: begin                        // ADD (signed)
                ALU_out   = signed_add;
                carry_out = (add_result < A_in);  // Unsigned carry out
                overflow  = (signed_A[31] == signed_B[31]) && 
                            (signed_add[31] != signed_A[31]);
            end
            4'b0110: begin                        // SUB (signed)
                ALU_out   = signed_sub;
                carry_out = (A_in < B_in);        // Unsigned borrow
                overflow  = (signed_A[31] != signed_B[31]) && 
                            (signed_sub[31] != signed_A[31]);
            end
            4'b0111: ALU_out = slt_result;        // SLT
            4'b1100: ALU_out = nor_result;        // NOR
            4'b1111: ALU_out = eq_result;         // Equal
            default: ALU_out = signed_add;        // Default: ADD
        endcase

        zero = (ALU_out == 32'b0) ? 1'b1 : 1'b0;
    end

endmodule  

