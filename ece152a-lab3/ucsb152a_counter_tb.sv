module ucsbece152a_counter_tb();

    parameter WIDTH = 3;

    logic clk = 0;
    always #(10) clk = ~clk;

    logic rst;
    logic [WIDTH-1:0] count;

    logic enable_i, dir_i; // part 2

    ucsbece152a_counter #(
        .WIDTH(WIDTH)
    ) DUT (
        .clk(clk),
        .rst(rst),
        .count_o(count),
        // part 2
        .enable_i(enable_i),
        .dir_i(dir_i)
    );

    integer i;
    initial begin
        $display( "Begin simulation.");

        rst = 1;
        @(negedge clk);
        rst = 0;

        // loop 1 with enable and positive counting
        enable_i = 1;
        dir_i = 0;
        for (i=0; i<8; i++) begin 
            if (count != i)
                $display(
                    "Error: expected %d, received %d",
                    $unsigned(i), count
                );
            @(negedge clk);
        end
        rst = 1;
        @(negedge clk);
        if (count != 0)
            $display("Error: expected %d, received %d", 0, count);
        rst = 0;

        // loop 2 without enable
        enable_i = 0;
        dir_i = 0;
        for (i=0; i<8; i++) begin 
            if (count != 0)
                $display(
                    "Error: expected %d, received %d",
                    0, count
                );
            @(negedge clk);
        end
        rst = 1;
        @(negedge clk);
        rst = 0;

        // loop 3 with enable and negative counting
        enable_i = 1;
        dir_i = 1;
        @(negedge clk)
        for for (i = 7; i >= 0; i--) begin 
            if (count != i)
                $display(
                    "Error: expected %d, received %d",
                    i, count
                );
            @(negedge clk);
        end

        rst = 1;
        @(negedge clk);

        $display( "End Simulation.");
        $stop;
    end

endmodule
