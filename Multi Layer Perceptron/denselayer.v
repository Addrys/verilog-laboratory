
//Layer will be N inputs, M outputs
`define round_down 2'b11
`define Addition 3'b000
`define Multiplication 3'b010
module layer #(
    parameter IN_SIZE = 784,
    parameter OUT_SIZE = 128
)(  //32b FP IEEE 754 format numbers
    output [31:0] outputs[OUT_SIZE],
    input [31:0] inputs[IN_SIZE], 
    input CLK
);
//Load the weights and biases from the trained model
reg [31:0] weights [IN_SIZE][OUT_SIZE];
reg [31:0] biases [OUT_SIZE];
//Each neuron has as input the output value from each neuron in the previous layer
//multiplied by it's weight, that is the Input vector*Weigth vector. 
//Then we add the bias and perform the ReLu function.
integer neuron, i;

reg [31:0] value = 32'd0;
for(neuron = 0; neuron < IN_SIZE; neuron = neuron + 1) begin
    
    for(i = 0; i < OUT_SIZE; i = i + 1) begin
        //Value = Value + (Input[i] * Weight[i])
        fpu( CLK, `round_down, `Addition, opa, opb, out, inf, snan, qnan, ine, overflow, underflow, zero, div_by_zero)

    end



end



endmodule