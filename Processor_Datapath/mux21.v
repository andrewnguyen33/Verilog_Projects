`timescale 1ns / 1ps

module mux21 (
    input wire S,
    input wire [31:0] D1,
    input wire [31:0] D2,
    output wire [31:0] Y
);

// MUX behavior: Y = D1 if S = 0, else Y = D2
assign Y = (S == 1'b0) ? D1 : D2;

endmodule // mux21
