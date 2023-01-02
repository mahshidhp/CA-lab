module ALU (
    input [3:0] exe_command,
    input signed [31:0] val1, val2,
    input [31:0] status_reg_out,
    output reg [3:0] status_bits,
    output reg signed [31:0]  alu_res
);

  reg Z_, N, V, C;

  always @(*) begin
    V = 1'b0;
    C = 1'b0;
    case (exe_command)
        4'b0001: alu_res = val2;  //MOV
        4'b1001: alu_res = ~val2; //MVN
        4'b0010: begin //ADD
          {C, alu_res} = val1 + val2; 
          V = (val1[31] ~^ val2[31]) && (alu_res[31] ^ val1[31]);
        end
        4'b0011: begin //ADC
          {C, alu_res} = val1 + val2 + {31'b0, status_reg_out[29]}; 
          V = (val1[31] ~^ val2[31]) && (alu_res[31] ^ val1[31]);
        end
        4'b0100: begin //SUB
          {C, alu_res} = val1 - val2; 
          V = (val1[31] ^ val2[31]) && (alu_res[31] ^ val1[31]);
        end
        4'b0101: begin //SBC
          {C, alu_res} = val1 - val2 - {31'b0, ~status_reg_out[29]}; 
          V = (val1[31] ^ val2[31]) && (alu_res[31] ^ val1[31]);
        end
        4'b0110: alu_res = val1 & val2; //AND
        4'b0111: alu_res = val1 | val2; //ORR
        4'b1000: alu_res = val1 ^ val2; //EOR
        4'b0100: begin
          {C, alu_res}= val1 - val2; //CMP
          V = (val1[31] ^ val2[31]) && (alu_res[31] ^ val1[31]);
        end
        4'b0110: alu_res = val1 & val2; //TST
        4'b0010: begin //LDR
          {C, alu_res} = val1 + val2; 
          V = (val1[31] ~^ val2[31]) && (alu_res[31] ^ val1[31]);
        end
        4'b0010: begin //STR
          {C, alu_res} = val1 + val2; 
          V = (val1[31] ~^ val2[31]) && (alu_res[31] ^ val1[31]);
        end
        default: alu_res = 32'bx;
    endcase
    N = alu_res[31];
    Z_ = ~(|alu_res) ;
    status_bits = {N, Z_, C, V};
  end
    
endmodule