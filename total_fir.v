
module total_fir(total_out, Out_st, In_st, rst, clk);
	input clk, rst, In_st;
	output signed[15:0]total_out;
	output Out_st;
	
	wire [4:0]count;
	wire cs;
	wire signed[7:0]c0 = 8'b0_0010001;
	wire signed[7:0]c1 = 8'b1_1010111;
	wire signed[7:0]c2 = 8'b0_0011000;
	wire signed[7:0]c3 = 8'b1_1000110;
	wire signed[7:0]c4 = 8'b1_0001100;
	wire signed[7:0]c5 = 8'b0_1010110;
	wire signed[7:0]c6 = 8'b1_0011010;
	wire signed[7:0]c7 = 8'b0_0111010;
	wire signed[7:0]c8 = 8'b1_1110000;
	wire signed[7:0]c9 = 8'b0_1111111;
	wire signed[7:0]c10 = 8'b0_0001111;
	wire signed[7:0]c11 = 8'b1_1110111;
	wire signed[7:0]c12 = 8'b1_1101011;
	wire signed[7:0]c13 = 8'b1_0110110;
	wire signed[7:0]c14 = 8'b1_0111100;
	wire signed[7:0]c15 = 8'b1_1010000;
	
	wire signed[7:0]in_a;
	
	
	wire signed[7:0]d1_eigh_out, d2_eigh_out, d3_eigh_out, d4_eigh_out, d5_eigh_out, d6_eigh_out,
					d7_eigh_out, d8_eigh_out, d9_eigh_out, d10_eigh_out, d11_eigh_out, d12_eigh_out,
					d13_eigh_out, d14_eigh_out, d15_eigh_out, d16_eigh_out;
	wire signed[13:0]m1_out, m2_out, m3_out, m4_out, m5_out, m6_out, m7_out, m8_out, m9_out, m10_out,
					m11_out, m12_out, m13_out, m14_out, m15_out, m16_out; 
	wire signed[13:0]d1_fort_out, d2_fort_out, d3_fort_out,  d4_fort_out, d5_fort_out, d6_fort_out,
					d7_fort_out, d8_fort_out, d9_fort_out, d10_fort_out, d11_fort_out, d12_fort_out,
					d13_fort_out, d14_fort_out, d15_fort_out, d16_fort_out;
	wire signed[15:0]a1_out, a2_out, a3_out, a4_out;
	wire signed[15:0]d1_sixt_out, d2_sixt_out, d3_sixt_out, d4_sixt_out;
	wire signed[17:0]total_tmp, a5_out;
	
	rom rom_A( .out(in_a), .cs(cs), .address(count), .clk(clk) );
	counter In_counter( .dout(count), .out_st(Out_st), .count_flag(cs), .in_st(In_st), .clk(clk), .rst(rst) );
	
	// ----- First set -----
	dff #(8) dff_1_eigh( .out_a(d1_eigh_out), .in_a(in_a), .clk(clk) );
	mul mul_1( .out(m1_out), .in_c(c15), .in_a(d1_eigh_out) );
	dff #(14) dff_1_fort( .out_a(d1_fort_out), .in_a(m1_out), .clk(clk) );
	
	dff #(8) dff_2_eigh( .out_a(d2_eigh_out), .in_a(d1_eigh_out), .clk(clk) );
	mul mul_2( .out(m2_out), .in_c(c14), .in_a(d2_eigh_out) );
	dff #(14) dff_2_fort( .out_a(d2_fort_out), .in_a(m2_out), .clk(clk) );
	
	dff #(8) dff_3_eigh( .out_a(d3_eigh_out), .in_a(d2_eigh_out), .clk(clk) );
	mul mul_3( .out(m3_out), .in_c(c13), .in_a(d3_eigh_out) );
	dff #(14) dff_3_fort( .out_a(d3_fort_out), .in_a(m3_out), .clk(clk) );
	
	dff #(8) dff_4_eigh( .out_a(d4_eigh_out), .in_a(d3_eigh_out), .clk(clk) );
	mul mul_4( .out(m4_out), .in_c(c12), .in_a(d4_eigh_out) );
	dff #(14) dff_4_fort( .out_a(d4_fort_out), .in_a(m4_out), .clk(clk) );
	
	adder #(14) adder_1( .sum(a1_out), .a(d1_fort_out), .b(d2_fort_out), .c(d3_fort_out), .d(d4_fort_out) );
	dff #(16) dff_1_sixt( .out_a(d1_sixt_out), .in_a(a1_out), .clk(clk) );
	
	// ----- Second set -----
	dff #(8) dff_5_eigh( .out_a(d5_eigh_out), .in_a(d4_eigh_out), .clk(clk) );
	mul mul_5( .out(m5_out), .in_c(c11), .in_a(d5_eigh_out) );
	dff #(14) dff_5_fort( .out_a(d5_fort_out), .in_a(m5_out), .clk(clk) );
	
	dff #(8) dff_6_eigh( .out_a(d6_eigh_out), .in_a(d5_eigh_out), .clk(clk) );
	mul mul_6( .out(m6_out), .in_c(c10), .in_a(d6_eigh_out) );
	dff #(14) dff_6_fort( .out_a(d6_fort_out), .in_a(m6_out), .clk(clk) );
	
	dff #(8) dff_7_eigh( .out_a(d7_eigh_out), .in_a(d6_eigh_out), .clk(clk) );
	mul mul_7( .out(m7_out), .in_c(c9), .in_a(d7_eigh_out) );
	dff #(14) dff_7_fort( .out_a(d7_fort_out), .in_a(m7_out), .clk(clk) );
	
	dff #(8) dff_8_eigh( .out_a(d8_eigh_out), .in_a(d7_eigh_out), .clk(clk) );
	mul mul_8( .out(m8_out), .in_c(c8), .in_a(d8_eigh_out) );
	dff #(14) dff_8_fort( .out_a(d8_fort_out), .in_a(m8_out), .clk(clk) );
	
	adder #(14) adder_2( .sum(a2_out), .a(d5_fort_out), .b(d6_fort_out), .c(d7_fort_out), .d(d8_fort_out) );
	dff #(16) dff_2_sixt( .out_a(d2_sixt_out), .in_a(a2_out), .clk(clk) );
	
	// ----- Third set -----
	dff #(8) dff_9_eigh( .out_a(d9_eigh_out), .in_a(d8_eigh_out), .clk(clk) );
	mul mul_9( .out(m9_out), .in_c(c7), .in_a(d9_eigh_out) );
	dff #(14) dff_9_fort( .out_a(d9_fort_out), .in_a(m9_out), .clk(clk) );
	
	dff #(8) dff_10_eigh( .out_a(d10_eigh_out), .in_a(d9_eigh_out), .clk(clk) );
	mul mul_10( .out(m10_out), .in_c(c6), .in_a(d10_eigh_out) );
	dff #(14) dff_10_fort( .out_a(d10_fort_out), .in_a(m10_out), .clk(clk) );
	
	dff #(8) dff_11_eigh( .out_a(d11_eigh_out), .in_a(d10_eigh_out), .clk(clk) );
	mul mul_11( .out(m11_out), .in_c(c5), .in_a(d11_eigh_out) );
	dff #(14) dff_11_fort( .out_a(d11_fort_out), .in_a(m11_out), .clk(clk) );
	
	dff #(8) dff_12_eigh( .out_a(d12_eigh_out), .in_a(d11_eigh_out), .clk(clk) );
	mul mul_12( .out(m12_out), .in_c(c4), .in_a(d12_eigh_out) );
	dff #(14) dff_12_fort( .out_a(d12_fort_out), .in_a(m12_out), .clk(clk) );
	
	adder #(14) adder_3( .sum(a3_out), .a(d9_fort_out), .b(d10_fort_out), .c(d11_fort_out), .d(d12_fort_out) );
	dff #(16) dff_3_sixt( .out_a(d3_sixt_out), .in_a(a3_out), .clk(clk) );
	
	// ----- Forth set -----
	dff #(8) dff_13_eigh( .out_a(d13_eigh_out), .in_a(d12_eigh_out), .clk(clk) );
	mul mul_13( .out(m13_out), .in_c(c3), .in_a(d13_eigh_out) );
	dff #(14) dff_13_fort( .out_a(d13_fort_out), .in_a(m13_out), .clk(clk) );
	
	dff #(8) dff_14_eigh( .out_a(d14_eigh_out), .in_a(d13_eigh_out), .clk(clk) );
	mul mul_14( .out(m14_out), .in_c(c2), .in_a(d14_eigh_out) );
	dff #(14) dff_14_fort( .out_a(d14_fort_out), .in_a(m14_out), .clk(clk) );
	
	dff #(8) dff_15_eigh( .out_a(d15_eigh_out), .in_a(d14_eigh_out), .clk(clk) );
	mul mul_15( .out(m15_out), .in_c(c1), .in_a(d15_eigh_out) );
	dff #(14) dff_15_fort( .out_a(d15_fort_out), .in_a(m15_out), .clk(clk) );
	
	dff #(8) dff_16_eigh( .out_a(d16_eigh_out), .in_a(d15_eigh_out), .clk(clk) );
	mul mul_16( .out(m16_out), .in_c(c0), .in_a(d16_eigh_out) );
	dff #(14) dff_16_fort( .out_a(d16_fort_out), .in_a(m16_out), .clk(clk) );
	
	adder #(14) adder_4( .sum(a4_out), .a(d13_fort_out), .b(d14_fort_out), .c(d15_fort_out), .d(d16_fort_out) );
	dff #(16) dff_4_sixt( .out_a(d4_sixt_out), .in_a(a4_out), .clk(clk) );
	
	// ----- Last Adder
	adder #(16) adder_5( .sum(a5_out), .a(d1_sixt_out), .b(d2_sixt_out), .c(d3_sixt_out), .d(d4_sixt_out) );
	dff #(18) dff_eighteen( .out_a(total_tmp), .in_a(a5_out), .clk(clk) );
	assign total_out = total_tmp[17:2];
	
endmodule
