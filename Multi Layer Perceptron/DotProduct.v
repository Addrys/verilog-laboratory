//2 Vectors of size N, calculate the DotProduct
`define round_down 2'b11
`define Addition 3'b000
`define Multiplication 3'b010
module DotProduct (
    parameter VECTOR_SIZE = 10
)(
    output [31:0] result
    input [31:0] vector_a [VECTOR_SIZE],
    input [31:0] vector_b [VECTOR_SIZE],
    input CLK
);
wire [31:0] add_result, mul_result;
reg [31:0] sumA; reg [31:0] sumB;
reg [31:0] mulA; reg [31:0] mulB;
fpu multiplier( CLK, round_down, Multiplication, mulA, mulB, mul_result, _, _, _, _, _, _, _, _);
fpu adder( CLK, round_down, Addition, sumA, sumB, result, _, _, _, _, _, _, _, _);

reg [31:0] sum = 32'd0; // Will be the result
reg [31:0] value = 32'd0;

integer i;
always @ * begin
    for(i = 0; i < VECTOR_SIZE; i = i + 1) begin
        mulA => vector_a[i];
        mulB => vector_b[i];
        

    end

end

endmodule;