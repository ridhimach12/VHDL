module largest_number(
    input [7:0] a, 
    input [7:0] b, 
    input [7:0] c, 
    output reg [7:0] max
);
    
    always @(*) begin
        if (a >= b && a >= c)
            max = a;
        else if (b >= a && b >= c)
            max = b;
        else
            max = c;
    end

endmodule


`timescale 1ns/1ps

module tb_largest_number;
    reg [7:0] a, b, c;
    wire [7:0] max;

    // Instantiate the module
    largest_number uut (
        .a(a), 
        .b(b), 
        .c(c), 
        .max(max)
    );

    initial begin
        // Apply test cases
        a = 8'd10; b = 8'd25; c = 8'd15; #10;
        $display("Input: a=%d, b=%d, c=%d -> Max=%d", a, b, c, max);

        a = 8'd50; b = 8'd20; c = 8'd30; #10;
        $display("Input: a=%d, b=%d, c=%d -> Max=%d", a, b, c, max);

        a = 8'd5; b = 8'd5; c = 8'd5; #10;
        $display("Input: a=%d, b=%d, c=%d -> Max=%d", a, b, c, max);

        a = 8'd7; b = 8'd7; c = 8'd9; #10;
        $display("Input: a=%d, b=%d, c=%d -> Max=%d", a, b, c, max);

        $finish;
    end
endmodule
