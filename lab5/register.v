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
 ***    -register module implemented with Dff and Mux2_1                 ***
 ***************************************************************************/
`timescale 1ns/1ns

module register(CLK, RST, ENA, DATA, R);
input CLK, RST, ENA;
input [7:0] DATA;   //We need to have every individual bit on Data
output [7:0] R;     //We need to have every individual bit on Q

//aux is a unused wire for qbar output
wire [7:0] aux, DATA_mux;

//Implementation using Array of instances for the MUX and DFF modules
//Mux to implement the enable signal. Enable active at high level
MUX2_1 mux[7:0](DATA_mux, R, DATA, ENA);
//RST doesn't need to be a vector, since it will be the same for every FF
dff d_list[7:0](R, aux, CLK, DATA_mux, RST);

endmodule
