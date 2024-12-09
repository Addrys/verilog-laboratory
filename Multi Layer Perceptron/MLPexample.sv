//Top module of our MLP
`timescale 1ns / 100ps
module MLP(
    //output reg[7:0] result, 
    //output [31:0] out [0:9],
    //input[31:0] image [0:783],
    output [31:0] out [0:1],
    input[31:0] image [0:5],
    input CLK, 
    input reset);


    reg[31:0] out1 [0:3];
    wire layer_end;
    //assign reset_next = reset || reset_out; 
    layer #(.N_NEURONS(4),.N_INPUTS(6),.N_WEIGHTS(24))  InputLayer (out1,layer_end,image,reset,1'b1,CLK);
    layer #(.N_NEURONS(2),.N_INPUTS(4),.N_WEIGHTS(8))   OutputLayer (out,_,out1,reset,layer_end,CLK);


    initial begin
        //$readmemh("./TrainedModel/L1_weights.txt", InputLayer.weights);
        //$readmemh("./TrainedModel/L1_biases.txt", InputLayer.biases);
        //$readmemh("./example/weights.txt", InputLayer.weights);
        //$readmemh("./example/bias.txt", InputLayer.biases);

        $readmemh("./example3/weightsL0.txt", InputLayer.weights);
        $readmemh("./example3/biasL0.txt", InputLayer.biases);
        $readmemh("./example3/weightsL1.txt", OutputLayer.weights);
        $readmemh("./example3/biasL1.txt", OutputLayer.biases);
    end


endmodule