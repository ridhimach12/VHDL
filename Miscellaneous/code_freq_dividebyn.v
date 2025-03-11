module freq_divider #(parameter N = 4) (  // N is the division factor
    input clk,            // Input clock signal
    input rst,            // Active-high reset
    output reg clk_out    // Output divided clock
);

    integer count = 0;  // Counter variable

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 0;
            clk_out <= 0;
        end else begin
            if (count == (N/2 - 1)) begin
                clk_out <= ~clk_out;  // Toggle clock output
                count <= 0;           // Reset counter
            end else begin
                count <= count + 1;   // Increment counter
            end
        end
    end

endmodule

`timescale 1ns/1ps

module tb_freq_divider;
    reg clk;
    reg rst;
    wire clk_out;

    // Instantiate the frequency divider with N=8
    freq_divider #(8) uut (
        .clk(clk),
        .rst(rst),
        .clk_out(clk_out)
    );

    // Clock generation (100 MHz -> 10 ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        rst = 1;
        #10 rst = 0;  // Deassert reset after 10 ns

        // Run simulation for some time
        #200 $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | clk=%b | rst=%b | clk_out=%b", $time, clk, rst, clk_out);
    end
endmodule
