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
 ***    This module models the circuit required on the part 2 of lab3    ***
 ***************************************************************************/
`timescale 1ns/100ps

`define PRIMARY_OUT     5   //ns (Primary outputs)`
`define FAN_OUT_1       0.5 //ns (one output fanout)
`define FAN_OUT_2       1   //ns (two output fanout)
`define FAN_OUT_3       1.5 //ns (three output fanout)
`define TIME_DELAY_1    1   //ns (one input gates)
`define TIME_DELAY_2    2   //ns (two input gates)
`define TIME_DELAY_3    4   //ns (three input gates)
`define TIME_DELAY_4    5   //ns (four input gates)

//Module definition
module Lab3_or (in1, in2, out1);
    //IO declaration
    input in1, in2;
    output out1;
    //Wires for interconections
    wire NT, A1, A2;
    //Gate level design
    not #(`TIME_DELAY_1 + `FAN_OUT_3) NOT1(NT, in1);
    and #(`TIME_DELAY_2 + `FAN_OUT_1) AND1(A1, in2, in1);
    and #(`TIME_DELAY_2 + `FAN_OUT_1) AND2(A2, in1, NT);
    or  #(`TIME_DELAY_2 + `FAN_OUT_1) OR1(O1,NT,A2);
    nand #(`TIME_DELAY_4 + `PRIMARY_OUT) NAND1(out1, NT, A1, A2, O1);
    
endmodule