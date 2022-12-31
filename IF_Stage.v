module IF_stage (
    input clk, rst, freeze, branch_taken,
    input [31:0] branch_address,
    output [31:0] inc_PC, instruction
);

  
  wire [31:0] PC_reg_out;
  wire [31:0] PC_reg_in;

  assign PC_reg_in = branch_taken ? branch_address : inc_PC;
  assign inc_PC = PC_reg_out + 32'd4;
  IM im(clk, PC_reg_out, instruction);
  PC_Reg PC_reg(clk, rst, freeze, PC_reg_in, PC_reg_out);
  

endmodule