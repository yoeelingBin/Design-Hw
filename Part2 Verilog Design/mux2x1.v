
// File: mux2x1.v
  `timescale 10ns / 1ns
  
  module mux2x1(output dout, input sel, [1:0] din);
    
    bufif0(dout, din[0], sel);
    bufif1(dout, din[1], sel);
    
  endmodule
  