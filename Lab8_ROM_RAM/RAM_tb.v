/***************************************************************************  
 ***                                                                     ***  
 ***    ECE 526L      Adrian Amarilla Gomez, Fall, 2024                  ***  
 ***                                                                     ***  
 ***    LAB 8                                                            ***  
 ***                                                                     ***  
 ***************************************************************************  
 ***    Filename: RAM_tb.v Created by Adrian, Date 11/19/2024            ***  
 ***    --- Code documentation - 11/19/2024 ---                          ***  
 ***************************************************************************  
 ***   RAM testbench 1                                                   ***
 ***************************************************************************/

`timescale 1ns/1ns

module ram_tb();
wire [7:0] data;
reg[4:0] addr;
reg OE;   // Output enable (Active High)
reg WS;   // Write strobe (posedge)
reg CS;   // Chip select (Active Low)

reg [7:0] data_in;

//We drive the data when we are not reading. We can't put WS as its edge, and we
// would miss the edge on the UUT.
assign data = (!OE && !CS)? data_in :'bz; //write

RAM UUT(data, addr, OE, WS, CS);

initial begin
    $monitor("%t | Addr (%h) = %b | OE= %b | WS= %b | CS =%b", $time, addr, data, OE, WS ,CS);
end

integer index;

initial begin
    $vcdpluson;
    $display("---------------PART-A-----------------");
    //Part A: Write and read (individual) secuentialy
    CS = 0; OE = 0; WS = 0;
    for (index = 0; index < 32 ; index = index + 1 ) begin
        //First write to the memory
        addr = index; 
        #4 data_in = index; 
        #1 WS = 1; //Ensure data is stable before WS rising edge
        #5 WS = 0;
         data_in = 'bz;
        #5 OE = 1;
        #5 OE = 0;
    end
    $display("###########################################");
    $display("------------WALKING ONES-FILL--------------");
    CS = 0; OE = 0;
    addr = 9; data_in = 8'b0010_0000;
    #1 WS = 1;
    #5 WS = 0;  data_in = 'bz;
    addr = 10; data_in = 8'b0100_0000;
    #1 WS = 1;
    #5 WS = 0;  data_in = 'bz;
    addr = 11; data_in = 8'b1000_0000;
    #1 WS = 1;
    #5 WS = 0; data_in = 'bz;
    #5;
    $display("------------WALKING ONES-DISPLAY----------");


    //Part B: Demonstrate block i
    //Part F: Walking ones pattern display
    //Output enabled, changing addresses.
    #20 OE = 1; addr = 1;
    #5 addr = 2;
    #5 addr = 4;
    #5 addr = 8;
    #5 addr = 16;
    #5 addr = 9;
    #5 addr = 10;
    #5 addr = 11;
    #5;
    $display("------------DISABLE STATES----------");
    //Part C: Verify disable states.
    //Output disabled
    #20;
    OE = 0;
    #5 addr = 0;
    #5 addr = 1;
    //Chip select disabled
    #20 CS = 1; OE = 1;
    #5 addr = 0;
    #5 addr = 1;
    #5 $finish;

end


endmodule;