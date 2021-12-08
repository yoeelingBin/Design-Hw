// File: tb_freq_div2.v

  `timescale 1ns / 100ps
  `define CLOCK_CYCLE 20
  
  module tb_freq_div2;
    
    reg p_clk_in, p_rst;  // connect to input port of tested module
    
    wire p_clk_out;  // connect to output port of tested module
    
    // call tested module
    freq_div2 m_freq_div2(.clk_out(p_clk_out),
                          .clk_in(p_clk_in),
                          .reset(p_rst));
    
    // generate clock signal                     
    initial
    begin
      p_clk_in = 1'b0;
      forever #`CLOCK_CYCLE p_clk_in = ~p_clk_in;
    end
    
    // generate reset signal
    initial
    begin
      p_rst = 1'b0;
      
      #70 p_rst = 1'b1;
      #130 p_rst = 1'b0;
      #110 p_rst = 1;
      #10000 $stop;  // stop simulation
    end
  endmodule
