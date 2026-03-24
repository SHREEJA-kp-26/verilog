module ha_tb;
reg a,b;
wire sum,carry;
ha dut(.a(a),.b(b),.sum(sum),.carry(carry));
initial begin
    a = 0; b =0;
    #10
    a = 0; b =1;
    #10
    a = 1; b=0;
    #10
    a =1; b=1;
    #50 $finish;
end 
always@(a or b)
$display("time =%0t INPUT VALUES: a=%b b=%b OUTPUT VALUES: sum=%b carry=%b",
$time,a,b,sum,carry);
endmodule