`timescale 1ns / 100ps

module MLP_tb();

reg CLK, reset;
reg [31:0] image [0:5];
wire [31:0] out [0:1];
MLP UUT(out, image, CLK, reset);

initial begin
    CLK = 0;
    forever #5 CLK = !CLK;
end

initial begin
    $monitor("Time=%t, out[0]=%h, out[1]=%h",$time,out[0],out[1]);
end

initial begin
    $readmemh("./example3/inputs.txt", image);
    $vcdpluson;
    

    reset = 1;
    #100;
    reset = 0;
    #100000;
    $finish;


end


endmodule
