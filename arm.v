module arm(
  input clk, rst
);
  
  wire freeze, branch_taken, flush;
  wire [31:0] branch_address;
  
  wire [31:0] if_pc_out, if_instruction_out, if_reg_pc_out, if_reg_instruction_out;
  wire [31:0] id_pc_out, id_reg_pc_out;
  wire [31:0] exe_pc_out, exe_reg_pc_out;
  wire [31:0] mem_pc_out, mem_reg_pc_out;
  wire [31:0] wb_pc_out;
  
  IF_stage IF(clk, rst, freeze, branch_taken, branch_address, if_pc_out, if_instruction_out);
  IF_stage_reg IF_reg(clk, rst, freeze, flush ,if_pc_out, if_instruction_out, if_reg_pc_out, if_reg_instruction_out);
  
  ID_Stage ID(clk, rst, if_reg_pc_out, id_pc_out);
  ID_Stage_Reg ID_reg(clk, rst, id_pc_out, id_reg_pc_out);
  
  EXE_Stage EXE(clk, rst, id_reg_pc_out, exe_pc_out);
  EXE_Stage_Reg EXE_reg(clk, rst, exe_pc_out, exe_reg_pc_out);
  
  MEM_Stage MEM(clk, rst, exe_reg_pc_out, mem_pc_out);
  MEM_Stage_Reg MEM_reg(clk, rst, mem_pc_out, mem_reg_pc_out);
  
  WB_Stage WB(clk, rst, mem_reg_pc_out, wb_pc_out);
	
endmodule

