module alu_tb;

reg [7:0] A, B;
reg [3:0] ALU_Sel;
wire [7:0] Result;
wire Carry, Zero, Overflow;

alu uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .Result(Result),
    .Carry(Carry),
    .Zero(Zero),
    .Overflow(Overflow)
);

initial begin
    $dumpfile("alu.vcd");
    $dumpvars(0, alu_tb);

    // Test cases
    A = 8'd10; B = 8'd5;

    ALU_Sel = 4'b0000; #10; // ADD
    ALU_Sel = 4'b0001; #10; // SUB
    ALU_Sel = 4'b0010; #10; // AND
    ALU_Sel = 4'b0011; #10; // OR
    ALU_Sel = 4'b0100; #10; // XOR
    ALU_Sel = 4'b0110; #10; // Shift Left
    ALU_Sel = 4'b0111; #10; // Shift Right

    $finish;
end

endmodule