
// File: tb_LFSR.v
  `timescale 10ns / 1ns
  `include "LFSR.v"
  `define CLOCK_CYCLE 5
  
  module tb_LFSR();
    
    wire [1:26] p_q;
    reg p_clk;
    reg p_rst;
    reg p_load;
    reg [1:26] p_din;
    
    initial
    begin
      p_clk = 1'b0;
      forever
        #`CLOCK_CYCLE p_clk = ~p_clk;
    end
    
    initial
    begin
      p_rst = 1'b0;
      #6 p_rst = 1'b1;
    end
    
    initial
    begin
      p_din = 26'b1001_0110_1011_0100_0111_1110_00;
      p_load = 1'b1;
      #22 p_load = 1'b0;
    end
    
    LFSR m_LSFR(.q(p_q), .clk(p_clk), .rst_n(p_rst), .load(p_load), .din(p_din));
    
    initial
    begin
      $monitor($time, "\t q = %26b", p_q);
    end
    
  endmodule
  