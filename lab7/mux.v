/***************************************************************************  
 ***                                                                     ***  
 ***    ECE 526L      Adrian Amarilla Gomez, Fall, 2024                  ***  
 ***                                                                     ***  
 ***    LAB7                                                             ***  
 ***                                                                     ***  
 ***************************************************************************  
 ***    Filename: mux.v Created by Adrian, Date 10/27/2024               ***  
 ***    --- Code documentation - 10/27/2024 ---                          ***  
 ***************************************************************************  
 ***    -Scalable Mux                                                    ***
 ***************************************************************************/

`timescale 1ns/1ns

// Scalable module
module mux(A, B, SEL, OUT);
parameter size = 1;
//Scalable Input sizes
input [(size-1):0] A;
input [(size-1):0] B;
//SEL remains the same as it will still be a 2:1 MUX
input SEL; 
//Scalable output size
output reg [(size-1):0] OUT;
//Auxiliar variable for the loop iterations.
integer i;
// Procedural block containing the mux behavioral code
always @(A, B, SEL) begin
    case(SEL)
        1'b0:   OUT = A; //When case = 0, Output is A
        1'b1:   OUT = B; //When case = 1, Output is B
        default : begin
            //When SEL is undefined, we need to drive to 1 or 0
            // the coincident A and B bits, to X the different.
            for (i = 0; i < size; i = i + 1 ) begin
                OUT[i] = (A[i] ~^ B[i]) ? A[i] : 1'bx;
                //In this way, we avoid comparision with 'x'
            end
        end
    endcase
end
endmodule