module ucsbece152a_ssdd (
    input   logic [2:0] data_i,
    output  logic [6:0] seven_segment_display_o
);
    /*
    a - - - - - -
    f b | | | | | | | | | |
    g - - - - -
    e c | | | | | | | | | |
    d - - - - -
    */
    always_comb begin
    case (data_i) // abcdefg
    3'h0: seven_segment_display_o = 7'b1111110;
    3'h1: ...
    // todo: finish
    endcase
    end
endmodule

