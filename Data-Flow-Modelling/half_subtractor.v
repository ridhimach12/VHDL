module half_subtractor(
    input A, B,
    output Diff, Borrow
);

    // Dataflow modeling
    assign Diff = A ^ B;    // Difference = A XOR B
    assign Borrow = ~A & B; // Borrow = NOT(A) AND B
    
endmodule

module tb_half_subtractor;
    reg A, B;
    wire Diff, Borrow;
    
    // Instantiate the Half Subtractor module
    half_subtractor uut (
        .A(A),
        .B(B),
        .Diff(Diff),
        .Borrow(Borrow)
    );
    
    initial begin
        // Apply test cases
        $monitor("A = %b, B = %b -> Diff = %b, Borrow = %b", A, B, Diff, Borrow);
        
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        
        $finish;
    end
endmodule
