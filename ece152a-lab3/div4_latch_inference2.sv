module div4 #(
    parameter WIDTH = 4
) (
    input logic [WIDTH-1:0]     data_i,
    input logic                 en_i,
    input logic                 clk,
    output logic [WIDTH-1:0]    data_o,
    output logic                valid_o
);

    // changes start
    logic [WIDTH-1:0]   data_d, data_q;
    assign data_o = data_q;
    // changes end

    always_comb begin
        // changes start
        data_d = data_q;
        // changes end
    
        if (en_i) begin
            // change data_o -> data_d
            data_d = WIDTH'(data_i[WIDTH-1:2]);
            valid_o = 1'b1;
        end else begin
            valid_o = 1'b0;
        end
    end

    // changes start
    always_ff @ (posedge clk) begin
        data_q <= data_d;
    end
    // changes end

endmodule