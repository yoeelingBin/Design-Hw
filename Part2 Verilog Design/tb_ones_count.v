
// File: tb_ones_count.v
  `timescale 10 ns / 1ns
  `include "ones_count.v"
  
  module tb_ones_count();
    
    reg [7:0] p_data;
    wire [3:0] p_count;
    
    reg [7:0] mask;
    
    initial
    begin
      p_data =  8'b0;
      mask = 8'b1;
      forever
      begin
        #5 p_data = p_data | mask;
        mask = mask << 1;
      end
    end
    
    ones_count m_count(.count(p_count), .dat_in(p_data));
    
    initial
    begin
      $monitor($time, "\t data = %8b \t count = %b \t %d", p_data, p_count, p_count);
    end
    
  endmodule