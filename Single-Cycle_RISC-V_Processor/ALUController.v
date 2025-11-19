`timescale 1ns / 1ps

// Module definition
module ALUController (
    input [1:0] ALUOp,
    input [6:0] Funct7,
    input [2:0] Funct3,
    output reg [3:0] Operation
);

always @(*) begin
    case (ALUOp)
        2'b00: Operation = 4'b0010; // For load/store: ADD
        2'b01: Operation = 4'b0110; // For branch: SUB
        2'b10: begin // R-type
            case ({Funct7, Funct3})
                10'b0000000_000: Operation = 4'b0010; // ADD
                10'b0100000_000: Operation = 4'b0110; // SUB
                10'b0000000_111: Operation = 4'b0000; // AND
                10'b0000000_110: Operation = 4'b0001; // OR
                10'b0000000_100: Operation = 4'b0011; // XOR
                10'b0000000_001: Operation = 4'b0100; // SLL
                10'b0000000_101: Operation = 4'b0101; // SRL
                10'b0100000_101: Operation = 4'b1001; // SRA
                10'b0000000_010: Operation = 4'b0111; // SLT
                10'b0000000_011: Operation = 4'b1000; // SLTU
                default:         Operation = 4'b1111; // Invalid
            endcase
        end
        default: Operation = 4'b1111; // Invalid
    endcase
end

endmodule // ALUController

