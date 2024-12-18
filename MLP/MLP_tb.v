`timescale 1ns / 100ps

module MLP_tb();

reg CLK, reset;
reg [31:0] image [0:783];
wire [31:0] out [0:9];
MLP UUT(out, image, CLK, reset);

initial begin
    CLK = 0;
    forever #5 CLK = !CLK;
end

initial begin
    $monitor("Time=%t, out[0]=%h, out[1]=%h, out[2]=%h, out[3]=%h,out[4]=%h, out[5]=%h, out[6]=%h, out[7]=%h,out[8]=%h, out[9]=%h",$time,out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],out[8],out[9]);
end

initial begin
    $readmemh("image_5_bad.txt", image);
    $vcdpluson;
    
    reset = 1;
    #100;
    reset = 0;
    #100000000;
    $finish;


end


endmodule
