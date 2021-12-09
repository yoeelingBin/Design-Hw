
// File: filter.v
  `timescale 10ns / 1ns
  
  module filter(output reg sig_out, input clock, reset, sig_in);
    
    reg[0:3] q;
    wire j,k;
    
    assign j = &q[1:3];
    assign k = &(~q[1:3]);
    
    // D latches
    always @(posedge clock or negedge reset)
    begin
      if (!reset)
        q <= 4'b0;
      else
        begin
          q[0] <= sig_in;
          q[1:3] <= q[0:2];
        end
    end
    
    // J-K Filp-Flop
    always @(posedge clock or negedge reset)
    begin
      if (!reset)
        sig_out <= 1'b0;
      else
        begin
          case ({j,k})
            2'b00: sig_out <= sig_out;
            2'b01: sig_out <= 1'b0;
            2'b10: sig_out <= 1'b1;
            2'b11: sig_out <= ~sig_out;
            default: sig_out <= 2'bxx;
          endcase
        end
    end
    
  endmodule
  