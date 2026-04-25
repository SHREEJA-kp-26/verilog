module traffic(
  input clk,
  input reset,
  output reg[2:0] light
);
parameter RED = 3'b100;
parameter YELLOW = 3'b010;
parameter GREEN = 3'b001;
parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10;
reg [1:0] state;
always @(posedge clk or posedge reset) begin
  if(reset)
    state <= S0;
  else begin
    case (state)
        S0 : state <= S1;
        S1 : state <= S2;
        S2 : state <= S0;
    endcase
  end
end
always @ (*) begin
  light = RED;
  case(state)
  S0: light = GREEN;
  S1: light = YELLOW;
  S2: light = RED;
  endcase
end
endmodule