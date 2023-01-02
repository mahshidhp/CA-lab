module Val2_Generator (
    input selector, I,
    input [3:0] imm_rotate,
    input [7:0] imm_8,
    input [31:0] val_rm,
    output reg [31:0] val2_output
);

    wire [11:0] shift_operand;
    assign shift_operand = {imm_rotate, imm_8};
    wire [4:0] shifter;
    assign shifter = shift_operand[11:7];

    always @(*) begin
        case (selector)
            1'b0: begin
                if (I == 1'b1) begin
                    val2_output=({24'b0,imm_8}>>({1'b0,imm_rotate}<<1)) | ({24'b0,imm_8}<<(~({1'b0,imm_rotate}<<1)+5'd1));
                end
                else begin
                    if (imm_8[4]== 1'b0) begin
                        val2_output = 32'b0;
                        case (imm_8[6:5])
                            2'b00: val2_output = val_rm << shifter; 
                            2'b01: val2_output = val_rm >> shifter;
                            2'b10: val2_output = val_rm >>> shifter;
                            2'b11: val2_output = (val_rm >> shifter) | (val_rm << (~shifter+5'd1));
                        endcase
                    end
                end 
            end 
            1'b1: val2_output = {20'b0, shift_operand};
        endcase
    end
    
endmodule