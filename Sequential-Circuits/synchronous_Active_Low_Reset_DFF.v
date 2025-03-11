module d_ff_sync_reset (
    input D,       // Data input
    input clk,     // Clock input
    input rst_n,   // Synchronous Active-Low Reset
    output reg Q,  // Output
    output Q_bar   // Complementary output
);

    always @(posedge clk) begin
        if (!rst_n)
            Q <= 0;  // Reset output to 0 when clk rises and rst_n = 0
        else
            Q <= D;  // Store D on rising edge of clk
    end

    assign Q_bar = ~Q;  // Complementary output

endmodule


`timescale 1ns/1ps

module tb_d_ff_sync_reset;

    reg D, clk, rst_n;
    wire Q, Q_bar;

    // Instantiate the D Flip-Flop
    d_ff_sync_reset uut (
        .D(D),
        .clk(clk),
        .rst_n(rst_n),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    // Generate Clock Signal
    always #5 clk = ~clk;  // Clock period = 10ns

    initial begin
        // Initialize Inputs
        clk = 0;
        rst_n = 0; D = 0; #10; // Reset applied, Q should be 0
        rst_n = 1; D = 1; #10; // Store 1 at next rising clock
        D = 0; #10;            // Store 0
        rst_n = 0; #10;        // Apply reset (will take effect at next clock)
        rst_n = 1; D = 1; #10; // Store 1 at next rising clock

        $finish;
    end

    initial begin
        $monitor("Time = %0t | D = %b | clk = %b | rst_n = %b | Q = %b | Q_bar = %b",
                 $time, D, clk, rst_n, Q, Q_bar);
    end

endmodule
