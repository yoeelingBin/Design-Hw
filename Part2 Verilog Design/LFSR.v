
// File: LFSR.v
  `timescale 10ns / 1ns
  
  module LFSR(output reg [1:26] q, // 26 bit data output
              input clk, // clock input
              input rst_n, // Synchronous reset input
              input load, // Synchronous load input
              input [1:26] din // 26 bit parallel data input
              );
              
    always @(posedge clk)
    begin
      if (!rst_n)
        q <= 26'b0;
      else if (load)
        q <= (|din) ? din : 26'b1;
      else
        begin
          if (q == 26'b0)
            q = 26'b1;
          else
            begin
              q[2:26] <= q[1:25];
              q[1] <= q[26]^q[8]^q[7]^q[1];
            end
        end
    end
    
  endmodule
  