
// File: tb_alu.v

 `timescale 10ns / 1ns
 `include "alu.v"
 
 module tb_ALU();
   
   wire p_c_out;
   wire [7:0] p_sum;
   reg [2:0] p_oper;
   reg [7:0] p_a;
   reg [7:0] p_b;
   reg p_c_in;
   
   initial
   begin
     p_a = 8'b1001_1101;
     p_b = 8'b1101_0111;
     {p_c_in, p_oper} = 4'b0;
     forever
        #5 {p_c_in, p_oper} = {p_c_in, p_oper} + 1;
   end
   
   ALU m_alu(.c_out(p_c_out), .sum(p_sum), .oper(p_oper), .a(p_a), .b(p_b), .c_in(p_c_in));
   
   initial
   begin
     $monitor($time,"\t c_in=%b \t a=%8b(%d) \t oper=%d \t b=%8b(%d) \t c_out=%b \t sum=%8b(%d)",
              p_c_in, p_a, p_a, p_oper, p_b, p_b, p_c_out, p_sum, p_sum);
   end
   
 endmodule
 