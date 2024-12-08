//2 Vectors of size N, calculate the DotProduct
`timescale 1ns / 100ps
`define round_down 2'b11
`define Addition 3'b000
`define Multiplication 3'b010
module MultAccumulate (
    output reg [31:0] result,
    input[31:0] opA,
    input [31:0] opB,
    input[31:0] accumulator,
    input CLK
);
wire [31:0]  mul_result;

wire a, b, c, d, e, f, g, h;
                                    // OP1          OP2         RES
fpu multiplier( CLK, `round_down, `Multiplication,    opA,       opB,       mul_result,     a, b, c, d, e, f, g, h);
fpu adder   (   CLK, `round_down, `Addition,    mul_result, accumulator,   result,         a, b, c, d, e, f, g, h);


endmodule;