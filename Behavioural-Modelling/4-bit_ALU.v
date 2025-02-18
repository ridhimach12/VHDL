module alu_4bit (
    input  wire [3:0] a, b,    // 4-bit Inputs
    input  wire [2:0] op,      // 3-bit Operation Select
    output reg  [3:0] result,  // 4-bit Output Result
    output reg carry_out       // Carry/Borrow flag
);

    // Behavioral modeling using always block
    always @(*) begin
        case (op)
            3'b000: {carry_out, result} = a + b;   // Addition
            3'b001: {carry_out, result} = a - b;   // Subtraction
            3'b010: result = a & b;               // Bitwise AND
            3'b011: result = a | b;               // Bitwise OR
            3'b100: result = a ^ b;               // Bitwise XOR
            3'b101: result = ~a;                  // Bitwise NOT (on A)
            3'b110: result = a << 1;              // Left Shift A
            3'b111: result = a >> 1;              // Right Shift A
            default: result = 4'b0000;
        endcase
    end
endmodule

`timescale 1ns / 1ps

module tb_alu_4bit;
    reg [3:0] a, b;
    reg [2:0] op;
    wire [3:0] result;
    wire carry_out;

    // Instantiate the ALU
    alu_4bit uut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .carry_out(carry_out)
    );

    // Test sequence
    initial begin
        a = 4'b0101; b = 4'b0011; 
        
        op = 3'b000; #10;  // Addition
        op = 3'b001; #10;  // Subtraction
        op = 3'b010; #10;  // AND
        op = 3'b011; #10;  // OR
        op = 3'b100; #10;  // XOR
        op = 3'b101; #10;  // NOT (A)
        op = 3'b110; #10;  // Left Shift A
        op = 3'b111; #10;  // Right Shift A

        // Finish simulation
        $finish;
    end

    // Monitor the output
    initial begin
        $monitor("Time = %0t | a = %b | b = %b | op = %b | result = %b | carry_out = %b", 
                  $time, a, b, op, result, carry_out);
    end
endmodule
