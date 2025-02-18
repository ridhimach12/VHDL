module binary_to_gray (
    input  wire [3:0] binary,  // 4-bit Binary Input
    output wire [3:0] gray     // 4-bit Gray Code Output
);

    // Dataflow modeling using bitwise XOR
    assign gray[3] = binary[3];                   // MSB remains the same
    assign gray[2] = binary[3] ^ binary[2];
    assign gray[1] = binary[2] ^ binary[1];
    assign gray[0] = binary[1] ^ binary[0];       // LSB is XOR of last two bits

endmodule

`timescale 1ns / 1ps

module tb_binary_to_gray;
    reg [3:0] binary;
    wire [3:0] gray;

    // Instantiate the binary-to-gray converter
    binary_to_gray uut (
        .binary(binary),
        .gray(gray)
    );

    // Test sequence
    initial begin
        // Apply different binary inputs and observe outputs
        binary = 4'b0000; #10;
        binary = 4'b0001; #10;
        binary = 4'b0010; #10;
        binary = 4'b0011; #10;
        binary = 4'b0100; #10;
        binary = 4'b0101; #10;
        binary = 4'b0110; #10;
        binary = 4'b0111; #10;
        binary = 4'b1000; #10;
        binary = 4'b1001; #10;
        binary = 4'b1010; #10;
        binary = 4'b1011; #10;
        binary = 4'b1100; #10;
        binary = 4'b1101; #10;
        binary = 4'b1110; #10;
        binary = 4'b1111; #10;

        // Finish simulation
        $finish;
    end

    // Monitor the outputs
    initial begin
        $monitor("Time = %0t | Binary = %b | Gray = %b", $time, binary, gray);
    end
endmodule
