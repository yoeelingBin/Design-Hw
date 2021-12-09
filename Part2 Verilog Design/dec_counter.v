
// File: dec_counter.v
  `timescale 10ns / 1ns
  
  module dec_counter(output reg [3:0] count, input clk, reset);
    
    always @(posedge clk)
    begin
      if (reset)
		    count <= 4'b0;
	    else 
	    begin
		    if (count == 9)
			     count <= 0;
		    else
			     count <= count + 1;
	    end
    end
    
  endmodule