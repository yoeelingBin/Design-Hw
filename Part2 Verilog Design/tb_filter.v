
// File: tb_filter.v
  `timescale 10ns / 1ns
  `include "filter.v"
  
  module tb_filter();
    
    wire p_sig_out;
    reg p_clk, p_rst, p_sig_in;
    reg [15:0] p_data;
    
    initial
    begin
      p_clk = 1'b0;
      forever
        #5 p_clk = ~p_clk;
    end
    
    initial
    begin
      p_rst = 1'b1;
      #1 p_rst = 1'b0;
      #5 p_rst = 1'b1;
    end
    
    initial
    begin
      p_data = 16'b0001_1101_0111_1101;
      p_sig_in = 1'b0;
      #2 p_sig_in = 1'b1;
      forever
        #10 {p_data, p_sig_in} = {p_sig_in, p_data};
    end
    
    filter m_ftr(.sig_out(p_sig_out), .clock(p_clk), .reset(p_rst), .sig_in(p_sig_in));
    
    initial
    begin
      $monitor($time, "\t sig_in = %b \t sig_out = %b", p_sig_in, p_sig_out);
    end
    
  endmodule