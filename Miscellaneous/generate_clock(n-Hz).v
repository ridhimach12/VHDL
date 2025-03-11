module clock_generator #(
    parameter INPUT_FREQ = 50,  // Input clock frequency in MHz
    parameter OUTPUT_FREQ = 10  // Desired output frequency in MHz
)(
    input clk_in,   // Input clock
    input reset,    // Reset signal
    output reg clk_out  // Output clock
);

    integer count;
    localparam DIVISOR = (INPUT_FREQ / (2 * OUTPUT_FREQ));

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            count <= 0;
            clk_out <= 0;
        end
        else begin
            if (count == DIVISOR - 1) begin
                clk_out <= ~clk_out;  // Toggle clock
                count <= 0;
            end
            else
                count <= count + 1;
        end
    end
endmodule


`timescale 1ns/1ps

module tb_clock_generator;

    reg clk_in, reset;
    wire clk_out;

    // Instantiate the clock generator module with 50MHz input and 10MHz output
    clock_generator #(.INPUT_FREQ(50), .OUTPUT_FREQ(10)) uut (
        .clk_in(clk_in),
        .reset(reset),
        .clk_out(clk_out)
    );

    // Generate 50 MHz input clock (Period = 20ns)
    always #10 clk_in = ~clk_in;

    initial begin
        // Initialize
        clk_in = 0;
        reset = 1; #20;
        reset = 0;

        // Run simulation for some time
        #500;
        $finish;
    end

    initial begin
        $monitor("Time = %0t | clk_out = %b", $time, clk_out);
    end

endmodule
