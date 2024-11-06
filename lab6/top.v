/***************************************************************************  
 ***                                                                     ***  
 ***    ECE 526L      Adrian Amarilla Gomez, Fall, 2024                  ***  
 ***                                                                     ***  
 ***    LAB6                                                             ***  
 ***                                                                     ***  
 ***************************************************************************  
 ***    Filename: sr_latch.v Created by Adrian, Date 10/20/2024          ***  
 ***    --- Code documentation - 10/20/2024 ---                          ***  
 ***************************************************************************  
 ***    -Top module implementing 8-bit counter and AASD                  ***
 ***************************************************************************/
`timescale 1ns/1ns

module Top(DataIn, CLK, RST, ENA, LOAD, Count);
    input CLK, RST, ENA, LOAD;
    input[7:0] DataIn;
    output[7:0] Count;
    
    wire aasd_reset;// to connect the AASD RST signal with the counter
    //module instantiation
    AASD aasd(RST, CLK, aasd_reset);//Reset synchronizer 
    Counter counter(DataIn, CLK, aasd_reset, ENA, LOAD, Count);
endmodule