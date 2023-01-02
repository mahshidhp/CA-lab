module MEM_Stage (
    input clk, mem_read, mem_write,
    input [31:0] alu_res, val_rm,
    output [31:0] data_mem_out
);

  Data_Memory DM(
      clk, mem_read, mem_write,
      val_rm, alu_res,
      data_mem_out
  );    

endmodule