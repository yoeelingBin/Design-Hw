
// File: tb_Encoder8x3.v
  `timescale 10ns / 1ns
  `include "Encoder8x3.v"
  
  module tb_Encoder8x3();
    
    reg [7:0] p_data;
    wire [2:0] p_code;
    
    initial
    begin
      p_data = 8'b0000_0001;
      forever
        #5 p_data = p_data << 1;
    end
    
    Encoder8x3 m_encoder(.code(p_code), .data(p_data));
    
    initial
    begin
      $monitor($time, "\t data = %8b \t code = %3b", p_data, p_code);
    end
    
  endmodule
