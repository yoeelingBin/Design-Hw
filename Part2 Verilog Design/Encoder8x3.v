
// File: Encoder8x3.v

  `timescale 10ns / 1ns
  
  module Encoder8x3(output reg[2:0] code, input [7:0] data);
    
    always@(*)
      case(data)
        8'b0000_0001: code = 0;
        8'b0000_0010: code = 1;
        8'b0000_0100: code = 2;
        8'b0000_1000: code = 3;
        8'b0001_0000: code = 4;
        8'b0010_0000: code = 5;
        8'b0100_0000: code = 6;
        8'b1000_0000: code = 7;
        default: code = 3'bx;
      endcase
      
    endmodule