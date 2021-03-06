
 // File: top.v
 `timescale 10 ns / 1 ns
 `include "mealy.v"
 `include "moore.v"
  
  module top();

    wire flagmealy;
    wire flagmoore;
    reg p_clk;
    reg p_rst;

    reg [6:0] p_buf;
    reg p_din;

    initial 
    begin
	    p_clk = 1'b0;
	    forever
		    #5 p_clk = ~p_clk;
    end

    initial 
    begin
	    p_rst = 1'b0;
	   #2 p_rst = 1'b1;
	   #10 p_rst = 1'b0;
    end

    initial 
    begin
	    {p_buf, p_din} = 8'bxxxxxxx1;
	    #12 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
	    #10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
	    #10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
	    #10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
    	 #10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b1};
     	#10 {p_buf, p_din} = {p_buf[5:0], p_din, 1'b0};
    end

    mealy m_me(.flag(flagmealy), .din(p_din), .clk(p_clk), .rst(p_rst));
    moore m_mo(.flag(flagmoore), .din(p_din), .clk(p_clk), .rst(p_rst));

    initial
    begin
	     $monitor($time, "\t buffer = %8b, mealy = %b, moore = %b",{p_buf, p_din}, flagmealy, flagmoore);
	  end

endmodule