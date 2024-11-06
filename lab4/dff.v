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
 ***    -Positive Edge-triggered D FlipFlop with clear                   ***
 ***************************************************************************/
`timescale 100ps/100ps

module dff(q, qbar, clock, data, clear);
// Ports definition
input clock, data, clear;
output q, qbar;
////    definition of delays    /////
parameter intrinsec_1_input_d = 30;     //3ns
parameter intrinsec_2_input_d = 40;     //4ns
parameter intrinsec_3_input_d = 50;     //5ns
parameter fanout_1_d  =   5;      //0.5ns
parameter fanout_2_d  =   8;      //0.8ns
parameter fanout_3_d  =   10;     //1ns
parameter primary_output_d  =   20; //2ns
//////////////////////////////////////////////////
// Inputs delay (2 Not gates)
wire cbar, clr, clkbar, clk, dbar, d;
not #(intrinsec_1_input_d + fanout_1_d) not1(cbar,clear);
not #(intrinsec_1_input_d + fanout_1_d) not2(clr,cbar);
not #(intrinsec_1_input_d + fanout_1_d) not3(clkbar,clock);
not #(intrinsec_1_input_d + fanout_1_d) not4(clk,clkbar);
not #(intrinsec_1_input_d + fanout_1_d) not5(dbar,data);
not #(intrinsec_1_input_d + fanout_1_d) not6(d,dbar);
//module SR_latch(s0, s1, r1, r0, q, q_bar);
wire s, sbar, r, rbar;
//NAND1: 2 input, 1 output
//NAND2: 3 input, 3 output
SR_latch sr_s(clr, clk, rbar, rbar, s, sbar);
defparam sr_s.nand1_input_delay = intrinsec_2_input_d;
defparam sr_s.nand1_fanout_delay = fanout_1_d;
defparam sr_s.nand2_fanout_delay = fanout_3_d;
//NAND1: 3 input, 2 output (default values)
//NAND2: 3 input, 2 output (default values)
SR_latch sr_r(s, clk, clr, d, r, rbar);
//NAND1: 2 input, PRIMARY output
//NAND2: 3 input, PRIMARY output
SR_latch sr_q(s, s, clr, r, q, qbar);
defparam sr_q.nand1_input_delay = intrinsec_2_input_d;
defparam sr_q.nand1_fanout_delay = primary_output_d;
defparam sr_q.nand2_fanout_delay = primary_output_d;
endmodule