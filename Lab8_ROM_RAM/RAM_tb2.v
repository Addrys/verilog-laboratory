/***************************************************************************  
 ***                                                                     ***  
 ***    ECE 526L      Adrian Amarilla Gomez, Fall, 2024                  ***  
 ***                                                                     ***  
 ***    LAB 8                                                            ***  
 ***                                                                     ***  
 ***************************************************************************  
 ***    Filename: RAM_tb2.v Created by Adrian, Date 11/19/2024           ***  
 ***    --- Code documentation - 11/19/2024 ---                          ***  
 ***************************************************************************  
 ***   RAM testbench 2                                                   ***
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
    //Initialise the memory to specified content
    $readmemh("memory_content.txt", UUT.memory);
    $monitor("%t | Addr (%h) = %b | OE= %b | WS= %b | CS =%b", $time, addr, data, OE, WS ,CS);
end

integer index;
initial begin
    $vcdpluson;
    //Part B&C: Demonstrate the memory inialized and undefined on unspecified locations
    CS = 0; OE = 1; WS = 0;
    //Read all the memory
    $display("---------------MEMORY CONTENT START-----------------");
    for (index = 0; index < 32 ; index = index + 1 ) begin
        #5 addr = index;
    end
    $display("---------------MEMORY CONTENT END-----------------");
    OE = 0;
    //Part D:
    $display("---------------SCRAMBLE BITS -----------------");
    data_in= 'bz;
    for( index = 16; index < 24; index = index + 1) begin
        OE = 1;
        addr = index;
        #1 data_in = {data[0],data[7],data[1],data[6],data[2],data[5],data[3],data[4]};
        #4 OE = 0;
        #5 WS = 1;
        data_in= 'bz;
        #5 WS = 0; 
    end

    //1101_1010 -> 0111_0011 (10)
    //0111_1110 -> 0011_1111
    //1111_0010 -> 0111_0101
    //0010_0110 -> 0010_1100
    //1000_0110 -> 0110_1000
    //1001_0101 -> 1100_1001
    //1111_1101 -> 1101_1111
    //1011_0001 -> 1100_0101 (1e)
    $display("---------------SCRAMBLE BITS CHECK-----------------");
    //Part E:  demonstrates the memory bytes have been successfully scrambled.
    $monitoroff;
    OE = 1;
    #5 addr = 8'h10; #5;
    if(data == 8'b0111_0011) begin //1101_1010 -> 0111_0011
        $display("OK: Memory scramble on Addr=%h = %b", addr, data);
    end else begin
        $display("ERROR: Memory scramble on Addr=%h = %b", addr, data);
    end
    #5 addr = 8'h11; #5;
    if(data == 8'b0011_1111) begin //1101_1010 -> 0111_0011
        $display("OK: Memory scramble on Addr=%h = %b", addr, data);
    end else begin
        $display("ERROR: Memory scramble on Addr=%h = %b", addr, data);
    end
    #5 addr = 8'h12; #5;
    if(data == 8'b0111_0101) begin //1101_1010 -> 0111_0011
        $display("OK: Memory scramble on Addr=%h = %b", addr, data);
    end else begin
        $display("ERROR: Memory scramble on Addr=%h = %b", addr, data);
    end
    #5 addr = 8'h13; #5;
    if(data == 8'b0010_1100) begin //1101_1010 -> 0111_0011
        $display("OK: Memory scramble on Addr=%h = %b", addr, data);
    end else begin
        $display("ERROR: Memory scramble on Addr=%h = %b", addr, data);
    end
    #5 addr = 8'h14; #5;
    if(data == 8'b0110_1000) begin //1101_1010 -> 0111_0011
        $display("OK: Memory scramble on Addr=%h = %b", addr, data);
    end else begin
        $display("ERROR: Memory scramble on Addr=%h = %b", addr, data);
    end
    #5 addr = 8'h15; #5;
    if(data == 8'b1100_1001) begin //1101_1010 -> 0111_0011
        $display("OK: Memory scramble on Addr=%h = %b", addr, data);
    end else begin
        $display("ERROR: Memory scramble on Addr=%h = %b", addr, data);
    end
    #5 addr = 8'h16; #5;
    if(data == 8'b1101_1111) begin //1101_1010 -> 0111_0011
        $display("OK: Memory scramble on Addr=%h = %b", addr, data);
    end else begin
        $display("ERROR: Memory scramble on Addr=%h = %b", addr, data);
    end
    #5 addr = 8'h17; #5;
    if(data == 8'b1100_0101) begin //1101_1010 -> 0111_0011
        $display("OK: Memory scramble on Addr=%h = %b", addr, data);
    end else begin
        $display("ERROR: Memory scramble on Addr=%h = %b", addr, data);
    end


    #5 $finish;


end


endmodule;