
// File: shift_counter.v
  `timescale 10ns / 1ns
  
  module shift_counter(output reg [7:0] count, input clk, reset);
    
    reg state;
    
    always @(*)
    begin
      case(count)
        8'b0000_0001: state = 0;
        8'b1000_0000: state = 1;
        default: state = state;
      endcase
    end
    
    always @(posedge clk)
    begin
      if (reset)
        count<=8'b1;
      else if (state == 0)
        count<=count<<1;
      else if (state == 1)
        count<=count>>1;
    end
    
  endmodule
  