
// File: mux4x1.v
  `timescale 10ns / 1ns
  `include "mux2x1.v"
  
  module mux4x1(output dout, input [1:0] sel, [3:0] din);
  
    wire dout1, dout2;
    mux2x1 mux2x1_1(dout1, sel[0], din[1:0]);
    mux2x1 mux2x1_2(dout2, sel[0], din[3:2]);
    mux2x1 mux2x1_3(dout, sel[1], {dout2, dout1});
    
  endmodule
  