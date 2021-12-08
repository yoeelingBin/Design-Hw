// File: freq_div2.v

  `timescale 1ns / 100ps
  
  module freq_div2(output reg clk_out,  // port list and declarations
                   input clk_in,
                   input reset);
                   
  always @(posedge clk_in)  // input clock signal posedge
  begin 
    if(!reset) clk_out <= 0;  // sync reset
    else clk_out <= ~clk_out;  // use not block assign
  end
    
  endmodule
