
// File: tb_seq_detect.v

  `timescale 10 ns / 1 ns
  `include "seq_detect.v"
  
  module tb_seq_detect();
    
    wire p_flag;
    reg p_clk, p_rst;
    reg p_din;
    reg [2:0] p_buf;
    
    initial
    begin
      p_clk = 1'b0;
      forever
        #5 p_clk = ~p_clk;
    end
    
    initial
    begin
      p_rst = 1'b1;
      #10 p_rst = 1'b0;
      #10 p_rst = 1'b1;
    end
    
    initial
    begin
      p_din = 1'b0;
      forever
        #5 p_din = ({$random} % 2);
    end
    
    seq_detect m_detect(.flag(p_flag), .clk(p_clk), .din(p_din), .rst_n(p_rst));
    
    initial
    begin
      $monitor($time, "\t rst = %b, din = %b, flag = %b", p_rst, p_din, p_flag);
    end
    
  endmodule