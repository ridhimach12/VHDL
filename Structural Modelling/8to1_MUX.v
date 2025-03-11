module mux4to1 (
    input [3:0] I,   // 4 Inputs
    input [1:0] S,   // 2-bit Select Line
    output Y         // Output
);

    assign Y = (S == 2'b00) ? I[0] :
               (S == 2'b01) ? I[1] :
               (S == 2'b10) ? I[2] :
               I[3];

endmodule


module mux8to1 (
    input [7:0] I,    // 8 Inputs
    input [2:0] S,    // 3-bit Select Line
    output Y          // Output
);

    wire Y0, Y1;  // Intermediate outputs from 4-to-1 MUX

    // Instantiate two 4-to-1 MUX
    mux4to1 MUX0 (.I(I[3:0]), .S(S[1:0]), .Y(Y0));
    mux4to1 MUX1 (.I(I[7:4]), .S(S[1:0]), .Y(Y1));

    // Final 2-to-1 MUX to select between Y0 and Y1
    assign Y = (S[2] == 0) ? Y0 : Y1;

endmodule


`timescale 1ns/1ps

module tb_mux8to1;

    reg [7:0] I;    // Inputs
    reg [2:0] S;    // Select Line
    wire Y;         // Output

    // Instantiate the 8-to-1 MUX
    mux8to1 uut (
        .I(I),
        .S(S),
        .Y(Y)
    );

    initial begin
        // Test different input cases
        I = 8'b10101010; S = 3'b000; #10;  // Expect Y = I[0] = 1
        I = 8'b10101010; S = 3'b001; #10;  // Expect Y = I[1] = 0
        I = 8'b10101010; S = 3'b010; #10;  // Expect Y = I[2] = 1
        I = 8'b10101010; S = 3'b011; #10;  // Expect Y = I[3] = 0
        I = 8'b10101010; S = 3'b100; #10;  // Expect Y = I[4] = 1
        I = 8'b10101010; S = 3'b101; #10;  // Expect Y = I[5] = 0
        I = 8'b10101010; S = 3'b110; #10;  // Expect Y = I[6] = 1
        I = 8'b10101010; S = 3'b111; #10;  // Expect Y = I[7] = 0

        $finish;
    end

    initial begin
        $monitor("Time = %0t | I = %b | S = %b | Y = %b", $time, I, S, Y);
    end

endmodule
