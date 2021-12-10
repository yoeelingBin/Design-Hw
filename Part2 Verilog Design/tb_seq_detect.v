
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
      #2 p_rst = 1'b0;
      #10 p_rst = 1'b1;
    end
    
    initial
    begin
      {p_buf, p_din} = 4'bxxx1;
      #12 {p_buf, p_din} = 4'bxx10;
      #10 {p_buf, p_din} = 4'bx101;
      #10 {p_buf, p_din} = 4'b1011;
      #10 {p_buf, p_din} = 4'b0110;
      #10 {p_buf, p_din} = 4'b1101;
      #10 {p_buf, p_din} = 4'b1011;
      #10 {p_buf, p_din} = 4'b0111;
      #10 {p_buf, p_din} = 4'b1110;
      #10 {p_buf, p_din} = 4'b1101;
      #10 {p_buf, p_din} = 4'b1010;
    end
    
    seq_detect m_detect(.flag(p_flag), .clk(p_clk), .din(p_din), .rst_n(p_rst));
    
    //initial
    //begin
    //  $monitor($time, "\t rst = %b, din = %b, flag = %b", p_rst, {p_buf, p_din}, p_flag);
    //end
    
  endmodule