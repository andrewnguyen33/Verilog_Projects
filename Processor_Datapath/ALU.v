`timescale 1ns / 1ps

module ALU (
    input [31:0] A_in, B_in,         // ALU 32-bit inputs
    input [3:0] ALU_Sel,             // ALU 4-bit selection
    output [31:0] ALU_Out,           // ALU 32-bit output
    output reg Carry_Out,
    output Zero,                     // 1-bit Zero flag
    output reg Overflow = 1'b0       // 1-bit Overflow flag
);

reg [31:0] ALU_Result;
reg [32:0] temp;
reg [32:0] twos_com; // Holds 2's complement of B_in for subtraction

assign ALU_Out = ALU_Result;       // Assign result to output
assign Zero = (ALU_Result == 0);   // Zero flag

always @(*) begin
    Overflow = 1'b0;
    Carry_Out = 1'b0;

    case (ALU_Sel)
        4'b0000: begin // Bitwise AND
            ALU_Result = A_in & B_in;
        end

        4'b0001: begin // Bitwise OR
            ALU_Result = A_in | B_in;
        end

        4'b0010: begin // Signed Addition with overflow and carry check
            ALU_Result = $signed(A_in) + $signed(B_in);
            temp = {1'b0, A_in} + {1'b0, B_in};
            Carry_Out = temp[32];
            if ((A_in[31] & B_in[31] & ~ALU_Result[31]) |
                (~A_in[31] & ~B_in[31] & ALU_Result[31]))
                Overflow = 1'b1;
        end

        4'b0110: begin // Signed Subtraction with overflow check
            ALU_Result = $signed(A_in) - $signed(B_in);
            twos_com = ~{1'b0, B_in} + 1'b1;
            if ((A_in[31] & twos_com[31] & ~ALU_Result[31]) |
                (~A_in[31] & ~twos_com[31] & ALU_Result[31]))
                Overflow = 1'b1;
        end

        4'b0111: begin // Signed less-than comparison
            ALU_Result = ($signed(A_in) < $signed(B_in)) ? 32'd1 : 32'd0;
        end

        4'b1100: begin // Bitwise NOR
            ALU_Result = ~(A_in | B_in);
        end

        4'b1111: begin // Equality comparison
            ALU_Result = (A_in == B_in) ? 32'd1 : 32'd0;
        end

        default: begin
            ALU_Result = A_in + B_in; // Default to unsigned addition
        end
    endcase
end
endmodule
