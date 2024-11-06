`timescale 1ns/1ns

//Module definition
module half_adder (
    input a,
    input b,
    output c,
    output s);//Definition of the module port names and tipe I/O

    //We dont need the use of wires for this implementation
    xor (s, a, b);  //XOR gate to calculate the Sum bit
    and (c, a, b);  //AND gate to calculate the Carry-out bit
endmodule