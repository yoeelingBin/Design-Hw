
// File: tb_wavegen.v

  `timescale 10 ns / 1 ns
  `include "wavegen.v"
  
  module tb_wavegen();
    
    wire p_out;
    
    wavegen m_wave(.out(p_out));
    
    initial 
    begin
      $monitor($time, "\t output is %b", p_out);
    end
    
  endmodule