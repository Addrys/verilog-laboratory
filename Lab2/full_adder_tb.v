`timescale 1ns/1ns

`define MONITOR_STR "%d: A = %b, B = %b, Cin = %b | Cout = %b, S = %b" //Macro to print In & Out ports

//TB definition
module full_adder_tb();
    //IO ports declaration
    reg a, b, cin;
    wire cout, s;
    //Instantiate the Unit Under Test
    full_adder UUT(a, b, cin, cout, s);

    initial begin
        //Start of the monitor system task to see the change on the signals a, b, c or s.
        $monitor(`MONITOR_STR, $time, a, b, cin, cout, s);
    end

    initial begin
        $vcdpluson; //to save the waveform for latest
        //We will simulate diferent simulus of all the posible inputs
        //in this case, 4 posible inputs
        #15 a   = 1'b0;
            b   = 1'b0;
            cin = 1'b0;
        #15 a   = 1'b0;
            b   = 1'b1;
            cin = 1'b0;
        #15 a   = 1'b1;
            b   = 1'b0;
            cin = 1'b0;
        #15 a   = 1'b1;
            b   = 1'b1;
            cin = 1'b0;
        #15 a   = 1'b0;
            b   = 1'b0;
            cin = 1'b1;
        #15 a   = 1'b0;
            b   = 1'b1;
            cin = 1'b1;
        #15 a   = 1'b1;
            b   = 1'b0;
            cin = 1'b1;
        #15 a   = 1'b1;
            b   = 1'b1;
            cin = 1'b1;
        #15 $finish;
    end
endmodule