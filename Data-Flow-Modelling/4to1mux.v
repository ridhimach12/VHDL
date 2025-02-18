module mux4to1 (
    input  wire [1:0] sel,  // 2-bit selection input
    input  wire a, b, c, d, // 4 input signals
    output wire y           // Output signal
);

    // Dataflow modeling using continuous assignment
    assign y = (sel == 2'b00) ? a :
               (sel == 2'b01) ? b :
               (sel == 2'b10) ? c :
               (sel == 2'b11) ? d : 1'b0;

endmodule


module tb_mux4to1;
    reg [1:0] sel;
    reg a, b, c, d;
    wire y;

    // Instantiate the multiplexer
    mux4to1 uut (
        .sel(sel),
        .a(a),
        .b(b),
        .c(c),
        .d(d),
        .y(y)
    );

    // Test sequence
    initial begin
        // Test different input combinations
        a = 1; b = 0; c = 1; d = 0;
        
        sel = 2'b00; #10; // Should select 'a'
        sel = 2'b01; #10; // Should select 'b'
        sel = 2'b10; #10; // Should select 'c'
        sel = 2'b11; #10; // Should select 'd'

        // Finish simulation
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time = %0t | sel = %b | a = %b | b = %b | c = %b | d = %b | y = %b", 
                  $time, sel, a, b, c, d, y);
    end
endmodule
