`timescale 1ns/1ns

//Module definition
module full_adder (
    input a,
    input b,
    input cin,
    output c,
    output s);//Definition of the module port names and tipe I/O

    wire S1, C1, C2; //Wires to connect the internal modules and gates 

    //design of the Full adder using 2 Half adders and a Or Gate
    half_adder(a, b, C1, S1);   //First stage Half adder
    half_adder(S1, cin, C2, s); //Second stage Half adder
    or (c, C1, C2); //OR gate to perform the SOP of the carry calculated on both stages
endmodule