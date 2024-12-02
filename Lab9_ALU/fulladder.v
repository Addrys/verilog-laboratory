`timescale 1ns/1ns

module FULL_ADDER(
    output S,
    output Cout,
    input A,
    input B,
    input Cin
);

assign S = A ^ B ^ Cin; //XOR gate
assign Cout = (A & B) | (A & Cin) | (B & Cin); //mayority gate

endmodule