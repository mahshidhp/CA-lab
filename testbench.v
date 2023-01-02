`timescale 1ns/1ns

module testbench();
    reg clk=0, rst=0, forward=1;
    arm UUT(clk, rst, forward);

    initial repeat (500) #10 clk=~clk;
    
    initial begin
      #2 
      rst = 1;
      #2 
      rst = 0;
    end
    
endmodule 