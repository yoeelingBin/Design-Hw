  // File: wavegen.v
  `timescale 10ns / 1ns
  
  module wavegen(output reg out);
    
    initial
    fork
      out = 1'b0;
      #2 out = 1'b1;
      #3 out = 1'b0;
      #12 out = 1'b1;
      #22 out = 1'b0;
      #24 out = 1'b1;
      #27 out = 1'b0;
      #32 out = 1'b1;
    join
    
    initial
    begin
      $monitor($time, "out = %b", out);
    end
      
  endmodule  
