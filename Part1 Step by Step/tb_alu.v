
// File: tb_alu.v

  `timescale 1ns / 1ns
  
  `include "alu.v"
  
  module tb_alu;
    
    wire [7:0] p_y;
    
    reg [7:0] p_b, p_a;
    reg [2:0] p_op;
    
    parameter NMOD = 256;
    
    integer NUM;
    
    alu m_alu(.y(p_y), .opcode(p_op), .b(p_b), .a(p_a));
    
    initial
    begin
      
      NUM = 5;
      
      p_b = {$random} % NMOD; // give a random number belongs to [0,255]
      p_a = {$random} % NMOD;
      
      p_op = 3'h0;
      
      repeat(NUM)
      begin
        #100;
        p_b = {$random} % NMOD;
        p_a = {$random} % NMOD;
        
        p_op = p_op + 1'b1;
      end
      
      #100 $stop;
    end
  endmodule
