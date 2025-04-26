// Write your modules here!
module muxes(
  			input a_i, b_i, c_i, d_i,
  			input logic [1:0] sel4_i,
			output logic y0_o, y1_o
);
  wire sel2_i;
  assign sel2_i = a_i ^ b_i;
  assign y0_o = (sel2_i) ? (c_i) : (d_i);
  
  always_comb begin
    case (sel4_i)
      2'b00: y1_o = 0;
      2'b01: y1_o = c_i;
      2'b10: y1_o = 0;
      2'b11: y1_o = d_i;
      default: y1_o = 0;
    endcase
  end
  
endmodule