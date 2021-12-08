
// File: comb_Y1.v

  `timescale 10ns / 1ns
  
  module comb_Y1(output Y, input A, B, C);
    
    assign Y = A ? ~B : B ^ C;
    
  endmodule