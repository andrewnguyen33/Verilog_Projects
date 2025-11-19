`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2025 09:40:17 PM
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
// Inputs
    reg [31:0] A_in;
    reg [31:0] B_in;
    reg [3:0] ALU_ctrl;

    // Outputs
    wire [31:0] ALU_out;
    wire carry_out;
    wire zero;
    wire overflow;

    // Instantiate the ALU
    ALU_32 instant (
        .A_in(A_in),
        .B_in(B_in),
        .ALU_ctrl(ALU_ctrl),
        .ALU_out(ALU_out),
        .carry_out(carry_out),
        .zero(zero),
        .overflow(overflow)
    );

    // Procedure for applying each test
    initial begin
        $display("Starting ALU Testbench...");
        
        // Test 1: AND
        A_in = 32'h086a0c31;
        B_in = 32'hd785f148;
        ALU_ctrl = 4'b0000;
        #20;

        // Test 2: OR
        A_in = 32'h086a0c31;
        B_in = 32'h10073fd4;
        ALU_ctrl = 4'b0001;
        #20;

        // Test 3: ADD
        A_in = 32'ha86a0c31;
        B_in = 32'h90073fd4;
        ALU_ctrl = 4'b0010;
        #20;

        // Test 4: SUB
        A_in = 32'ha86a0c31;
        B_in = 32'h90073fd4;
        ALU_ctrl = 4'b0110;
        #20;

        // Test 5: SLT
        A_in = 32'ha86a0c31;
        B_in = 32'h90073fd4;
        ALU_ctrl = 4'b0111;
        #20;

        // Test 6: NOR
        A_in = 32'ha86a0c31;
        B_in = 32'h90073fd4;
        ALU_ctrl = 4'b1100;
        #20;

        // Test 7: Equal (should be true)
        A_in = 32'ha86a0c31;
        B_in = 32'ha86a0c31;
        ALU_ctrl = 4'b1111;
        #20;

        // Test 8: Equal (should be false)
        A_in = 32'ha86a0c31;
        B_in = 32'h10073fd4;
        ALU_ctrl = 4'b1111;
        #20;

        $display("Testbench completed.");
        $stop;
    end

endmodule
