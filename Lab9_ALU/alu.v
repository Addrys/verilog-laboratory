`timescale 1ns/1ns
// Complement 2 ALU for arithmetic.
module ALU #(
    parameter WIDTH = 8
)(
    input CLK,
    input EN,   //Enable, if !EN, no change on ALU_OUT (prev state)
    input OE,   //Output enable, if !OE ALU_OUT = Z
    input[3:0] OPCODE, //localparam for opcodes //no match, no change on ALU_OUT (prev State)      
    input [WIDTH-1:0] A,
    input [WIDTH-1:0] B,
    output reg [WIDTH-1:0] ALU_OUT, //may be reg
    output reg CF,  //Carry flag, only on ADD/SUB (on SUB, if A<B)
    output reg OF,  //Overflow flag, only on ADD/SUB (Signed operation was too big for the ALU, sign bit incorrect value)
    output reg SF,  //Negative ?    MSB of out is '1'
    output reg ZF   //Zero value    output is all zeros.
);
//Definition of the opcodes.
localparam ALU_ADD = 4'b0010;
localparam ALU_SUB = 4'b0011;
localparam ALU_AND = 4'b0100;
localparam ALU_OR  = 4'b0101;
localparam ALU_XOR = 4'b0110;
localparam ALU_NOT = 4'b0111;

////////////logic operations////////////////
//  AND
wire [WIDTH-1:0] AND_OUT ;
assign AND_OUT = A & B;
assign AND_SF = AND_OUT[WIDTH-1];
assign AND_ZF = AND_OUT == 0;
//  OR
wire [WIDTH-1:0] OR_OUT ;
assign OR_OUT = A | B;
assign OR_SF = OR_OUT[WIDTH-1];
assign OR_ZF = OR_OUT == 0;
//  XOR
wire [WIDTH-1:0] XOR_OUT ;
assign XOR_OUT = A ^ B;
assign XOR_SF = XOR_OUT[WIDTH-1];
assign XOR_ZF = XOR_OUT == 0;
//  NOT
wire [WIDTH-1:0] NOT_OUT;
assign NOT_OUT = ~A;
assign NOT_SF = NOT_OUT[WIDTH-1];
assign NOT_ZF = NOT_OUT == 0;

/////////////ARITHMETIC OPERATIONS//////////
//  ADD // SUB //
wire SUBSTRACT; //~(ADD)/SUB signal, to calculate the 2'S compliment of B
assign SUBSTRACT = OPCODE == ALU_SUB;

wire[WIDTH:0] carrynet;
wire SUM_SF, SUM_CF, SUM_ZF, SUM_OF;

wire [WIDTH-1:0] SUM_OUT;

wire [WIDTH-1:0] new_B;//New be can be B (SUB=0) or 2'S of B (SUB=1) using a XOR
assign new_B = B^{WIDTH{SUBSTRACT}};

FULL_ADDER RippleAdder[WIDTH-1:0](SUM_OUT, carrynet[WIDTH:1],A,new_B,{carrynet[WIDTH-1:1],SUBSTRACT});
assign SUM_CF = carrynet[WIDTH];
assign SUM_ZF = SUM_OUT == 0;
assign SUM_SF = SUM_OUT[WIDTH-1];
assign SUM_OF = carrynet[WIDTH] ^ carrynet[WIDTH-1];



//  SUB
//wire [WIDTH-1:0] SUB_OUT;
//////////////////////////////////////

///////MUX to output the proper opcode result//////
always @(posedge CLK) begin
    if(OE) begin //update the value only if EN, otherwise, no change so it will have prev value
        if(EN) begin
            case (OPCODE)
                ALU_ADD : begin
                    ALU_OUT <= SUM_OUT;
                    SF <= SUM_SF;
                    ZF <= SUM_ZF;
                    CF <= SUM_CF;
                    OF <= SUM_OF;
                end
                ALU_SUB : begin
                    ALU_OUT <= SUM_OUT;
                    SF <= SUM_SF;
                    ZF <= SUM_ZF;
                    CF <= SUM_CF;
                    OF <= SUM_OF;
                end
                ALU_AND : begin
                    ALU_OUT <= AND_OUT;
                    SF <= AND_SF;
                    ZF <= AND_ZF;
                    CF <= 0;
                    OF <= 0;
                end
                ALU_OR  : begin
                    ALU_OUT <= OR_OUT;
                    SF <= OR_SF;
                    ZF <= OR_ZF;
                    CF <= 0;
                    OF <= 0;
                end
                ALU_XOR : begin
                    ALU_OUT <= XOR_OUT;
                    SF <= XOR_SF;
                    ZF <=XOR_ZF;
                    CF <= 0;
                    OF <= 0;
                end
                ALU_NOT : begin
                    ALU_OUT <= NOT_OUT;
                    SF <= NOT_SF;
                    ZF <= NOT_ZF;
                    CF <= 0;
                    OF <= 0;
                end
                //default : //no default -> no match, no change on outputs
            endcase
        end //No EN -> No change on outputs.
    end else  begin //Output disabled
        ALU_OUT <= 'bz; //Flags are unaffected
    end
end
endmodule;
