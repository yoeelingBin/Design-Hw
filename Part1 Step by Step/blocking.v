
// File: blocking.v

  `timescale 1ns / 1ns
  
  module blocking(c, b, a, clk);
    
    output reg [3:0] c, b;
    
    input [3:0] a;
    input clk;
    
    always @(posedge clk)
    begin
      b = a; // Blocking Assignments
      c = b; // Blcoking Assignments
      
      $display("Blocking Assignments: c = %d, b = %d, a = %d.", c, b, a);
    end
  endmodule