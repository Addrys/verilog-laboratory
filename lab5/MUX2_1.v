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
 ***    -MUX2_1                                                          ***
 ***************************************************************************/
`timescale 100ps/100ps

`define intrinsec_1_input_d 30  //3ns
`define intrinsec_2_input_d 40  //4ns
`define fanout_1_d 5            //0.5ns
`define primary_output_d 20     //2ns

module MUX2_1(OUT, A, B, SEL);
//port declarations
output OUT;
input A, B, SEL;

//internal variable
wire A1, B1, SEL_N;

//Netlist, delays of lab 4
not #(`intrinsec_1_input_d + `fanout_1_d)(SEL_N, SEL);
and #(`intrinsec_2_input_d + `fanout_1_d)(A1, A, SEL_N);
and #(`intrinsec_2_input_d + `fanout_1_d)(B1, B, SEL);
or #(`intrinsec_2_input_d + `primary_output_d)(OUT, A1, B1);
endmodule
