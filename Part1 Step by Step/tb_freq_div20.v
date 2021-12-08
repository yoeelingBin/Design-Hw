`define CLOCK_CYCLE 50

`include "freq_div20.v"

  // test module, no input/output ports list
  module tb_freq_div20;
    
    // use reg var connect to the input port of the tested module
    reg p_clk_10M;
    reg p_rst;
    
    // use wire var connect to the output port of the tested module
    wire p_clk_500K;
    
    // call tested module
    freq_div20 m_fd20(.clk_500K(p_clk_500K),
                      .clk_10M(p_clk_10M),
                      .reset(p_rst));
    
    // generate 10MHz input clock wave
    initial
    begin
      p_clk_10M = 1'b0;
      
      // clock signal reverse per 50ns
      forever
      begin
        #`CLOCK_CYCLE;
        p_clk_10M = ~p_clk_10M;
      end
    end
    
    // generate reset signal
    initial
    begin
      p_rst = 1'b1;
      
      #125 p_rst = 1'b0;
      #960 p_rst = 1'b1;
      
      // after simulator run 10000ns, stop simulation
      #10000 $stop;
    end
    
  endmodule
      
