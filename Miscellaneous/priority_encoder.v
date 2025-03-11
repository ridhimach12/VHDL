module priority_encoder (
    input [3:0] in,   // 4-bit input
    output reg [1:0] out, // 2-bit encoded output
    output reg valid  // High if any input is valid
);

    always @(*) begin
        casez (in)
            4'b1???: begin out = 2'b11; valid = 1; end // Highest priority (MSB)
            4'b01??: begin out = 2'b10; valid = 1; end
            4'b001?: begin out = 2'b01; valid = 1; end
            4'b0001: begin out = 2'b00; valid = 1; end
            default: begin out = 2'b00; valid = 0; end // No input is active
        endcase
    end

endmodule


`timescale 1ns/1ps

module tb_priority_encoder;

    reg [3:0] in;
    wire [1:0] out;
    wire valid;

    // Instantiate the priority encoder
    priority_encoder uut (
        .in(in),
        .out(out),
        .valid(valid)
    );

    initial begin
        // Apply test cases
        in = 4'b0000; #10;  // No input active
        in = 4'b0001; #10;  // Lowest priority
        in = 4'b0010; #10;  // Higher priority than 0001
        in = 4'b0100; #10;  // Higher priority than 0010
        in = 4'b1000; #10;  // Highest priority
        in = 4'b1100; #10;  // Highest priority bit is 1, so 11 is selected
        in = 4'b1010; #10;  // 10 takes priority over 0010

        $finish;
    end

    initial begin
        $monitor("Time = %0t | in = %b | out = %b | valid = %b", $time, in, out, valid);
    end

endmodule
