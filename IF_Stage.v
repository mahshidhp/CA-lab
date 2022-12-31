module IF_stage (
    input clk, rst, freeze, branch_taken,
    input [31:0] branch_address,
    output [31:0] inc_PC, instruction
);

  
  wire [31:0] PC_reg_out;
  wire [31:0] PC_reg_in;

  assign PC_reg_in = inc_PC; //todo: add mux
  assign inc_PC = PC_reg_out + 32'd4;
  IM im(clk, PC_reg_out, instruction);
  PC_Reg PC_reg(clk, rst, 1'b0, PC_reg_in, PC_reg_out);
  

endmodule