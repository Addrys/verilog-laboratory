
`timescale 1ns / 100ps

//Layer will be N inputs, M outputs
`define round_down 2'b11
`define Addition 3'b000
module layer #(
    parameter N_NEURONS = 128,    //Number of neurons of the layer (Will be the number of outputs)
    parameter N_INPUTS = 784,     //Number of inputs or Outputs of previous layer
    parameter N_WEIGHTS  = 100352, // This is precalculated, NEURONS * WEIGHTS
    parameter END_LAYER = 0         // If last layer (1), don't perform ReLUf, Sigmoidf will be performed on Top(MLP) module
)(  //32b FP IEEE 754 format numbers
    output reg [31:0] outputs[0:N_NEURONS-1],
    input [31:0] inputs[0:N_INPUTS-1], 
    input reset,
    input CLK
);
//Load the weights and biases from the trained model, they will be loaded on the top module using the pretrained values
reg [31:0] weights [0:N_WEIGHTS-1];
reg [31:0] biases [0:N_NEURONS-1];
//Each neuron has as input the output value from each neuron in the previous layer
//multiplied by it's weight, that is the Input vector*Weigth vector. 
//Then we add the bias and perform the ReLu function.


//reg [31:0] value = 32'b0;
wire a,b,c,d,e,f,g,h;
reg [31:0] AddResult;
reg [31:0] neuron_bias;
reg [31:0] dotResult;
reg endFlag;
reg [31:0] WeightsVector [0:N_INPUTS-1];
reg myReset;
//reg [31:0] InputsVector [N_INPUTS];

DotProduct #(N_INPUTS) DP (dotResult, endFlag, inputs, WeightsVector, CLK, myReset );

localparam ADD_CYLCES_NEEDED = 15;
integer add_cycles;
fpu adder   (   CLK, `round_down, `Addition,    neuron_bias, dotResult,   AddResult,         a, b, c, d, e, f, g, h);
integer neuron, start_weights, end_weights, i;


reg [1:0] state;
reg [1:0] next_state;
localparam START = 2'b00;
localparam DOTPRODUCT = 2'b01;
localparam ADD_BIAS = 2'b10;
localparam RELU = 2'b11;



always@(posedge CLK) begin
    if(reset) begin
        //dotResult <= 32'b0;
        neuron_bias <= 32'b0;
        myReset <= 1;
        state <= START;
        start_weights <= 0;
        end_weights <= 0;
        neuron <= 0;
        i <= 0;
        add_cycles <= 0;
    end else begin
        state <= next_state;
        myReset <= 0;
        //neuron <= 0;
        if (neuron < N_NEURONS && state == DOTPRODUCT) begin
            //Each neuron
            //1. Calculate the dot product InputsxWeights
            //2. Add bias
            //3. Perform RELU
            start_weights <= neuron * N_INPUTS;
            end_weights <= ((neuron+1) * N_INPUTS) -1;

            for (int i = 0; i < N_INPUTS; i = i + 1) begin
                WeightsVector[i] <= weights[start_weights + i]; //Copy the slice on the array.
            end
            neuron_bias <= biases[neuron];
            
        end
        if(endFlag && !myReset) begin
            //ended Dot Product, now we need to add the BIAS
                //outputs[neuron] <= dotResult;
                //myReset <= 1;
                //neuron <= neuron + 1;

        end

        if(state == ADD_BIAS) begin
            add_cycles = add_cycles + 1;
        end
        if(state == RELU) begin
            outputs[neuron] <= AddResult[31] ? 32'b0 : AddResult;
            //outputs[neuron] <= AddResult[31] ? AddResult : AddResult;
            neuron <= neuron + 1;
            myReset <= 1;
        end
    end
end



always @(*) begin
    case (state)
        START: begin
            next_state = DOTPRODUCT; 
        end
        DOTPRODUCT: begin
            if (endFlag)
                next_state = ADD_BIAS;  // Transition to STATE_2
            else
                next_state = DOTPRODUCT;  // Stay in STATE_1
        end
        
        ADD_BIAS: begin
            if (add_cycles < ADD_CYLCES_NEEDED)
                next_state = ADD_BIAS;  // Transition to STATE_3
            else
                next_state = RELU;  // Stay in STATE_2
        end
        
        RELU: begin
                next_state = START;  // Stay in STATE_3
        end
        
        default: next_state = START;  // Default state (safety)
    endcase
end



endmodule