
module mul(out, in_c, in_a);
	input signed[7:0] in_a, in_c;
	output signed[13:0] out;
	
	wire signed[15:0]sum;
	
	assign sum = in_a * in_c;
	assign out = sum[15:2];
	
endmodule