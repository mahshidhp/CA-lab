module ID_Stage (
  input clk, rst, hazard, wb_wb_enable,
  input [31:0] status_reg_out,
  input [3:0] wb_dest,
  input [31:0] PC_in, instruction, wb_result,
  output [31:0] PC,
  output two_src, wb_en, mem_read_en, mem_write_en, S, B, is_immediate,
  output [3:0] exe_command,
  output [31:0] val_rn, val_rm,
  output [7:0] imm_8,
  output [3:0] rotate_imm,
  output [23:0] signed_imm,
  output [3:0] dest, src1, src2
);

  assign src1 = instruction[19:16];
  assign src2 = (mem_write_en) ? instruction[15:12] : instruction[3:0];
  RF register_file(clk, rst, src1, src2, wb_dest, wb_result, wb_wb_enable, val_rn, val_rm);
  
  wire cu_S, cu_B, cu_mem_write_en, cu_mem_read_en, cu_wb_en, cu_is_immediate, c_check_out, control_sig_selector;
  wire [3:0] cu_exe_command;
  assign control_sig_selector = hazard || (~c_check_out);
  assign {exe_command, wb_en, mem_read_en, mem_write_en, S, B, is_immediate} = 
    control_sig_selector ? 9'b0 : {cu_exe_command, cu_wb_en, cu_mem_read_en, cu_mem_write_en, cu_S, cu_B, cu_is_immediate};
  assign two_src = (~instruction[25]) || mem_write_en;
  Control_Unit control_unit(
    instruction[27:26], 
    instruction[24:21], 
    instruction[20], 
    instruction[25], 
    cu_exe_command,
    cu_mem_read_en,
    cu_mem_write_en,
    cu_wb_en,
    cu_is_immediate,
    cu_B,
    cu_S
  );

  Condition_Check condition_check(instruction[31:28], status_reg_out, c_check_out);
  
  assign imm_8 = instruction[7:0];
  assign rotate_imm = instruction[11:8];
  assign signed_imm = instruction[23:0];
  assign dest = instruction[15:12];
  
  assign PC = PC_in;

endmodule