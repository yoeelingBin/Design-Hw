
// File: testbench_comb.v

  `timescale 10ns / 1ns
  `include "comb_str.v"
  `include "comb_dataflow.v"
  `include "comb_behavior.v"
  `include "comb_prim.v"
  
  module testbench_comb();
    
    reg p_A, p_B, p_C, p_D;
    wire str, dataflow, behavior, prim;
    
    wire b_A, b_B, b_C, b_D;
    buf b1(b_A, p_A);
    buf b2(b_B, p_B);
    buf b3(b_C, p_C);
    buf b4(b_D, p_D);
    
    initial
    begin
      {p_D, p_C, p_B, p_A} = 4'b0;
      forever
        #5 {p_D, p_C, p_B, p_A} = {p_D, p_C, p_B, p_A} + 1;
    end
    
    comb_str m_str(str, b_A, b_B, b_C, b_D);
    comb_dataflow m_flow(dataflow, b_A, b_B, b_C, b_D);
    comb_behavior m_behav(behavior, b_A, b_B, b_C, b_D);
    comb_prim m_prim(prim, b_A, b_B, b_C, b_D);
    
    initial
    begin
      $monitor(
                $time,
                "\t DCBA = %4b \t str = %b \t dataflow = %b \t behavior = %b \t prim = %b",
                {p_D, p_C, p_B, p_A}, str, dataflow, behavior, prim
              );
    end
    
  endmodule
  