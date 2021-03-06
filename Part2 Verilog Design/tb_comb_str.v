
// File: tb_comb_str.v
  `timescale 10ns / 1ns
  `include "comb_str2.v"
  
  module tb_comb_str();
    
    reg p_sel, p_A, p_B, p_C, p_D;
    wire p_y;
    
    initial
    begin
      {p_sel, p_A, p_B, p_C, p_D} = 5'b0;
      forever
        #10 {p_sel, p_A, p_B, p_C, p_D} = {p_sel, p_A, p_B, p_C, p_D} + 1;
    end
    
    comb_str m_comb(.y(p_y), .sel(p_sel), .A(p_A), .B(p_B), .C(p_C), .D(p_D));
    
    initial
    begin
      $monitor($time, "\t sel = %b \t AB = %2b \t CD = %2b \t y = %b", p_sel, {p_A, p_B}, {p_C, p_D}, p_y);
    end
    
  endmodule
    