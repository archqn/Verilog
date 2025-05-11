// The full adder takes 2 bits and 1 carry-in as inputs
// and computes the sum and a carry-out as outputs

module fullAdder(input a, input b, input cin, output s, output cout);
	assign s = a ^ b ^ cin;
	assign cout = (a & b) | (cin & (a ^ b));

endmodule
