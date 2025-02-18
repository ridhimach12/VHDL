`timescale 1ns / 1ps

// 2-to-4 Decoder using Behavioral Modeling
module decoder_2to4 (
    input  wire [1:0] sel,  // 2-bit select input
    input  wire enable,     // Enable signal
    output reg [3:0] out    // 4-bit output
);

    // Behavioral modeling using always block
    always @(*) begin
        if (enable) begin
            case (sel)
                2'b00: out = 4'b0001;
                2'b01: out = 4'b0010;
                2'b10: out = 4'b0100;
                2'b11: out = 4'b1000;
                default: out = 4'b0000;
            endcase
        end else begin
            out = 4'b0000;  // Output is zero when enable is low
        end
    end
endmodule

// Testbench for 2-to-4 Decoder
module tb_decoder_2to4;
    reg [1:0] sel;
    reg enable;
    wire [3:0] out;

    // Instantiate the decoder
    decoder_2to4 uut (
        .sel(sel),
        .enable(enable),
        .out(out)
    );

    // Test sequence
    initial begin
        // Enable the decoder
        enable = 1;
        
        sel = 2'b00; #10;
        sel = 2'b01; #10;
        sel = 2'b10; #10;
        sel = 2'b11; #10;

        // Disable the decoder
        enable = 0; #10;
        
        // Finish simulation
        $finish;
    end

    // Monitor the output
    initial begin
        $monitor("Time = %0t | Enable = %b | sel = %b | out = %b", $time, enable, sel, out);
    end
endmodule
