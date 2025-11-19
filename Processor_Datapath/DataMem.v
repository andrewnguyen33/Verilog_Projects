`timescale 1ns / 1ps

module DataMem (MemRead , MemWrite , addr , write_data , read_data);
    input wire MemRead;
    input wire MemWrite;
    input wire [31:0] addr;
    input wire [31:0] write_data;
    output reg [31:0] read_data;

// 128 × 32-bit memory => 128 entries of 32 bits each
reg [31:0] memory [0:127];

// Word address derived from bits [8:2] of byte address
wire [6:0] word_addr;
assign word_addr = addr[8:2];

always @(*) begin
    if (MemRead)
        read_data = memory[word_addr];
    else
        read_data = 32'b0;
end

always @(posedge MemWrite) begin
    memory[word_addr] <= write_data;
end

endmodule
