`timescale 1ns / 1ps

module RegFile(
    input clk,
    input reset,
    input rg_wrt_en,
    input [4:0] rg_wrt_addr,
    input [4:0] rg_rd_addr1,
    input [4:0] rg_rd_addr2,
    input [31:0] rg_wrt_data,
    output [31:0] rg_rd_data1,
    output [31:0] rg_rd_data2
    );

    reg [31:0] register[31:0];
    integer i;

    // Asynchronous reset and synchronous write
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            for (i = 0; i < 32; i = i + 1) begin
                register[i] <= 32'h00000000;
            end
        end else if (rg_wrt_en) begin
            register[rg_wrt_addr] <= rg_wrt_data;
        end
    end

    // Continuous read
    assign rg_rd_data1 = register[rg_rd_addr1];
    assign rg_rd_data2 = register[rg_rd_addr2];

endmodule
