module full_adder (
    input A, B, Cin,  // Inputs
    output Sum, Cout  // Outputs
);
    
    assign Sum  = A ^ B ^ Cin;          // XOR for Sum
    assign Cout = (A & B) | (B & Cin) | (A & Cin); // Carry-out logic

endmodule

module ripple_carry_adder_4bit (
    input [3:0] A, B,  // 4-bit Inputs
    input Cin,         // Carry-in
    output [3:0] Sum,  // 4-bit Sum Output
    output Cout        // Final Carry-out
);

    wire C1, C2, C3;  // Internal carry wires

    // Instantiate 4 Full Adders
    full_adder FA0 (A[0], B[0], Cin,   Sum[0], C1);
    full_adder FA1 (A[1], B[1], C1,    Sum[1], C2);
    full_adder FA2 (A[2], B[2], C2,    Sum[2], C3);
    full_adder FA3 (A[3], B[3], C3,    Sum[3], Cout);

endmodule


`timescale 1ns/1ps

module tb_ripple_carry_adder_4bit;

    reg [3:0] A, B;
    reg Cin;
    wire [3:0] Sum;
    wire Cout;

    // Instantiate the Ripple Carry Adder
    ripple_carry_adder_4bit uut (
        .A(A), .B(B), .Cin(Cin),
        .Sum(Sum), .Cout(Cout)
    );

    initial begin
        // Test Cases
        A = 4'b0001; B = 4'b0011; Cin = 0; #10; // 1 + 3 = 4
        A = 4'b0110; B = 4'b0101; Cin = 0; #10; // 6 + 5 = 11
        A = 4'b1100; B = 4'b1010; Cin = 0; #10; // 12 + 10 = 22
        A = 4'b1111; B = 4'b1111; Cin = 1; #10; // 15 + 15 + 1 = 31

        $finish;
    end

    initial begin
        $monitor("Time = %0t | A = %b | B = %b | Cin = %b | Sum = %b | Cout = %b",
                 $time, A, B, Cin, Sum, Cout);
    end

endmodule
