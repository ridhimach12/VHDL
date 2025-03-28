module decoder_3to8(
    input [2:0] in,
    output reg [7:0] out
);
    
    // Behavioral modeling
    always @(*) begin
        case (in)
            3'b000: out = 8'b00000001;
            3'b001: out = 8'b00000010;
            3'b010: out = 8'b00000100;
            3'b011: out = 8'b00001000;
            3'b100: out = 8'b00010000;
            3'b101: out = 8'b00100000;
            3'b110: out = 8'b01000000;
            3'b111: out = 8'b10000000;
            default: out = 8'b00000000;
        endcase
    end
    
endmodule

module tb_decoder_3to8;
    reg [2:0] in;
    wire [7:0] out;
    
    // Instantiate the 3:8 Decoder module
    decoder_3to8 uut (
        .in(in),
        .out(out)
    );
    
    initial begin
        // Apply test cases
        $monitor("Input = %b -> Output = %b", in, out);
        
        in = 3'b000; #10;
        in = 3'b001; #10;
        in = 3'b010; #10;
        in = 3'b011; #10;
        in = 3'b100; #10;
        in = 3'b101; #10;
        in = 3'b110; #10;
        in = 3'b111; #10;
        
        $finish;
    end
endmodule
