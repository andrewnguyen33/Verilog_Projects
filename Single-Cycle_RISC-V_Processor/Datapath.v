`timescale 1ns / 1ps

module Datapath #(
    parameter PC_W = 8,
    parameter INS_W = 32,
    parameter RF_ADDRESS = 5,
    parameter DATA_W = 32,
    parameter DM_ADDRESS = 9,
    parameter ALU_CC_W = 4
)(
    input clk,
    input reset,
    input reg_write,
    input mem2reg,
    input alu_src,
    input mem_write,
    input mem_read,
    input [ALU_CC_W-1:0] alu_cc,
    output [6:0] opcode,
    output [6:0] funct7,
    output [2:0] funct3,
    output [DATA_W-1:0] alu_result
);

    // === Internal Wires ===
    wire [PC_W-1:0] pc;
    wire [PC_W-1:0] pc_next;
    wire [31:0] instruction;
    wire [DATA_W-1:0] imm_ext;

    wire [4:0] rd_rg_wrt_addr   = instruction[11:7];
    wire [4:0] rd_rg_rd_addr1   = instruction[19:15];
    wire [4:0] rd_rg_rd_addr2   = instruction[24:20];

    wire [DATA_W-1:0] read_data1, read_data2;
    wire [DATA_W-1:0] alu_input_b;
    wire [DATA_W-1:0] mem_out;
    wire [DATA_W-1:0] write_back;

    wire zero, carry_out, overflow;

    assign opcode = instruction[6:0];
    assign funct3 = instruction[14:12];
    assign funct7 = instruction[31:25];

    assign pc_next = pc + 4;

    // === FlipFlop for Program Counter ===
    FlipFlop pc_ff (
        .clk(clk),
        .reset(reset),
        .d(pc_next),
        .q(pc)
    );

    // === Instruction Memory ===
    InstMem imem (
        .addr(pc),
        .instruction(instruction)
    );

    // === Immediate Generator (Now using ImmGen module) ===
    ImmGen imm_gen (
        .InstCode(instruction),
        .ImmOut(imm_ext)
    );

    // === Register File ===
    RegFile rf (
        .clk(clk),
        .reset(reset),
        .rg_wrt_en(reg_write),
        .rg_wrt_addr(rd_rg_wrt_addr),
        .rg_rd_addr1(rd_rg_rd_addr1),
        .rg_rd_addr2(rd_rg_rd_addr2),
        .rg_wrt_data(write_back),
        .rg_rd_data1(read_data1),
        .rg_rd_data2(read_data2)
    );

    // === ALU Input Mux ===
    mux21 alu_mux (
        .S(alu_src),
        .D1(read_data2),
        .D2(imm_ext),
        .Y(alu_input_b)
    );

    // === ALU ===
    ALU alu (
        .A_in(read_data1),
        .B_in(alu_input_b),
        .ALU_Sel(alu_cc),
        .ALU_Out(alu_result),
        .Carry_Out(carry_out),
        .Zero(zero),
        .Overflow(overflow)
    );

    // === Data Memory ===
    DataMem dmem (
        .MemRead(mem_read),
        .MemWrite(mem_write),
        .addr(alu_result),
        .write_data(read_data2),
        .read_data(mem_out)
    );

    // === Write-Back Mux ===
    mux21 wb_mux (
        .S(mem2reg),
        .D1(alu_result),
        .D2(mem_out),
        .Y(write_back)
    );

endmodule
