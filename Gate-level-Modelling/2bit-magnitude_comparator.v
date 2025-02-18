module MagnitudeComparator2bit (
    input A1, A0,  // 2-bit input A
    input B1, B0,  // 2-bit input B
    output A_gt_B, // A > B
    output A_eq_B, // A = B
    output A_lt_B  // A < B
);
    wire x1, x0, g1, g0, l1, l0;

    // Equality check using XOR and NOR gates
    xor (x1, A1, B1);
    xor (x0, A0, B0);
    nor (A_eq_B, x1, x0);  // A_eq_B = ~(A1 ⊕ B1) & ~(A0 ⊕ B0)

    // Greater than condition using AND, OR gates
    and (g1, A1, ~B1);       // A1 > B1
    and (g0, A0, ~B0, ~x1);  // A0 > B0 when A1 == B1
    or (A_gt_B, g1, g0);     // A > B if (A1 > B1) OR (A1 == B1 AND A0 > B0)

    // Less than condition using AND, OR gates
    and (l1, ~A1, B1);       // A1 < B1
    and (l0, ~A0, B0, ~x1);  // A0 < B0 when A1 == B1
    or (A_lt_B, l1, l0);     // A < B if (A1 < B1) OR (A1 == B1 AND A0 < B0)

endmodule

module Testbench;
    reg A1, A0, B1, B0;
    wire A_gt_B, A_eq_B, A_lt_B;

    // Instantiate the 2-bit comparator
    MagnitudeComparator2bit uut (A1, A0, B1, B0, A_gt_B, A_eq_B, A_lt_B);

    initial begin
        $monitor("A=%b%b B=%b%b | A_gt_B=%b A_eq_B=%b A_lt_B=%b", 
                 A1, A0, B1, B0, A_gt_B, A_eq_B, A_lt_B);
        
        // Test all possible cases
        A1=0; A0=0; B1=0; B0=0; #10;
        A1=0; A0=0; B1=0; B0=1; #10;
        A1=0; A0=1; B1=0; B0=0; #10;
        A1=0; A0=1; B1=0; B0=1; #10;
        A1=1; A0=0; B1=0; B0=0; #10;
        A1=1; A0=0; B1=0; B0=1; #10;
        A1=1; A0=1; B1=0; B0=0; #10;
        A1=1; A0=1; B1=0; B0=1; #10;
        A1=0; A0=0; B1=1; B0=0; #10;
        A1=0; A0=1; B1=1; B0=0; #10;
        A1=1; A0=0; B1=1; B0=0; #10;
        A1=1; A0=1; B1=1; B0=0; #10;
        A1=0; A0=0; B1=1; B0=1; #10;
        A1=0; A0=1; B1=1; B0=1; #10;
        A1=1; A0=0; B1=1; B0=1; #10;
        A1=1; A0=1; B1=1; B0=1; #10;

        $finish;
    end
endmodule
