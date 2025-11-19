`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/12/2025 05:27:56 AM
// Design Name: 
// Module Name: InstMem_tb
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


module InstMem_tb();
    reg [7:0] tb_addr;
    wire [31:0] tb_instruction;
   
   InstMem instant (
   .addr(tb_addr),
   .instruction(tb_instruction)
   );
  
   initial begin
    tb_addr = 8'b00110011;
    #20
   
    tb_addr = 8'b00101100;
    #20;
   $finish;
   end
endmodule
