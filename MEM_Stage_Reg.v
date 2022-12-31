module MEM_Stage_Reg (
  input clk, rst,
  input [31:0] PC_in,
  output reg [31:0] PC
);

  always @(posedge clk, posedge rst) begin
     PC = PC_in;
  end

endmodule