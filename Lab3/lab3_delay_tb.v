/***************************************************************************  
 ***                                                                     ***  
 ***    ECE 526L      Adrian Amarilla Gomez, Fall, 2024                  ***  
 ***                                                                     ***  
 ***    LAB3                                                             ***  
 ***                                                                     ***  
 ***************************************************************************  
 ***    Filename: mux4_1.v Created by Adrian, Date 09/19/2024            ***  
 ***    --- Code documentation - 09/22/2024 ---                          ***  
 ***************************************************************************  
 ***    This module models the test bench created to test the            ***
 ***    functionality of the lab3_delays module, trying all posible Ix   ***
 ***    in I1 and I2 signals and inputs to validate that the module      ***
 ***    is working as intended (Excluding z and x values).               ***
 ***************************************************************************/
`timescale 1ns/1ns

`define MONITOR_STR_1 "%d: in1 = %b, in2 = %b, | out = %b | A1 = %b | A2 = %b | NT = %b" //Macro to print In & Out ports

//TB definition
module Lab3_delays_tb();
    //IO declaration
    reg in1, in2;
    wire out;
    //Instantiate the Unit Under Test
    Lab3_delays UUT(in1, in2, out);

    initial begin
        $monitor(`MONITOR_STR_1, $time, in1, in2, out, UUT.A1, UUT.A2, UUT.NT);
    end

    initial begin
        $vcdpluson; //to save the waveform for latest
        #15 in1 = 1'b0;
            in2 = 1'b0;
        #15 in1 = 1'b0;
            in2 = 1'b1;
        #15 in1 = 1'b1;
            in2 = 1'b0;
        #15 in1 = 1'b1;
            in2 = 1'b1;
	#15 $finish;
    end
endmodule