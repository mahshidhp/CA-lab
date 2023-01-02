module ID_Stage_Reg (
    input clk, rst, flush,
    input [31:0] PC_in,
    input id_WB_EN, id_MEM_R_EN, id_MEM_W_EN, is_immediate,
    input [3:0] id_EXE_CMD,
    input id_B, id_S,
    input [31:0] id_Val_Rn, id_Val_Rm,
    input [7:0] id_immed_8,
    input [3:0] id_rotate_imm,
    input [23:0] id_Signed_imm_24,
    input [3:0] id_Dest,
    input [31:0] id_status_reg,
    input [3:0] scr1, scr2,
    output reg exe_WB_EN, exe_MEM_R_EN, exe_MEM_W_EN, immediate,
    output reg [3:0] exe_EXE_CMD,
    output reg exe_B,exe_S,
    output reg [31:0] PC, exe_Val_Rn, exe_Val_Rm,
    output reg [7:0] exe_immed_8,
    output reg [3:0] exe_rotate_imm,
    output reg [23:0] exe_Signed_imm_24,
    output reg [3:0] exe_Dest,
    output reg [31:0] exe_status_reg,
    output reg[3:0] scr1_out, scr2_out
);
    
  always @(posedge clk, posedge rst) begin
      
    if (~flush && ~rst) begin
      PC <= PC_in;
      {exe_WB_EN, exe_MEM_R_EN, exe_MEM_W_EN} <= {id_WB_EN, id_MEM_R_EN, id_MEM_W_EN};
      exe_EXE_CMD <= id_EXE_CMD;
      {exe_B, exe_S} <= {id_B, id_S};
      {exe_Val_Rn, exe_Val_Rm} <= {id_Val_Rn, id_Val_Rm};
      exe_immed_8 <= id_immed_8;
      exe_rotate_imm <= id_rotate_imm;
      exe_Signed_imm_24 <= id_Signed_imm_24;
      exe_Dest <= id_Dest;
      exe_status_reg <= id_status_reg;
      immediate <=  is_immediate;
      scr1_out = scr1;
      scr2_out = scr2;
    end 
    else begin
      exe_WB_EN = 1'b0;
      exe_MEM_R_EN = 1'b0;
      exe_MEM_W_EN = 1'b0;
      exe_EXE_CMD = 4'b0;
      exe_B = 1'b0;
      exe_S = 1'b0;
      PC = 32'b0;
      exe_Val_Rn = 32'b0;
      exe_Val_Rm = 32'b0;
      exe_immed_8 = 8'b0;
      exe_rotate_imm = 4'b0;
      exe_Signed_imm_24 = 24'b0;
      exe_Dest = 4'bz;
      exe_status_reg = 32'b0;
      immediate = 1'b0;
      scr1_out = 4'bx;
      scr2_out = 4'bx;
    end
  end

endmodule