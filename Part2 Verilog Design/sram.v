
// File: sram.v
  `timescale 10ns / 1ns
  
  module sram(output [7:0] dout,
              input [7:0] din,
              input [7:0] addr,
              input wr,
              input rd,
              input cs);
      
    reg [7:0] mem[0:255];
    reg [7:0] data;
    
    assign dout = (cs && !rd) ? data: 8'bz;
    
    // write
    always @(posedge wr)
    begin
      if (cs && rd && wr)
        mem[addr] <= din;
    end
    
    // read
    always @(negedge rd)
    begin
      if (cs && !rd)
        data <= mem[addr];
    end
    
  endmodule
  