module divisible_by_5(
    input   logic clk,
    input   logic rst_n,
    input   logic serial_i,
    output  logic div_5_o
);
    typedef enum logic [2:0] {r0, r1, r2, r3, r4} state_t;
    state_t state_d, state_q = r0;
    assign div_5_o = (state_q == r0);

    always_comb begin
        if (serial_i) begin
            case(state_q)
                r0 : state_d = r1;
                r1 : state_d = r3;
                r2 : state_d = r0;
                r3 : state_d = r2;
                r4 : state_d = r4;
            endcase
        end else begin
            case(state_q)
                r0 : state_d = r0;
                r1 : state_d = r2;
                r2 : state_d = r4;
                r3 : state_d = r1;
                r4 : state_d = r3;
            endcase
        end
    end

    always_ff @ (posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state_q <= r0;
        end else begin
            state_q <= state_d;
        end
    end
endmodule