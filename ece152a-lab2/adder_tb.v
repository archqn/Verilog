// the adder_tb is a testbench to test the behavior of the 4-bit adder


module adder_tb;
	reg [3:0] A, B;
	wire [3:0] S;
	reg cin;
	wire cout;
	

	fourBitAdder_FourByOne f0(A, B, cin, S, cout);

	initial begin
		$monitor("Time = %0t, A=%0d, B=%0d, cin=%0d, S=%0d, cout=%0d", 
		$time, A, B, cin, S, cout);

		A=4'b0000; B=4'b0000; cin=0;

		#5 A=4'b0001;
		#5 B=4'b0000;
		
		#10 A=4'b0011;
		#10 B=4'b0011;
		#10 cin=1;


		#15 A=4'b1111;
		#15 B=4'b1111;
		#15 cin=0;

		#20 A=4'b1001;
		#20 B=4'b0100;
		
		#25 $finish;
	end

endmodule
