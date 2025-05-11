// The four bit adder four by one combines 4 1-bit full adders
// It takes in 2 4-bit numbers a and b as input
// It computes their 4-bit sum and a carry out as output

module fourBitAdder_FourByOne(input [3:0] a, input [3:0] b, input cin, 
	output [3:0] s, output cout);

	wire c0, c1, c2;
	wire s0, s1, s2, s3;

	fullAdder f0(a[0], b[0], cin, s0, c0);
	fullAdder f1(a[1], b[1], c0, s1, c1);
 	fullAdder f2(a[2], b[2], c1, s2, c2);
	fullAdder f3(a[3], b[3], c2, s3, cout);
	
	assign s = {s3, s2, s1, s0};

endmodule
