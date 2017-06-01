
module adder(sum, a, b, c, d);
	parameter bitwidth = 14;
	input signed[bitwidth - 1:0]a, b, c, d;
	output signed[bitwidth + 1:0]sum;
	
	assign sum = a + b + c + d;
	
endmodule