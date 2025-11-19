module ImmGen (
    input  [31:0] InstCode,
    output reg [31:0] ImmOut
);

// The ImmGen module's behavior
always @ (InstCode) begin
    case (InstCode[6:0])
        // I-type (e.g., Load)
        7'b0000011: 
            ImmOut = { {20{InstCode[31]}}, InstCode[31:20] };

        // I-type (e.g., ALU immediate instructions)
        7'b0010011: 
            ImmOut = { {20{InstCode[31]}}, InstCode[31:20] };

        // S-type (e.g., Store)
        7'b0100011: 
            ImmOut = { {20{InstCode[31]}}, InstCode[31:25], InstCode[11:7] };

        // U-type (e.g., AUIPC)
        7'b0010111: 
            ImmOut = { InstCode[31:12], 12'b0 };

        // Default case
        default: 
            ImmOut = 32'b0;
    endcase
end

endmodule
