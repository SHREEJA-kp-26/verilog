module dff(d,clk,rst, q,qbar);
input d,clk,rst;
output reg q,qbar;
always@(posedge clk or posedge rst)
begin
    if(rst == 1)begin
        q<=0;
        qbar<=1;
    end
    else begin
        q <= d;
        qbar <= ~d;
    end
end
endmodule