`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Module Name: RegFile_tb
// Description: Testbench for the RegFile module
//////////////////////////////////////////////////////////////////////////////////

module RegFile_tb();

    reg tb_clk, tb_reset, tb_rg_wrt_en;
    reg [4:0] tb_rg_rd_addr1, tb_rg_rd_addr2, tb_rg_wrt_addr;
    reg [31:0] tb_rg_wrt_data;
    wire [31:0] tb_rg_rd_data1, tb_rg_rd_data2;

    // Instantiate the RegFile module
    RegFile instant (
        .clk(tb_clk),
        .reset(tb_reset),
        .rg_wrt_en(tb_rg_wrt_en),
        .rg_wrt_addr(tb_rg_wrt_addr),
        .rg_rd_addr1(tb_rg_rd_addr1),
        .rg_rd_addr2(tb_rg_rd_addr2),
        .rg_wrt_data(tb_rg_wrt_data),
        .rg_rd_data1(tb_rg_rd_data1),
        .rg_rd_data2(tb_rg_rd_data2)
    );

    // Clock generation
    initial begin
        tb_clk = 1;
        forever #50 tb_clk = ~tb_clk; // 100ns clock period
    end

   
    initial begin
        tb_reset = 1;
        tb_rg_wrt_en = 1;
        tb_rg_wrt_addr = 5'b10010;
        tb_rg_wrt_data = 32'h00356423;
        tb_rg_rd_addr1 = 5'b10010; // Read from reg 18
        tb_rg_rd_addr2 = 5'b00000;
        #100;

        tb_reset = 0;
        tb_rg_wrt_en = 1;
        tb_rg_wrt_addr = 5'b10010;
        tb_rg_wrt_data = 32'h00356423;
        tb_rg_rd_addr1 = 5'b10010; // Should now read this value
        tb_rg_rd_addr2 = 5'b00000;
        #100;

        $finish;
    end

    initial begin
    $dumpfile("test.vcd");
    $dumpvars;
    end

endmodule
