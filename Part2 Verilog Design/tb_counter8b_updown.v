
// File: tb_counter8b_updown.v
  `timescale 10ns / 1ns
  `include "counter8b_updown.v"
  
  module tb_counter8b_updown();
    
    wire [7:0] p_count;
    reg p_clk, p_rst, p_dir;
    
    initial
    begin
      p_clk = 1'b0;
      forever
        #2 p_clk = ~p_clk;
    end
    
    initial
    begin
      p_rst = 1'b0;
      p_dir = 1'b1;
      #1 p_rst = 1'b1;
      #4 p_rst = 1'b0;
      #1030 p_rst = 1'b1;
      #5 p_dir = 1'b0;
      #4 p_rst = 1'b0;
    end
    
    counter8b_updown m_c8ud(.count(p_count), .clk(p_clk), .reset(p_rst), .dir(p_dir));
    
    initial
    begin
      $monitor($time, "\t reset = %b \t dir = %b \t count = %8b \t %d", p_rst, p_dir, p_count, p_count);
    end
    
  endmodule
  