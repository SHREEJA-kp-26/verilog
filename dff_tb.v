module dff_tb;
reg d,clk,rst;
wire q,qbar;
dff dut(.d(d),.clk(clk),.rst(rst),.q(q),.qbar(qbar));
initial begin
    clk = 1'b0;
    forever #20 clk=~clk;
end
initial begin
    rst =1;
    d=1'bx;
    #20
    rst=0;
    d=1;
    #40
    d=0;
    #100 $finish;
end
always@(q)
$display("time =%0t reset=%0d d=%0d, q=%0d, qbar=%0d",$time,rst,d,q,qbar);
initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
end
    endmodule