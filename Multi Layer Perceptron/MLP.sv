//Top module of our MLP
`timescale 1ns / 100ps
module MLP(
    //output reg[7:0] result, 
    //output [31:0] out [0:9],
    //input[31:0] image [0:783],
    output reg [31:0] out [0:9],
    input[31:0] image [0:783],
    input CLK, 
    input reset);


    
    wire layer1_end, layer0_end;
    reg[31:0] out1 [0:127];
    layer #(.N_NEURONS(128),.N_INPUTS(784),.N_WEIGHTS(100352))  InputLayer (out1,layer0_end,image,reset,1'b1,CLK);
    reg[31:0] out2 [0:63];
    layer #(.N_NEURONS(64),.N_INPUTS(128),.N_WEIGHTS(8192))   HiddenLayer (out2,layer1_end,out1,reset,layer0_end,CLK);
    //reg[31:0] out1 [0:127];
    layer #(.N_NEURONS(10),.N_INPUTS(64),.N_WEIGHTS(640),.END_LAYER(1))   OutputLayer (out,_,out2,reset,layer1_end,CLK);


    initial begin
        $readmemh("./TrainedModel/L1_weights.txt", InputLayer.weights);
        $readmemh("./TrainedModel/L1_biases.txt", InputLayer.biases);
        $readmemh("./TrainedModel/L2_weights.txt", HiddenLayer.weights);
        $readmemh("./TrainedModel/L2_biases.txt", HiddenLayer.biases);
        $readmemh("./TrainedModel/L3_weights.txt", OutputLayer.weights);
        $readmemh("./TrainedModel/L3_biases.txt", OutputLayer.biases);
    end


endmodule