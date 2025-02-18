`timescale 1ns / 1ps

module half_adder(
    input A, B,       
    output SUM, CARRY 
);
    // Gate-level modeling using XOR and AND gates
    xor (SUM, A, B);   
    and (CARRY, A, B); 

endmodule




// Testbench for the Half Adder
module tb_half_adder;
    reg A, B;          // Test inputs
    wire SUM, CARRY;   // Test outputs
    
    // Instantiate the Half Adder module
    half_adder uut (
        .A(A), 
        .B(B), 
        .SUM(SUM), 
        .CARRY(CARRY)
    );
    
    // Stimulus block
    initial begin
        $dumpfile("half_adder.vcd");
        $dumpvars(0, tb_half_adder);
        
        // Test all possible input combinations
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        
        $finish;
    end
    
    // Monitor changes
    initial begin
        $monitor("At time %0t: A = %b, B = %b, SUM = %b, CARRY = %b", $time, A, B, SUM, CARRY);
    end
endmodule