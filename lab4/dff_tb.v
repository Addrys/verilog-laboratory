/***************************************************************************  
 ***                                                                     ***  
 ***    ECE 526L      Adrian Amarilla Gomez, Fall, 2024                  ***  
 ***                                                                     ***  
 ***    LAB4                                                             ***  
 ***                                                                     ***  
 ***************************************************************************  
 ***    Filename: sr_latch.v Created by Adrian, Date 10/04/2024          ***  
 ***    --- Code documentation - 10/04/2024 ---                          ***  
 ***************************************************************************  
 ***    -Testbench for D flip flop                                       ***
 ***************************************************************************/
`timescale 100ps/100ps

`define Monitor_str "%d | D= %b, Clr= %b | Q= %b, Qbar= %b"
module dff_tb();
reg clock, data, clear;
wire q, qbar;

dff UUT(q, qbar, clock, data, clear);

//stimulus
initial begin
    //We dont want to monitor CLK, as it will be changing often.
    $monitor(`Monitor_str, $time, data, clear, q, qbar);
end

initial begin
    $vcdpluson;
    $write ("Start  "); // No Newline
    $write ("of the test at"); //We stay on same line
    $display("T = %d", $time); // Print the time at the moment of display 

    //stimulus
    clear = 1; data = 0; // Initial values
    #2000 clear = 0;   //clear
    #2000 clear = 1;
    #2000 data = 1;    //Data 1
    #2000 clear = 0;   //Clear
    #2000 clear = 1;
    #2000 data = 1;    //Data 1
    #2000 data = 0;    //Data 0

    //we can take advantage of strobe to see the final time and values ...
    //after the simulation ends
    $strobe("Simulation ended at T = %d with the final values: Q = %b, Qbar = %b", $time, q, qbar);
    $finish;
end

initial begin
    clock = 0; // Initial value of clk
    forever #225 clock = ~clock; //T = 45ns ~22,2 Mhz
end
endmodule