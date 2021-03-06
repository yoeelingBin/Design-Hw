// File: freq_div20.v

  module freq_div20(output reg clk_500K,
                    input clk_10M,
                    input reset);
  // define counter var:19 = 5'b1_0011
  // use bit width 5 reg type var to save counter value
  reg [4:0] cnt;
  
  always @(posedge clk_10M)
  begin
    if(!reset) // sync reset, low level active
    begin
      clk_500K <= 1'b0;
      cnt <= 5'b0;
    end
    else
    begin
      // judge depend on counter value,to confirm whether clk_500K reverse                
      if(cnt == 5'd19)
      begin
        cnt <= 5'b0;
        clk_500K <= ~clk_500K;
      end
      else
        cnt <= cnt + 1'b1;
      end
    end // EOF always
    
  endmodule
