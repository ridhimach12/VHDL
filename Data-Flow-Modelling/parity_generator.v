module parity_generator(
    input [3:0] data,
    output parity
);

    // Dataflow modeling for Even Parity
    assign parity = ~(data[0] ^ data[1] ^ data[2] ^ data[3]);
    
endmodule

module tb_parity_generator;
    reg [3:0] data;
    wire parity;
    
    // Instantiate the Parity Generator module
    parity_generator uut (
        .data(data),
        .parity(parity)
    );
    
    initial begin
        // Apply test cases
        $monitor("Data = %b -> Parity = %b", data, parity);
        
        data = 4'b0000; #10;
        data = 4'b0001; #10;
        data = 4'b0010; #10;
        data = 4'b0011; #10;
        data = 4'b0100; #10;
        data = 4'b0101; #10;
        data = 4'b0110; #10;
        data = 4'b0111; #10;
        data = 4'b1000; #10;
        data = 4'b1001; #10;
        data = 4'b1010; #10;
        data = 4'b1011; #10;
        data = 4'b1100; #10;
        data = 4'b1101; #10;
        data = 4'b1110; #10;
        data = 4'b1111; #10;
        
        $finish;
    end
endmodule