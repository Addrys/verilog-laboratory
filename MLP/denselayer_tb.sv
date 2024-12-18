`timescale 1ns / 100ps
module dense_tb();

wire[31:0] out[4];
wire end_layer;
reg [31:0] inputs[0:9];
reg reset, CLK;
layer #(4,10,40,0) UUT(out, end_layer, inputs,reset, 1'b1, CLK);

initial begin
    CLK = 0;
    forever #5 CLK = !CLK;
end

initial begin
    $monitor("Time=%t, out[0]=%h, out[1]=%h, out[2]=%h, out[3]=%h",$time,out[0],out[1],out[2],out[3]);
end

initial begin
    $vcdpluson;
    // Initialize input vectors A and B (4 elements)
    $readmemh("t1.txt", UUT.weights);
    $readmemh("t2.txt", UUT.biases);
    $readmemh("inputs.txt", inputs);
    $display("I1=%h, I2=%h, I3=%h, I4=%h, I5=%h, I6=%h, I7=%h, I8=%h, I9=%h",
    inputs[0],inputs[1],inputs[2],inputs[3],inputs[4],inputs[5],inputs[6],inputs[7],inputs[8],inputs[9]);
    $display("W0=%h, W1=%h, W39=%h",UUT.weights[0],UUT.weights[1],UUT.weights[39]);
    reset = 1;
    #100;
    reset = 0;
    #10000;
    $finish;

end
endmodule