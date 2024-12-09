//Top module of our MLP
`timescale 1ns / 100ps
module MLP(
    //output reg[7:0] result, 
    output [31:0] out3 [0:9],
    input[31:0] image [0:783],
    input CLK, 
    input reset);

    reg[31:0] out1 [0:127];
    layer #(.N_NEURONS(128),.N_INPUTS(784),.N_WEIGHTS(100352)) InputLayer (out1,image,reset,CLK);
    
    
    reg[31:0] out2 [0:63];
    layer #(.N_NEURONS(64),.N_INPUTS(128),.N_WEIGHTS(8192)) HiddenLayer1 (out2,out1,reset,CLK);
    
    //reg[31:0] out3 [0:9];
    layer #(.N_NEURONS(10),.N_INPUTS(64),.N_WEIGHTS(640)) HiddenLayer2 (out3,out2,reset,CLK);
    
    //out3
    initial begin
        $readmemh("./TrainedModel/L1_weights.txt", InputLayer.weights);
        $readmemh("./TrainedModel/L1_biases.txt", InputLayer.biases);
        $readmemh("./TrainedModel/L2_weights.txt", HiddenLayer1.weights);
        $readmemh("./TrainedModel/L2_biases.txt", HiddenLayer1.biases);
        $readmemh("./TrainedModel/L3_weights.txt", HiddenLayer2.weights);
        $readmemh("./TrainedModel/L3_biases.txt", HiddenLayer2.biases);
    end


endmodule