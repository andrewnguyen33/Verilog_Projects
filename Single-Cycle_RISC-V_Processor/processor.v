`timescale 1ns / 1ps

module processor (
    input clk,
    input reset,
    output [31:0] Result
);

    // Internal wires to connect modules
    wire [6:0] Opcode;            // From Datapath to Controller
    wire [1:0] ALUOp;             // From Controller to ALUController
    wire MemtoReg, MemWrite, MemRead, ALUSrc, RegWrite; // Control signals
    wire [2:0] Funct3;            // From Datapath to ALUController
    wire [6:0] Funct7;            // From Datapath to ALUController
    wire [3:0] ALUCC;             // From ALUController to Datapath

    // Datapath instantiation
   Datapath datapath (
    .clk(clk),
    .reset(reset),
    .reg_write(RegWrite),
    .mem2reg(MemtoReg),
    .alu_src(ALUSrc),
    .mem_write(MemWrite),
    .mem_read(MemRead),
    .alu_cc(ALUCC),
    .opcode(Opcode),
    .funct3(Funct3),
    .funct7(Funct7),
    .alu_result(Result)
);

    // Controller instantiation
    Controller controller (
        .Opcode(Opcode),
        .MemtoReg(MemtoReg),
        .MemWrite(MemWrite),
        .MemRead(MemRead),
        .ALUSrc(ALUSrc),
        .RegWrite(RegWrite),
        .ALUOp(ALUOp)
    );

    // ALUController instantiation
    ALUController alucontroller (
        .ALUOp(ALUOp),
        .Funct3(Funct3),
        .Funct7(Funct7),
        .Operation(ALUCC)
    );

endmodule // processor
