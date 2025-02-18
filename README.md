**Digital Design with Verilog**
This repository contains Verilog implementations of various combinational and sequential circuits using different modeling styles.

**Contents**
Combinational Circuits

   1.Gate-Level Modeling:

        a.)Half Adder, Full Adder
        b.)3-to-8 Decoder
        c.)3-bit Binary to Gray Code Converter
        d.)2-bit Magnitude Comparator
        
    2.Dataflow Modeling:

        a.)4-to-1 Multiplexer
        b.)4-bit Binary to Gray Code Converter
        c.)Half Subtractor
        d.)Parity Generator
        
    3.Behavioral Modeling:

        a.)2-to-4 Decoder
        b.)Full Subtractor
        c.)4-bit ALU
        
     4.Structural Modeling:

        a.)4-bit Ripple Carry Adder
        b.)8-to-1 Multiplexer (Interconnected 4-to-1 MUX)

        
Sequential Circuits
        Asynchronous & Synchronous Reset D Latch
        Asynchronous & Synchronous Reset D Flip-Flop
        Ring and Johnson Counter
        Mod-N Counter
        
Miscellaneous
        Generalized clock signal generator
        Priority Encoder using case statement
        Generalized N:1 Multiplexer (parameterized)
        Frequency divider by n
        Swapping two numbers using blocking & non-blocking assignments
        Finding the largest number among three
        3:8 Decoder using behavioral modeling (case statement)
        
**Getting Started**
      **Prerequisites**
            Verilog simulator (Icarus Verilog, ModelSim, Vivado, or EDA Playground)
      **Run Simulation**
            Clone the repository and simulate using Icarus Verilog:

            git clone <repo-link>
            cd <repo-folder>
            iverilog <filename>.v -o output
            vvp output


**Contributing**
Contributions are welcome! Feel free to add new modules or improve existing implementations.

**License**
This project is licensed under the MIT License.
