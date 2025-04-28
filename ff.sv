// ece152a hw2 q10

module ff_reference #(
    parameter WIDTH = 4
) (
    input clk, rst,
    input logic [WIDTH-1:0] data_i,
    output logic [WIDTH-1:0] data_o
);

    logic [WIDTH-1:0] data_d, data_q1, data_q2, data_q3;
      
    // ff1 stores i in data_q1
    always_ff @(posedge clk or posedge rst) begin : data_ff1
        if (rst) begin
            data_q1 <= '0;
        end else begin
            data_q1 <= data_i;
        end
    end
      
    // comb logic between ff1 & ff2: data_q1 => data_d
    always_comb begin : data_set
        data_d = data_q1;
    end
    
    // ff2 stores d in q2
    always_ff @(posedge clk or posedge rst) begin : data_ff2
        if (rst) begin
            data_q2 <= '0;
        end else begin
            data_q2 <= data_d;
        end
    end
  
  	// ff3 stores data_q2 in data_q3
    always_ff @(posedge clk or posedge rst) begin : data_ff3 
      if (rst) begin
        data_q3 <= '0;
      end else begin
        data_q3 <= data_q2;
      end
    end
    
    // wire connects data_q3 to data_o 
    assign data_o = data_q3;

endmodule
