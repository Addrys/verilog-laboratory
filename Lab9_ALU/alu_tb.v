`timescale 1ns/1ns

module test();

wire[7:0] ALU_OUT;
reg [7:0] A, B;
reg EN, OE, CLK;
reg [3:0] opcode;
wire CF, OF, SF, ZF;
//instantiation
ALU UUT(CLK, EN, OE, opcode, A, B, ALU_OUT, CF, OF, SF, ZF);

initial begin;
    $monitor("time =%t | sub=%b, NEWB=%b | EN=%b, OE=%b | OP: %b | A=%b, B=%b == %b | CF=%b, OF=%b, SF=%b, ZF=%b",
    $time, UUT.SUBSTRACT, UUT.new_B, EN,OE,opcode,A,B,ALU_OUT,CF,OF,SF,ZF);
end
//signals
localparam ALU_ADD = 4'b0010;
localparam ALU_SUB = 4'b0011;
localparam ALU_AND = 4'b0100;
localparam ALU_OR  = 4'b0101;
localparam ALU_XOR = 4'b0110;
localparam ALU_NOT = 4'b0111;

initial begin
    $vcdpluson;
    OE = 1; EN = 1;
    A = 8'b0010_1110; //(46)
    B = 8'b1110_0100; //(-28)
    //First we will test all the Logic operations (AND, OR, XOR, NOT)
    $display("\t\t ------LOGIC OPERATIONS-----------------");
    #5 opcode = ALU_AND; //Output must be -> 0010_0100 | SF = 0 | ZF = 0 | OF,CF: not used -> '0' 
    #5 opcode = ALU_OR;  //Output must be -> 1110_1110 | SF = 1 | ZF = 0 | OF,CF: not used -> '0'
    #5 opcode = ALU_XOR; //Output must be -> 1100_1010 | SF = 1 | ZF = 0 | OF,CF: not used -> '0'
    #5 opcode = ALU_NOT; //Output must be -> 1101_0001 | SF = 1 | ZF = 0 | OF,CF: not used -> '0'
    A = 8'b0000_1010;
    #5 opcode = ALU_AND; //Output must be -> 0000_0000 | SF = 0 | ZF = 1 | OF,CF: not used -> '0' 
    #5 opcode = 4'b1000;    //This opcodes are not defined, wont make any change
    #5 opcode = 4'b1010;
    #5 opcode = 4'b0000;
    #5;
    /////////////////////////////////////////////
    $display("\t\t ------OUTPUT ENABLE-----------------");
    // Now we can test the Output Enable signal     -> Output must be 'Z'
    #5 OE = 0; // Output must be 'Z' regardless of the changes
    #5 A = 8'b1111_0000; //(-82)
    #10 opcode = ALU_XOR;   //(18)
    #5 EN = 0; //Even with enable = 0, output must be 'Z'
    #10 opcode = ALU_AND;   //(74)
    #5 EN = 1;
    #5;
    ////////////////////////////////////////////
    $display("\t\t ------ALU ENABLE-----------------");
    // Now we can test the ALU enable signal    -> Output shouldnt change
    EN = 1; OE = 1; //OE to 1 to show the outputs
    #5 opcode = ALU_AND;
    #5 EN = 0;
    A = 8'b1100_0011;
    #5 opcode = ALU_OR;
    #5 opcode = ALU_NOT; #5;
    ///////////////////////////////////////////////
    $display("\t\t ------ADDITION-----------------");
    //We dont need to define the signed/unsigned numbers, the sum will work the same
    // The OF flag on unsigned values has no meaning, it can be viewed as the CF
    EN = 1;
    A = 8'b0010_1110; //(46)
    B = 8'b1110_0100; //(-28)
    #10 opcode = ALU_ADD;   // output -> (18)
    A = 8'b1010_1110; //(-82)
    B = 8'b1110_0100; //(-28)
    #10 opcode = ALU_ADD;   //output -> (-110)
    A = 8'b1000_0110; //(-122)
    B = 8'b1100_0100; //(-60)
    #10 opcode = ALU_ADD;   //output -> (-182) //this will be OF (If we think they are signed)
    A = 8'b1000_0110; //(-122)
    B = 8'b0111_1010; //(122)
    #10 opcode = ALU_ADD; // output ->  = 0
    #5;
    $display("\t\t ------SUBSTRACTION-----------------");
    A = 8'b0010_1110; //(46)
    B = 8'b1110_0100; //(-28)
    #10 opcode = ALU_SUB;   //output -> (74)
    A = 8'b1010_1110; //(-82)
    B = 8'b1110_0100; //(-28)
    #10 opcode = ALU_SUB;   //output -> (-54)
    A = 8'b1000_0110; //(-122)
    B = 8'b1100_0100; //(-60)
    #10 opcode = ALU_SUB;   //output -> (-62)
    #10 $finish;

end


initial begin
    CLK = 0;
    forever #1 CLK = ~CLK;
end

endmodule;