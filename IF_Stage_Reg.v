module IF_Stage_Reg (
    input clk, rst, freeze, flush,
    input [31:0] PC_in, instruction_in,
    output reg [31:0] PC, instruction 
);

  always @(posedge clk,posedge rst) begin
      
      if(flush || rst) begin
          PC = 32'd0;
          instruction = 32'd0;
      end
      else if(~freeze) begin
          PC <= PC_in;
          instruction <= instruction_in;
      end
  
  end
      
endmodule