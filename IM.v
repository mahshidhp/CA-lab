module IM (
    input clk,
    input [31:0] PC_in,
    output reg [31:0] instruction 
);

  always @(*) begin
      case (PC_in)
        //                          COND Md I opcd S  Rn   Rd  shifter-oprd
        32'd0  : instruction <= 32'b1110_00_1_1101_0_0000_0000_000000010100; //MOV R0, #20
        32'd4  : instruction <= 32'b1110_00_1_1101_0_0000_0001_101000000001; //MOV R1, #4096
        32'd8  : instruction <= 32'b1110_00_1_1101_0_0000_0010_000100000011; //MOV R2, #0xC0000000
        32'd12 : instruction <= 32'b1110_00_0_0100_1_0010_0011_000000000010; //ADDS R3, R2, R2
        32'd16 : instruction <= 32'b1110_00_0_0101_0_0000_0100_000000000000; //ADC R4, R0, R0
        32'd20 : instruction <= 32'b1110_00_0_0010_0_0100_0101_000100000100; //SUB R5, R4, R4, LSL #2
        32'd24 : instruction <= 32'b1110_00_0_0110_0_0000_0110_000010100000; //SBC R6, R0, R0, LSR #1
        32'd28 : instruction <= 32'b1110_00_0_1100_0_0101_0111_000101000010; //ORR R7, R5, R2, ASR #2
        32'd32 : instruction <= 32'b1110_00_0_0000_0_0111_1000_000000000011; //AND R8, R7, R3 
        32'd36 : instruction <= 32'b1110_00_0_1111_0_0000_1001_000000000110; //MVN R9, R6
        32'd40 : instruction <= 32'b1110_00_0_0001_0_0100_1010_000000000101; //EOR R10, R4, R5
        32'd44 : instruction <= 32'b1110_00_0_1010_1_1000_0000_000000000110; //CMP R8, R6
        
        32'd48 : instruction <= 32'b0001_00_0_0100_0_0001_0001_000000000001; //ADDNE R1, R1, R1
        32'd52 : instruction <= 32'b1110_00_0_1000_1_1001_0000_000000001000; //TST R9, R8
        32'd56 : instruction <= 32'b0000_00_0_0100_0_0010_0010_000000000010; //ADDEQ R2, R2, R2
        32'd60 : instruction <= 32'b1110_00_1_1101_0_0000_0000_101100000001; //MOV R0, #1024
        32'd64 : instruction <= 32'b1110_01_0_0100_0_0000_0001_000000000000; //STR R1, [R0], #0
        32'd68 : instruction <= 32'b1110_01_0_0100_1_0000_1011_000000000000; //LDR R11, [R0], #0
        32'd72 : instruction <= 32'b1110_01_0_0100_0_0000_0010_000000000100; //STR R2 ,[R0],#4 //MEM[1028] = -1073741824
        32'd76 : instruction <= 32'b11100100100000000011000000001000; //STR R3 ,[R0],#8 //MEM[1032] = -2147483648
        32'd80 : instruction <= 32'b11100100100000000100000000001101; //STR R4 ,[R0],#13 //MEM[1036] = 41
        32'd84 : instruction <= 32'b11100100100000000101000000010000; //STR R5 ,[R0],#16 //MEM[1040] = -123
        32'd88 : instruction <= 32'b11100100100000000110000000010100; //STR R6 ,[R0],#20 //MEM[1044] = 9
        32'd92 : instruction <= 32'b11100100100100001010000000000100; //LDR R10,[R0],#4 //R10 = -1073741824
        32'd96 : instruction <= 32'b11100100100000000111000000011000; //STR R7 ,[R0],#24 //MEM[1048] = -123
        32'd100: instruction <= 32'b11100011101000000001000000000100; //MOV R1 ,#4 //R1 = 4
        32'd104: instruction <= 32'b11100011101000000010000000000000; //MOV R2 ,#0 //R2 = 0
        32'd108: instruction <= 32'b11100011101000000011000000000000; //MOV R3 ,#0 //R3 = 0
        32'd112: instruction <= 32'b11100000100000000100000100000011; //ADD R4 ,R0,R3,LSL #2
        32'd116: instruction <= 32'b11100100100101000101000000000000; //LDR R5 ,[R4],#0
        32'd120: instruction <= 32'b11100100100101000110000000000100; //LDR R6 ,[R4],#4
        32'd124: instruction <= 32'b11100001010101010000000000000110; //CMP R5 ,R6
        32'd128: instruction <= 32'b11000100100001000110000000000000; //STRGT R6 ,[R4],#0
        32'd132: instruction <= 32'b11000100100001000101000000000100; //STRGT R5 ,[R4],#4
        32'd136: instruction <= 32'b11100010100000110011000000000001; //ADD R3 ,R3,#1
        32'd140: instruction <= 32'b11100011010100110000000000000011; //CMP R3 ,#3
        32'd144: instruction <= 32'b10111010111111111111111111110111; //BLT #-9
        32'd148: instruction <= 32'b11100010100000100010000000000001; //ADD R2 ,R2,#1
        32'd152: instruction <= 32'b11100001010100100000000000000001; //CMP R2 ,R1
        32'd156: instruction <= 32'b10111010111111111111111111110011; //BLT #-13
        32'd160: instruction <= 32'b11100100100100000001000000000000; //LDR R1 ,[R0],#0 //R1 = -2147483648
        32'd164: instruction <= 32'b11100100100100000010000000000100; //LDR R2 ,[R0],#4 //R2 = -1073741824
        32'd168: instruction <= 32'b11100100100100000011000000001000; //STR R3 ,[R0],#8 //R3 = 41
        32'd172: instruction <= 32'b11100100100100000100000000001100; //STR R4 ,[R0],#12 //R4 = 8192
        32'd176: instruction <= 32'b11100100100100000101000000010000; //STR R5 ,[R0],#16
        32'd180: instruction <= 32'b11100100100100000110000000010100; //STR R6 ,[R0],#20
        32'd184: instruction <= 32'b11101010111111111111111111111111; //B #-1
        default: instruction <= 32'd0;
      endcase
  end
    
endmodule
