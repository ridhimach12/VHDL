module swap_blocking;
    reg [7:0] a, b;

    initial begin
        a = 8'd10;
        b = 8'd20;
        
        $display("Before Swap: a = %d, b = %d", a, b);
        
        // Swapping using blocking assignment
        a = a ^ b;
        b = a ^ b;
        a = a ^ b;

        $display("After Swap: a = %d, b = %d", a, b);
    end
endmodule


`timescale 1ns/1ps

module tb_swap_blocking;
    reg [7:0] a, b;
    
    // Instantiate the swap module
    swap_blocking uut();

    initial begin
        a = 8'd10;
        b = 8'd20;
        
        $display("Before Swap: a = %d, b = %d", a, b);
        
        // Swapping logic (Blocking)
        a = a ^ b;
        b = a ^ b;
        a = a ^ b;

        $display("After Swap: a = %d, b = %d", a, b);

        #10;
        $finish;
    end
endmodule
