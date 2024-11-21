/***************************************************************************  
 ***                                                                     ***  
 ***    ECE 526L      Adrian Amarilla Gomez, Fall, 2024                  ***  
 ***                                                                     ***  
 ***    LAB 8                                                            ***  
 ***                                                                     ***  
 ***************************************************************************  
 ***    Filename: RAM.v Created by Adrian, Date 11/19/2024               ***  
 ***    --- Code documentation - 11/19/2024 ---                          ***  
 ***************************************************************************  
 ***   Read Only Memory (ROM) created with a register file. It takes     ***
 ***   far more area than true memory of same capacity, but can operate  ***
 ***   even faster than SRAM, and can be coded in any arbitrary size     ***
 ***************************************************************************/
`timescale 1ns/1ns

 module RAM #( //Define here the parameters to use them on the port declaation
 // Stablish default memory width and depth. This default memory will be 32 Bytes memory (1 Byte width)
    parameter data_size = 8,    //  8 bit width memory
    parameter addr_bits = 5    //  32 addresses 
 )
 (
    inout [data_size - 1 : 0] data,
    input [addr_bits - 1: 0] addr,
    input OE,   // Output enable (Active High)
    input WS,   // Write strobe (posedge)
    input CS   // Chip select (Active Low)
 );
    localparam addr_size = (1 << addr_bits);  

    // Create the memory
    reg [data_size - 1:0] memory[0:addr_size - 1];

    //READ
    //High impedance when Chip not enabled or not output mode.
    assign data = (OE && !CS)? memory[addr] : 'bz; 

    //WRITE 
    always @(posedge WS) begin
        if(!CS && !OE) begin //Write when CS and Output not enabled
            memory[addr] <= data;
        end

    end

 endmodule;