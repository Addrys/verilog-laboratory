//2 Vectors of size N, calculate the DotProduct
`timescale 1ns / 100ps
`define round_down 2'b11
`define Addition 3'b000
`define Multiplication 3'b010
module DotProduct #(
    parameter VECTOR_SIZE = 50
)(
    output reg [31:0] result,   // Result of the dot poduct
    output reg end_flag,        // To signal the end of the Dot product
    input[31:0] vector_a[0:VECTOR_SIZE-1],
    input [31:0] vector_b [0:VECTOR_SIZE-1],
    input CLK,
    input reset
);

reg[31:0] A, B, sum;
integer i, scaler;
localparam Cycles = 20; //number of CLK cycles for the accumulator to end a operation
reg[31:0] acc_reg;
MultAccumulate accumulator(acc_reg,A, B, sum, CLK);
//assign sum = acc_reg;
always @(posedge CLK) begin
    if(reset) begin
        i <= 0;
        scaler <= 0;
        A <= 32'b0;
        B <= 32'b0;
        sum <= 32'b0;
        end_flag <= 0;

    end else begin
        if (i < VECTOR_SIZE) begin
            // Load inputs to the multiplier
            A <= vector_a[i];
            B <= vector_b[i];
            
            result <= 32'b0;
            if(scaler < Cycles) begin
                scaler = scaler + 1;
            end else begin
                i <= i+1;
                scaler <= 0;
                sum <= acc_reg;
            end
        end else begin
            result <= sum;
            end_flag <= 1; //indicates the end of the dot product
        end
    end
end
endmodule;