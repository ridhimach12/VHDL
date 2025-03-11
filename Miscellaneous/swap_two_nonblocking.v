module swap_non_blocking_fixed;
    reg [7:0] a, b, temp;

    initial begin
        a = 8'd15;
        b = 8'd25;

        $display("Before Swap: a = %d, b = %d", a, b);

        // Proper non-blocking swap with temp
        temp <= a;
        a <= b;
        b <= temp;

        #1; // Wait for assignment
        $display("After Swap: a = %d, b = %d", a, b);
    end
endmodule


`timescale 1ns/1ps

module tb_swap_non_blocking;
    reg [7:0] a, b, temp;

    // Instantiate the swap module
    swap_non_blocking_fixed uut();

    initial begin
        a = 8'd15;
        b = 8'd25;

        $display("Before Swap: a = %d, b = %d", a, b);
        
        // Swapping logic (Non-Blocking)
        temp <= a;
        a <= b;
        b <= temp;

        #1; // Wait for the non-blocking assignments to execute
        $display("After Swap: a = %d, b = %d", a, b);

        #10;
        $finish;
    end
endmodule
