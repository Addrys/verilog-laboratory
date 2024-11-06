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
 ***    -Reset synchronizer module                                       ***
 ***************************************************************************/
`timescale 1ns/1ns
//Async assert the RST
//sync de-assert the RST
module AASD(RST, CLK, AASD_reset);
    input CLK, RST;
    output AASD_reset;
    
    reg q1, AASD_reset;

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            q1 <= 1'b0;
            AASD_reset <= 1'b0;
        end else begin
            q1 <= RST;
            AASD_reset <= q1;
        end

    end
endmodule