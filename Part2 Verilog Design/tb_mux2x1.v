
// File: tb_mux2x1.v
  `timescale 10ns / 1ns
  `include "mux2x1.v"
  
  module tb_mux2x1();
    
    reg p_sel;
    reg [1:0] p_din;
    wire p_dout;
    
    initial
    begin
      {p_sel, p_din} = 3'b0;
      forever
        #5 {p_sel, p_din} = {p_sel, p_din} + 1;
    end
    
    mux2x1 m_mux(.dout(p_dout), .sel(p_sel), .din(p_din));
    
    initial
    begin
      $monitor($time, "\t sel = %b \t din = %b \t dout = %b", p_sel, p_din, p_dout);
    end
    
  endmodule