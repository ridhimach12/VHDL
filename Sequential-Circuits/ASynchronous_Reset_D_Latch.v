module d_latch_async_reset (
    input D,       // Data input
    input clk,     // Clock input
    input rst,     // Asynchronous Reset
    output reg Q,  // Output
    output Q_bar   // Complementary output
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            Q <= 0;   // Reset output to 0
        else
            Q <= D;   // Store D on rising edge of clk
    end

    assign Q_bar = ~Q;  // Complementary output

endmodule


`timescale 1ns/1ps

module tb_d_latch_async_reset;

    reg D, clk, rst;
    wire Q, Q_bar;

    // Instantiate the D latch
    d_latch_async_reset uut (
        .D(D),
        .clk(clk),
        .rst(rst),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    // Generate Clock Signal
    always #5 clk = ~clk;  // Clock period = 10ns

    initial begin
        // Initialize Inputs
        clk = 0;
        rst = 1;  D = 0; #10; // Apply reset
        rst = 0;  D = 1; #10; // Store 1
        D = 0; #10;          // Store 0
        rst = 1; #10;        // Reset again

        $finish;
    end

    initial begin
        $monitor("Time = %0t | D = %b | clk = %b | rst = %b | Q = %b | Q_bar = %b",
                 $time, D, clk, rst, Q, Q_bar);
    end

endmodule
