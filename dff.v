
module dff(out_a, in_a, clk);
	parameter bitwidth = 8;
	
	input signed[bitwidth - 1:0]in_a;
	input clk;
	output signed[bitwidth - 1:0]out_a;
	reg signed[bitwidth - 1:0]out_a;
	
	always@(posedge clk)
		out_a <= in_a;
 endmodule
