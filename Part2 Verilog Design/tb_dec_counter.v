
// File: tb_dec_counter.v
  `timescale 10ns / 1ns
  `include "dec_counter.v"
  `define CLOCK_CYCLE 10
  
  module tb_dec_counter();
    
    wire [3:0] p_count;
    reg p_rst, p_clk;
    
    // clk signal
    initial
    begin
      p_clk = 1'b0;
      forever
        #`CLOCK_CYCLE p_clk = ~p_clk;
    end
    
    // reset signal
    initial
    begin
      p_rst = 1'b0;
      #5 p_rst = 1'b1;
      #50 p_rst = 1'b0;
      #100 p_rst = 1'b1;
      #50 p_rst = 1'b0;
    end
    
    dec_counter m_decount(.count(p_count), .clk(p_clk), .reset(p_rst));
    
    initial
    begin
      $monitor($time, "\t reset = %b \t count = %4b \t %d", p_rst, p_count, p_count);
    end
    
  endmodule
      
    