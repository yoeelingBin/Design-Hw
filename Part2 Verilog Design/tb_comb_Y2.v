
// File: tb_comb_Y2.v

  `timescale 10ns / 1ns
  `include "comb_Y2.v"
 
 module tb_comb_Y2();
   
   reg p_A, p_B, p_C, p_D;
   wire p_Y;
   
   initial
   begin
     {p_A, p_B, p_C, p_D} = 4'b0;
     forever
        #5 {p_A, p_B, p_C, p_D} = {p_A, p_B, p_C, p_D} + 1;
   end
   
   comb_Y2 m_Y2(.Y(p_Y), .A(p_A), .B(p_B), .C(p_C), .D(p_D));
   
   initial
   begin
     $monitor($time, "\t ABCD = %4b \t %d \t Y2 = %b", {p_A, p_B, p_C, p_D}, {p_A, p_B, p_C, p_D}, p_Y);
   end
   
 endmodule