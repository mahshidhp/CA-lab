module IM (
    input clk,
    input [31:0] PC_in,
    output reg [31:0] instruction 
);

  always @(*) begin
      case (PC_in)
        32'd0  : instruction <= 32'b1110_00_1_1101_0_0000_0000_000000010100; 
        32'd4  : instruction <= 32'b1110_00_1_1101_0_0000_0001_101000000001;
        32'd8  : instruction <= 32'b1110_00_1_1101_0_0000_0010_000100000011;
        32'd12 : instruction <= 32'b1110_00_0_0100_1_0010_0011_000000000010;
        32'd16 : instruction <= 32'b1110_00_0_0101_0_0000_0100_000000000000;
        32'd20 : instruction <= 32'b1110_00_0_0010_0_0100_0101_000100000100;
        32'd24 : instruction <= 32'b1110_00_0_0110_0_0000_0110_000010100000;
        32'd28 : instruction <= 32'b11100001100001010111000101000010;
        32'd32 : instruction <= 32'b11100000000001111000000000000011;
        32'd36 : instruction <= 32'b11100001111000001001000000000110;
        32'd40 : instruction <= 32'b11100000001001001010000000000101;
        32'd44 : instruction <= 32'b11100001010110000000000000000110;
        32'd48 : instruction <= 32'b00010000100000010001000000000001;
        32'd52 : instruction <= 32'b11100001000110010000000000001000;
        32'd56 : instruction <= 32'b00000000100000100010000000000010;
        32'd60 : instruction <= 32'b11100011101000000000101100000001;
        32'd64 : instruction <= 32'b11100100100000000001000000000000;
        32'd68 : instruction <= 32'b11100100100100001011000000000000;
        default: instruction <= 32'd0;
      endcase
  end
    
endmodule
