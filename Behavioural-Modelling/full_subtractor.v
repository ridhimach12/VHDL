module full_subtractor (
    input  wire a,          // Minuend
    input  wire b,          // Subtrahend
    input  wire bin,        // Borrow-in
    output reg diff,        // Difference
    output reg bout         // Borrow-out
);

    // Behavioral modeling using always block
    always @(*) begin
        diff = a ^ b ^ bin;             // Difference calculation
        bout = (~a & b) | ((~a | b) & bin);  // Borrow-out calculation
    end
endmodule


module tb_full_subtractor;
    reg a, b, bin;
    wire diff, bout;

    // Instantiate the Full Subtractor
    full_subtractor uut (
        .a(a),
        .b(b),
        .bin(bin),
        .diff(diff),
        .bout(bout)
    );

    // Test sequence
    initial begin
        // Test all possible input combinations
        a = 0; b = 0; bin = 0; #10;
        a = 0; b = 0; bin = 1; #10;
        a = 0; b = 1; bin = 0; #10;
        a = 0; b = 1; bin = 1; #10;
        a = 1; b = 0; bin = 0; #10;
        a = 1; b = 0; bin = 1; #10;
        a = 1; b = 1; bin = 0; #10;
        a = 1; b = 1; bin = 1; #10;

        // Finish simulation
        $finish;
    end

    // Monitor the outputs
    initial begin
        $monitor("Time = %0t | a = %b | b = %b | bin = %b | diff = %b | bout = %b", 
                  $time, a, b, bin, diff, bout);
    end
endmodule
