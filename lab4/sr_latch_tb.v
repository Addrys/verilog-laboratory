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
 ***    SR_Latch testbench                                               ***
 ***************************************************************************/
`timescale 100ps/100ps

`define MONITOR_STR_1 "%d: S = %d, R = %d, | Q = %b | Qb = %b " //Macro to print In & Out ports

module sr_latch_tb();
    //regs
    reg[1:0] s, r;
    wire q, q_bar;
    //UUT module initialization
    SR_latch UUT(s[0], s[1], r[0], r[1], q, q_bar);

    initial begin
        $monitor(`MONITOR_STR_1, $time, s, r, q, q_bar);
    end

    initial begin
        //Start stimulus, (Not all posible inputs, unnecessary)
        s = 2'b00; r = 2'b00;   //Initialize all 0
        #150 s = 2'b00; r = 2'b11;   //Set
        #150 s = 2'b11; r = 2'b11;   //Stay
        #150 s = 2'b11; r = 2'b00;   //reset
        #150 s = 2'b11; r = 2'b11;   //stay

        #150 $finish;
        end
endmodule


        
        /*
           s = 2'b00; r = 2'b00;
        #5 s = 2'b00; r = 2'b01;
        #5 s = 2'b00; r = 2'b10;
        #5 s = 2'b00; r = 2'b11;

        #5 s = 2'b01; r = 2'b00;
        #5 s = 2'b01; r = 2'b01;
        #5 s = 2'b01; r = 2'b10;
        #5 s = 2'b01; r = 2'b11;

        #5 s = 2'b10; r = 2'b00;
        #5 s = 2'b10; r = 2'b01;
        #5 s = 2'b10; r = 2'b10;
        #5 s = 2'b10; r = 2'b11;

        #5 s = 2'b11; r = 2'b00;
        #5 s = 2'b11; r = 2'b01;
        #5 s = 2'b11; r = 2'b10;
        #5 s = 2'b11; r = 2'b11;
*/