
// File: comb_str2.v
  `timescale 10ns / 1ns
  
  module comb_str(output y, input sel, A, B, C, D);
    
    wire in0, in1;
    
    nand #(3) nand1(in0, A, B);
    nand #(4) nand2(in1, C, D);
    
    bufif1(y, in1, sel);
    bufif0(y, in0, sel);
    
  endmodule
  