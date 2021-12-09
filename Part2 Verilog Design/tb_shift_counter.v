
// File: tb_shift_counter.v
  `timescale 10ns / 1ns
  `include "shift_counter.v"
  
  module tb_shift_counter();
    
    wire [7:0] p_count;
    reg p_clk, p_rst;
    
    initial
    begin
      p_clk = 1'b0;
      forever
        #3 p_clk = ~p_clk;
    end
    
    initial 
    begin
      p_rst = 1'b1;
      #5 p_rst = 1'b0;
      #35 p_rst = 1'b1;
      #6 p_rst = 1'b0;
    end
    
    shift_counter m_sctr(.count(p_count), .clk(p_clk), .reset(p_rst));
    
    initial
    begin
      $monitor($time, "\t count = %8b", p_count);
    end
    
  endmodule