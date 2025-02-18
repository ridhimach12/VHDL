module BinaryToGray (
    input B2, B1, B0,  
    output G2, G1, G0  
);
    
    assign G2 = B2;                // MSB remains the same
    xor (G1, B2, B1);              // G1 = B2 ⊕ B1
    xor (G0, B1, B0);              // G0 = B1 ⊕ B0

endmodule

module Testbench;
    reg B2, B1, B0;
    wire G2, G1, G0;

    // Instantiate the Binary to Gray Code Converter
    BinaryToGray uut (B2, B1, B0, G2, G1, G0);

    initial begin
        $monitor("Binary: %b%b%b | Gray: %b%b%b", B2, B1, B0, G2, G1, G0);
        
        // Test all 3-bit binary numbers
        B2 = 0; B1 = 0; B0 = 0; #10;
        B2 = 0; B1 = 0; B0 = 1; #10;
        B2 = 0; B1 = 1; B0 = 0; #10;
        B2 = 0; B1 = 1; B0 = 1; #10;
        B2 = 1; B1 = 0; B0 = 0; #10;
        B2 = 1; B1 = 0; B0 = 1; #10;
        B2 = 1; B1 = 1; B0 = 0; #10;
        B2 = 1; B1 = 1; B0 = 1; #10;
        
        $finish;
    end
endmodule
