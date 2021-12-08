
// File: comb_Y2.v

  `timescale 10ns / 1ns
  
  module comb_Y2(output Y, input A, B, C, D);
    
    assign Y = B ? ~(A & C) : (A & C & D);
    
 endmodule
 