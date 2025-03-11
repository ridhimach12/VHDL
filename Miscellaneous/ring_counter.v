module ring_counter(
    input clk,
    input reset,
    output reg [3:0] q
);

    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0001; // Initialize with only one '1'
        else
            q <= {q[2:0], q[3]}; // Shift left and wrap-around
    end

endmodule

`timescale 1ns/1ps

module tb_ring_counter;
    reg clk, reset;
    wire [3:0] q;

    // Instantiate the module
    ring_counter uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    always #5 clk = ~clk; // Generate clock pulse every 5 ns

    initial begin
        // Initialize
        clk = 0;
        reset = 1; #10;
        reset = 0;

        // Run simulation for a few clock cycles
        #50;
        $finish;
    end

    initial begin
        $monitor("Time = %0t | q = %b", $time, q);
    end

endmodule
