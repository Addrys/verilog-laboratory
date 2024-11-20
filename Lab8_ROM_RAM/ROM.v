/***************************************************************************  
 ***                                                                     ***  
 ***    ECE 526L      Adrian Amarilla Gomez, Fall, 2024                  ***  
 ***                                                                     ***  
 ***    LAB 8                                                            ***  
 ***                                                                     ***  
 ***************************************************************************  
 ***    Filename: ROM.v Created by Adrian, Date 11/19/2024               ***  
 ***    --- Code documentation - 11/19/2024 ---                          ***  
 ***************************************************************************  
 ***   Random Access Memory (RAM) created with a register file. It takes ***
 ***   far more area than true memory of same capacity, but can operate  ***
 ***   even faster than SRAM, and can be coded in any arbitrary size     ***
 ***************************************************************************/
 `timescale 1ns/1ns
 
 module ROM #( //Define here the parameters to use them on the port declaation
 // Stablish default memory width and depth. This default memory will be 32 Bytes memory (1 Byte width)
    parameter data_size = 8,    //  8 bit width memory
    parameter addr_bits = 5    //  32 addresses 
 )
 (
    output [data_size - 1 : 0] data,
    input [addr_bits - 1: 0] addr,
    input OE,   // Output enable (Active High)
    input CS   // Chip select (Active Low)
 );
    localparam addr_size = (1 << addr_bits);  

    // Create the memory
    reg [data_size - 1:0] memory[0:addr_size - 1];
    //Load the memory with the contents

    //READ
    //High impedance when Chip not enabled or not output mode.
    assign data = (OE && !CS)? memory[addr] : 'bz; 

 endmodule;