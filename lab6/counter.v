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
 ***    -8-bit up counter module                                         ***
 ***************************************************************************/
`timescale 1ns/1ns

module Counter(DataIn, CLK, RST, ENA, LOAD, Count);
input [7:0] DataIn;
input CLK, RST, ENA, LOAD;
output [7:0] Count;
reg[7:0] Count;

always @(posedge CLK or negedge RST) begin //RST low activation, Asyn
    if(!RST) begin //Async RST neg
        Count <= 0; //Is reg now
    end
    else if(ENA) begin  //Enabled
        if(LOAD) begin  //Load datain
            Count <= DataIn;
        end else begin // Increment
            Count <= Count + 1;
        end
    end
end

endmodule
