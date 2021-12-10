
// File: shift_counter.v
  `timescale 10ns / 1ns
  
  module shift_counter(output [7:0] count, input clk, reset);
    
    reg [4:0] state;
    
    always @(posedge clk)
    begin
      if (reset)
        state <= 5'b0;
      else if (state == 5'b1_0001)
        state <= 5'b0;
      else
        state = state + 1;
    end
    
    function [7:0] state2count(input [4:0] state);
      case (state)
        5'b0_0000: state2count = 8'b0000_0001;
        5'b0_0001: state2count = 8'b0000_0001;
        5'b0_0010: state2count = 8'b0000_0001;
        5'b0_0011: state2count = 8'b0000_0001;
        5'b0_0100: state2count = 8'b0000_0010;
        5'b0_0101: state2count = 8'b0000_0100;
        5'b0_0110: state2count = 8'b0000_1000;
        5'b0_0111: state2count = 8'b0001_0000;
        5'b0_1000: state2count = 8'b0010_0000;
        5'b0_1001: state2count = 8'b0100_0000;
        5'b0_1010: state2count = 8'b1000_0000;
        5'b0_1011: state2count = 8'b0100_0000;
        5'b0_1100: state2count = 8'b0010_0000;
        5'b0_1101: state2count = 8'b0001_0000;
        5'b0_1110: state2count = 8'b0000_1000;
        5'b0_1111: state2count = 8'b0000_0100;
        5'b1_0000: state2count = 8'b0000_0010;
        5'b1_0001: state2count = 8'b0000_0001;
        default: state2count = 8'bx;
      endcase
    endfunction
    
    assign count = state2count(state);
    
  endmodule
  