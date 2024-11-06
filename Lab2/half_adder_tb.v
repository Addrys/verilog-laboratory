`timescale 1ns/1ns

`define MONITOR_STR "%d: A = %b, B = %b, | C = %b, S = %b" //Macro to print In & Out ports

//TB definition
module half_adder_tb();
    //IO ports declaration
    reg a, b;
    wire c, s;
    //Instantiate the Unit Under Test
    half_adder UUT(a, b, c, s);

    initial begin
        //Start of the monitor system task to see the change on the signals a, b, c or s.
        $monitor(`MONITOR_STR, $time, a, b, c, s);
    end

    initial begin
        $vcdpluson; //to save the waveform for latest
        //We will simulate diferent simulus of all the posible inputs
        //in this case, 4 posible inputs
        #15 a = 1'b0;
            b = 1'b0;
        #15 a = 1'b0;
            b = 1'b1;
        #15 a = 1'b1;
            b = 1'b0;
        #15 a = 1'b1;
            b = 1'b1;
        #15 $finish;
    end
endmodule