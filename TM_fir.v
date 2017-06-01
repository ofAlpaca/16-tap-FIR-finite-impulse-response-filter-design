
module TM_fir();
	reg clk, In_st, rst;
	wire signed[15:0]out;
	wire Out_st;
	
	total_fir TM( .total_out(out), .Out_st(Out_st), .In_st(In_st), .rst(rst), .clk(clk));
	
	always #25 clk = ~clk;
	initial begin
		clk = 1'b1;
		In_st = 1'b0;
		rst = 1'b1;
		#10
		rst = 1'b0;
		#15
		rst = 1'b1;
		In_st = 1'b1;
		#50
		In_st = 1'b0;
	end
endmodule