module FullAdder (
    input A, B, Cin,
    output Sum, Cout
);
    wire w1, w2, w3;

    // Sum logic: XOR gates
    xor (w1, A, B);
    xor (Sum, w1, Cin);

    // Carry-out logic: AND and OR gates
    and (w2, A, B);
    and (w3, w1, Cin);
    or (Cout, w2, w3);

endmodule

module Testbench;
    reg A, B, Cin;
    wire Sum, Cout;

    FullAdder uut (A, B, Cin, Sum, Cout);

    initial begin
        $monitor("A=%b B=%b Cin=%b | Sum=%b Cout=%b", A, B, Cin, Sum, Cout);
        
        A = 0; B = 0; Cin = 0; #10;
        A = 0; B = 0; Cin = 1; #10;
        A = 0; B = 1; Cin = 0; #10;
        A = 0; B = 1; Cin = 1; #10;
        A = 1; B = 0; Cin = 0; #10;
        A = 1; B = 0; Cin = 1; #10;
        A = 1; B = 1; Cin = 0; #10;
        A = 1; B = 1; Cin = 1; #10;
        
        $finish;
    end
endmodule
