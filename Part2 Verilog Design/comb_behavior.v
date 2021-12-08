
 // File: comb_behavior.v
 `timescale 10ns / 1ns
 
 module comb_behavior(output Y, input A, B, C, D);
   
   reg buff;
   
   always @(*)
      buff = (~(A | D)) & (B & C & ~D);
    
   assign Y = buff;
   
 endmodule 
   