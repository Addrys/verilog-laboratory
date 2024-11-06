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
 ***    -8-bit up counter testbench module                               ***
 ***************************************************************************/
`timescale 1ns/1ns

`define MONITOR_STR "%d  Data= %d | RST= %b | ENA= %b | LOAD = %b | COUNT= %d"
module counter_tb();

reg[7:0] Data;
reg CLK, RST, ENA, LOAD;
wire [7:0] Count;

//Top level design instantiation
Top top(Data, CLK, RST, ENA, LOAD, Count);

initial begin
    $monitor(`MONITOR_STR, $time, Data, RST, ENA, LOAD, Count);
end

initial begin
    $vcdpluson;

    ENA = 1; RST = 1; LOAD = 0; Data = 240;
    #67 RST = 0; //Asynchronous reset
    #3   RST = 1; //de-assert RST
    //Counter starts counting after deassert (2 FF delay)
    wait (Count >= 8);
    LOAD = 1; //Load Data (240)
    #22 LOAD = 0; //Deassert Load
    //Reset overrides Load and Enable, (no increment)
    #500 LOAD = 1; ENA = 1; RST = 0;
    //Deassert RST
    #13 RST = 1;
    //Demonstrate it doesn't count without Enable
    #60 ENA = 0;

    #400 $finish;
end

//20ns Period clock generator
initial begin
    CLK <= 0;
    forever begin
        #10 CLK <= ~CLK;
    end
end
endmodule