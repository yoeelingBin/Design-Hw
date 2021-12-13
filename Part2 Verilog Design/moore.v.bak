
// File: moore.v
 `timescale 10 ns / 1ns
 
 module moore(output reg flag, input din, clk, rst);
   
   reg [2:0] current_state;
   reg [2:0] next_state;
   
   // state defination
   parameter A = 3'b000;
   parameter B = 3'b001;
   parameter C = 3'b010;
   parameter D = 3'b011;
   parameter E = 3'b100;
   parameter F = 3'b101;
   parameter G = 3'b110;
   parameter H = 3'b111;
   parameter X = 3'bXXX;
   
   // state reset
   always @(posedge clk or posedge rst) 
   begin
	   if (rst)
		   current_state <= X;
	   else
		   current_state <= next_state;
   end

   always @(*) 
   begin
	   case (current_state)
		   A: next_state = din ? A : B;
		   B: next_state = din ? C : X;
		   C: next_state = din ? A : D;
		   D: next_state = din ? E : X;
		   E: next_state = din ? A : F;
		   F: next_state = din ? G : X;
	 	   G: next_state = din ? A : H;
		   H: next_state = din ? G : X;
		   default: next_state = din ? A : X;
	   endcase
   end

   always @(posedge clk or posedge rst) 
   begin
     if (rst)
		   flag = 1'b0;
	   else if (current_state == H)
		   flag = 1'b1;
	   else 
		   flag = 1'b0;
   end

 endmodule 