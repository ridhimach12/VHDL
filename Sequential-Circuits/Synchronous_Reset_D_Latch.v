module d_latch_sync_reset (
    input D,       // Data input
    input en,      // Enable (acts like clock control)
    input rst,     // Synchronous Reset
    output reg Q   // Output
);

    always @(*) begin
        if (en) begin
            if (rst)
                Q <= 0;  // Reset Q when rst = 1 and en = 1
            else
                Q <= D;  // Store D while en = 1
        end
    end

endmodule


`timescale 1ns/1ps

module tb_d_latch_sync_reset;

    reg D, en, rst;
    wire Q;

    // Instantiate the D Latch
    d_latch_sync_reset uut (
        .D(D),
        .en(en),
        .rst(rst),
        .Q(Q)
    );

    initial begin
        // Initialize Inputs
        en = 0; rst = 0; D = 0; #10;  // No change (en = 0)
        en = 1; rst = 1; D = 1; #10;  // Reset (Q should be 0)
        rst = 0; D = 1; #10;          // Store 1 (since en = 1)
        D = 0; #10;                   // Store 0
        en = 0; D = 1; #10;           // No change (en = 0)
        en = 1; rst = 1; #10;         // Reset again

        $finish;
    end

    initial begin
        $monitor("Time = %0t | D = %b | en = %b | rst = %b | Q = %b", 
                 $time, D, en, rst, Q);
    end

endmodule
