module mod_n_counter #(parameter N = 10) (  // Default: MOD-10 Counter
    input clk,       // Clock signal
    input rst,       // Active-high Reset
    output reg [$clog2(N)-1:0] count // Output count (log2(N) bits)
);
    
    always @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 0;  // Reset counter
        else if (count == N-1) 
            count <= 0;  // Reset when max count reached
        else 
            count <= count + 1;  // Increment
    end

endmodule



`timescale 1ns/1ps

module tb_mod_n_counter;
    
    parameter N = 5;  // Set MOD value
    
    reg clk, rst;
    wire [$clog2(N)-1:0] count;
    
    // Instantiate the counter module
    mod_n_counter #(N) uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    // Generate Clock (Period = 10ns)
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        rst = 1; #10;  // Apply Reset
        rst = 0;
        
        #100;  // Run for some time
        
        $finish;
    end
    
    initial begin
        $monitor("Time = %0t | Count = %d", $time, count);
    end

endmodule
