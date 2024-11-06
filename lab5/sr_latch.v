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
 ***    -SR_latch implemented with NAND gates                            ***
 ***************************************************************************/
`timescale 100ps/100ps

module SR_latch(s0, s1, r1, r0, q, q_bar);
    //constants of the module as parameters so we can redefine them.
    parameter nand1_input_delay = 50; //default value, 3 input NAND 1
    parameter nand1_fanout_delay = 8;// default value, 2 out NAND 1 
    parameter nand2_input_delay = 50; //default value, 3 input NAND 2 
    parameter nand2_fanout_delay = 8;// default value, 2 out NAND 2

    //Ports declaration
    input s0, s1, r1, r0;
    output q, q_bar;

    //structural design of the SR latch with 2 NAND gates
    nand #(nand1_input_delay + nand1_fanout_delay) nand1(q, s0, s1, q_bar);
    nand #(nand2_input_delay + nand2_fanout_delay) nand2(q_bar, r0, r1, q);

endmodule