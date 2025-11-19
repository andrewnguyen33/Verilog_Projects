`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 03:10:06 AM
// Design Name: 
// Module Name: FlipFlop_tb
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


module FlipFlop_tb();
    reg tb_clk;
    reg [1:0] tb_reset;
    reg [7:0] tb_d;
    wire [7:0] tb_q;

    FlipFlop instant(
    .clk(tb_clk),
    .reset(tb_reset),
    .d(tb_d),
    .q(tb_q)
    );
    
    initial begin
    tb_clk= 1'b1;
    forever #10 tb_clk=~tb_clk;
    end
    
    initial begin
    tb_reset = 1'b1;
    tb_d = 8'b00110000;
    #100;
    
    tb_reset = 1'b0;
    tb_d=8'b00001111;
    #60;
    
    $finish;
    end   
endmodule
