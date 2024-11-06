/***************************************************************************  
 ***                                                                     ***  
 ***    ECE 526L      Adrian Amarilla Gomez, Fall, 2024                  ***  
 ***                                                                     ***  
 ***    LAB5                                                             ***  
 ***                                                                     ***  
 ***************************************************************************  
 ***    Filename: sr_latch.v Created by Adrian, Date 10/12/2024          ***  
 ***    --- Code documentation - 10/12/2024 ---                          ***  
 ***************************************************************************  
 ***    -Testbench for the register module                               ***
 ***************************************************************************/
`timescale 1ns/100ps

`define MONITOR_STR "%d | RST = %b, ENA = %b | DATA = %d | R = %d"
module reg_tb();
    reg CLK, RST, ENA;
    reg [7:0] DATA;
    wire [7:0] R;

    register UUT(CLK,RST,ENA,DATA,R);

    initial begin
        $monitor(`MONITOR_STR, $time, RST, ENA, DATA, R);
    end

    initial begin
        $vcdpluson;
        //ENA active high and RST active low
        CLK = 0; ENA = 1; DATA = 8'd0; RST = 0; //Initialization, RST
        #100 RST = 1; DATA = 8'd15;
        #100 RST = 0; // check the reset
        #100 RST = 1;
        #100 ENA = 0; DATA = 8'd7; // should be ignored, ENA = 1 
        #100 ENA = 0; DATA = 8'd3; // should be ignored, ENA = 1
        #100 ENA = 1; DATA = 8'd5; // should be ignored, ENA = 1 
        #100 RST = 0;   //reset
        #100 RST = 1;
        #100 ENA = 1; DATA = 8'd2; // should be ignored, ENA = 1
        #100 $finish;    
    end

    initial begin
        CLK = 0; // Initial value of clk
        forever #28 CLK = ~CLK; //T = 56ns ~17 Mhz
    end

endmodule
