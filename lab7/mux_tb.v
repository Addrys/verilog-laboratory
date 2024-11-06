/***************************************************************************  
 ***                                                                     ***  
 ***    ECE 526L      Adrian Amarilla Gomez, Fall, 2024                  ***  
 ***                                                                     ***  
 ***    LAB7                                                             ***  
 ***                                                                     ***  
 ***************************************************************************  
 ***    Filename: mux.v Created by Adrian, Date 10/27/2024               ***  
 ***    --- Code documentation - 10/27/2024 ---                          ***  
 ***************************************************************************  
 ***    -Scalable Mux testbench                                          ***
 ***************************************************************************/

`timescale 1ns/1ns

`define monitor_s "%t  A= %b | B= %b | SEL= %b | OUT_1= %b | OUT_4= %b | OUT_5= %b | OUT_6= %b"
module mux_tb();
reg [5:0] A, B; // Set A and B to the max size
reg SEL;
wire OUT_1;
wire [3:0] OUT_4;
wire [4:0] OUT_5;
wire [5:0] OUT_6;

//Instantiate the mux with default value (1bit)
mux UUT_1b(A, B, SEL, OUT_1);
//Parameter Override by order (4bits)
mux #(4) UUT_4b (A, B, SEL, OUT_4);
//Parameter Override with name (5bits)
mux #(.size (5)) UUT_5b (A, B, SEL, OUT_5);
//defparam statment (6bits)
mux UUT_6b(A, B, SEL, OUT_6);
defparam UUT_6b.size = 6;

initial begin
    $monitor(`monitor_s, $time, A, B, SEL, OUT_1, OUT_4, OUT_5, OUT_6); //monitor for the signals
end
initial begin
    $vcdpluson; //record the waveform in vcd file
    A = 0; B = 63; //Max value and 0, should be all X on every mux
    //we need to try    0 0 = 0
    //                  1 0 = X
    //                  0 1 = X
    //                  1 1 = 1
    #5 A = 6'b000001; B = 6'b111101;
    #5 A = 6'b000010; B = 6'b111110;
    #5 A = 6'b001000; B = 6'b111011;
    #5 A = 6'b000100; B = 6'b110111;
    #5 A = 6'b100000; B = 6'b101111;
    #5 A = 6'b010000; B = 6'b011111;
    //Check the mux when SEL is defined
    #5 A = 6'b011001; B=6'b101110; SEL = 0;
    #5 SEL = 1;    
end
endmodule