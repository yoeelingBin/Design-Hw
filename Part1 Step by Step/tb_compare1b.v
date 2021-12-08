  `timescale 10ns / 1ns // ??????
  
  `include "compare1b.v"  // ??????????
  
  module tb_compare1b;  // ?????????
  
    wire p_y; // ???????????
    reg p_a, p_b; //???????????
    
    // ?????????????????
    compare1b m_cmp1b(.y(p_y), .b(p_b), .a(p_a));
    
    initial // ??initial????????????
    begin
      p_a = 0; p_b = 0;
      # 100 p_a = 0; p_b = 1;
      # 100 p_a = 1; p_b = 0;
      # 100 p_a = 1; p_b = 1;
      # 100 $stop; // ?????????????????
    end
    
    initial
    begin // ?????????????/??
      $monitor("nowtime: %tns,", $time, "<----> y=%b,b=%b,a=%b", p_y, p_b, p_a);
    end
    
  endmodule