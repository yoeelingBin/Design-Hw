
// File comb_str.v

 `timescale 10ns / 1ns
 
 module comb_str(output Y, input A, B, C, D);
   
   wire out1, out2, out3, out4;
   
   not u1(out1, D);
   not u2(out2, out3);
   or u3(out3, A, D);
   and u4(out4, B, C, out1);
   and u5(Y, out2, out4);
   
 endmodule
 