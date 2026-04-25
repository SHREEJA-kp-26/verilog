module alu #(
    parameter WIDTH = 8
)(
    input  [WIDTH-1:0] A,
    input  [WIDTH-1:0] B,
    input  [3:0] ALU_Sel,
    output reg [WIDTH-1:0] Result,
    output reg Carry,
    output reg Zero,
    output reg Overflow
);

always @(*) begin
    // Default values
    Result = 0;
    Carry = 0;
    Overflow = 0;

    case (ALU_Sel)
        4'b0000: {Carry, Result} = A + B;           // ADD
        4'b0001: {Carry, Result} = A - B;           // SUB
        4'b0010: Result = A & B;                    // AND
        4'b0011: Result = A | B;                    // OR
        4'b0100: Result = A ^ B;                    // XOR
        4'b0101: Result = ~A;                       // NOT
        4'b0110: Result = A << 1;                   // Shift Left
        4'b0111: Result = A >> 1;                   // Shift Right
        4'b1000: Result = (A < B) ? 1 : 0;          // Less Than
        default: Result = 0;
    endcase

    // Zero flag
    Zero = (Result == 0) ? 1 : 0;

    // Overflow detection (for ADD and SUB)
    if (ALU_Sel == 4'b0000) begin
        Overflow = (A[WIDTH-1] == B[WIDTH-1]) && (Result[WIDTH-1] != A[WIDTH-1]);
    end
    else if (ALU_Sel == 4'b0001) begin
        Overflow = (A[WIDTH-1] != B[WIDTH-1]) && (Result[WIDTH-1] != A[WIDTH-1]);
    end
end

endmodule