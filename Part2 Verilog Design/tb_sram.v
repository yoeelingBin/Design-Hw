
// File: tb_sram.v

  `timescale 10 ns / 1 ns
  `include "sram.v"
  
  module tb_sram();
    
    wire [7:0] p_dout;
    reg [7:0] p_din;
    reg [7:0] p_addr;
    reg p_wr, p_rd, p_cs;
    
    initial
    begin
      p_addr = 8'b1010_1100;
    end
    
    initial
    begin
      p_wr = 1'b0;
      #5 p_wr = 1'b1;
      #5 p_wr = 1'b0;
    end
    
    initial
    begin
      p_cs = 1'b1;
      #3 p_din = 8'b0101_1011;
      #7 p_din = 8'bxxxx_xxxx;
    end
    
    initial
    begin
      p_rd = 1'b1;
      #15 p_rd = 1'b0;
      #5 p_rd = 1'b1;
    end
    
    sram m_sram(.dout(p_dout), .din(p_din), .addr(p_addr), .wr(p_wr), .rd(p_rd), .cs(p_cs));
    
    initial
    begin
      $monitor($time, "\t addr = %d, wr = %b, rd = %b, cs = %b, din = %8b, dout = %8b", p_addr, p_wr, p_rd, p_cs, p_din, p_dout);
    end
    
  endmodule
  