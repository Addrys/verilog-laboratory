`timescale 1ns / 100ps

module tb_DotProduct;
    reg CLK;
    reg reset;
    reg [31:0] A [0:49];   
    reg [31:0] B [0:49]; 
    wire [31:0] result; // Output: Dot product of A and B
    wire endf;
    // Instantiate the DotProduct module
    DotProduct #(50) uut (
        result, endf, A, B, CLK, reset
    );

    //wire a, b, c, d, e, f, g, h;
    //reg [31:0] opa, opb;
    //wire [31:0] out;
    //fpu UUT2( CLK, 2'b11, 3'b010, opa, opb, out, a,b,c,d,e,f,g,h);
    initial begin
        CLK = 0;
        forever #1 CLK = !CLK;
    end; 

    // Initial block to initialize the test vectors and stimulus
    initial begin
        $vcdpluson;

        $readmemb("./adata.txt", A);
        $readmemb("bdata.txt", B);
        reset = 1;
        #100;
        reset = 0;
        $display("Time\tA[0]\t\tA[1]\t\tA[2]\t\tA[3]\t\tB[0]\t\tB[1]\t\tB[2]\t\tB[3]\t\tDot Product");
        #10;
        #10; // Wait for the first clock cycle
        $monitor("%0t\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h", 
                  $time, A[0], A[1], A[2], A[3], B[0], B[1], B[2], B[3], result);
        #1000; // 
    
        $finish; 
    end

endmodule