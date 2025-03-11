module mux_n #(parameter N = 8, parameter WIDTH = 8) ( 
    input  [N-1:0][WIDTH-1:0] in,  // N inputs, each WIDTH bits
    input  [$clog2(N)-1:0] sel,    // Select lines (log2(N) bits)
    output reg [WIDTH-1:0] out     // Output (WIDTH bits)
);

    always @(*) begin
        out = in[sel];  // Select the appropriate input
    end

endmodule


`timescale 1ns/1ps

module tb_mux_n;

    parameter N = 4;  // 4:1 MUX
    parameter WIDTH = 4;

    reg [N-1:0][WIDTH-1:0] in;
    reg [$clog2(N)-1:0] sel;
    wire [WIDTH-1:0] out;

    // Instantiate the MUX
    mux_n #(N, WIDTH) uut (
        .in(in),
        .sel(sel),
        .out(out)
    );

    initial begin
        // Initialize Inputs
        in[0] = 4'b0001; 
        in[1] = 4'b0010; 
        in[2] = 4'b0100; 
        in[3] = 4'b1000; 
        
        // Test different select values
        sel = 2'b00; #10; // Expect out = 0001
        sel = 2'b01; #10; // Expect out = 0010
        sel = 2'b10; #10; // Expect out = 0100
        sel = 2'b11; #10; // Expect out = 1000

        $finish;
    end

    initial begin
        $monitor("Time = %0t | sel = %b | out = %b", $time, sel, out);
    end

endmodule
