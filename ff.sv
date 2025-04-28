// ece152a hw2 q10

module ff_reference #(
    parameter WIDTH = 4
) (
    input clk, rst,
    input logic [WIDTH-1:0] data_i,
    output logic [WIDTH-1:0] data_o
);

    logic [WIDTH-1:0] data_d, data_q;
    assign data_o = data_q;
    always_comb begin : data_set
        // data_d is set by combinational logic
        data_d = data_i;
    end
    // async reset
    always_ff @(posedge clk or posedge rst) begin : data_ff
        if (rst) begin
            data_q <= '0;
        end else begin
            data_q <= data_d;
        end
    end

endmodule