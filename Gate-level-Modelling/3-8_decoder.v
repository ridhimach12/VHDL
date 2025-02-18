module Decoder3to8 (
    input A, B, C,
    output D0, D1, D2, D3, D4, D5, D6, D7
);
    wire A_n, B_n, C_n;

    // Generate complements of inputs
    not (A_n, A);
    not (B_n, B);
    not (C_n, C);

    // Decoder logic using AND gates
    and (D0, A_n, B_n, C_n); // 000 -> D0
    and (D1, A_n, B_n, C);   // 001 -> D1
    and (D2, A_n, B, C_n);   // 010 -> D2
    and (D3, A_n, B, C);     // 011 -> D3
    and (D4, A, B_n, C_n);   // 100 -> D4
    and (D5, A, B_n, C);     // 101 -> D5
    and (D6, A, B, C_n);     // 110 -> D6
    and (D7, A, B, C);       // 111 -> D7

endmodule

module Testbench;
    reg A, B, C;
    wire D0, D1, D2, D3, D4, D5, D6, D7;

    // Instantiate the decoder
    Decoder3to8 uut (A, B, C, D0, D1, D2, D3, D4, D5, D6, D7);

    initial begin
        $monitor("A=%b B=%b C=%b | D0=%b D1=%b D2=%b D3=%b D4=%b D5=%b D6=%b D7=%b", 
                 A, B, C, D0, D1, D2, D3, D4, D5, D6, D7);
        
        // Test all input combinations
        A = 0; B = 0; C = 0; #10;
        A = 0; B = 0; C = 1; #10;
        A = 0; B = 1; C = 0; #10;
        A = 0; B = 1; C = 1; #10;
        A = 1; B = 0; C = 0; #10;
        A = 1; B = 0; C = 1; #10;
        A = 1; B = 1; C = 0; #10;
        A = 1; B = 1; C = 1; #10;
        
        $finish;
    end
endmodule
