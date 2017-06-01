module counter (clk, rst, count_flag, in_st, dout, out_st);
  input  clk, rst, in_st;
  output [4:0]  dout;
  output count_flag, out_st;
  
  reg count_flag, out_st;
  reg [4:0]     dout;
  
  always@(posedge clk or negedge rst)     
      if (!rst)
         count_flag<=1'b0;
      else if (in_st)
         count_flag<=1'b1;
      else if (dout==5'd31)
         count_flag<=1'b0;
      else
         count_flag<=count_flag;
         
  always@(posedge clk or negedge rst)  
      if (!rst)
         dout<=5'd0;
      else if (in_st)
         dout<=5'd0;
      else if (dout==5'd31)
         dout<=5'd0;
      else if (count_flag)
         dout<=dout+1'b1;
      else
         dout<=dout;
		 
  always@(posedge clk)
	  if(dout==5'd18)
		 out_st<=1'b1;
	  else
		 out_st<=1'b0;
         
endmodule