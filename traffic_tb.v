module traffic_tb;

reg clk;
reg reset;
wire [2:0] light;


traffic uut(
    .clk(clk),
    .reset(reset),
    .light(light)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    $dumpfile("moore.vcd");
    $dumpvars(0, traffic_tb
    );

    #10 reset = 0;

    #100 $finish;
end

endmodule