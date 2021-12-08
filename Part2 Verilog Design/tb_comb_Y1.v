
// File: tb_comb_Y1.v

 `timescale 10ns / 1ns
 `include "comb_Y1.v"
 
 module tb_comb_Y1();
   
   reg p_A, p_B, p_C;
   wire p_Y;
   
   initial
   begin
     {p_A, p_B, p_C} = 3'b0;
     forever
        #5 {p_A, p_B, p_C} = {p_A, p_B, p_C} + 1;
   end
   
   comb_Y1 m_Y1(.Y(p_Y), .A(p_A), .B(p_B), .C(p_C));
   
   initial
   begin
     $monitor($time, "\t ABC = %3b \t %d \t Y1 = %b", {p_A, p_B, p_C}, {p_A, p_B, p_C}, p_Y);
   end
   
 endmodule