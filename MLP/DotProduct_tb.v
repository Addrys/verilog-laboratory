`timescale 1ns / 100ps

module tb_DotProduct;

    // Testbench Signals
    reg CLK;
    reg round_down;
    reg reset;
    reg [31:0] A [0:49];   // Input vector A (size 4 for simplicity)
    reg [31:0] B [0:49];   // Input vector B (size 4 for simplicity)
    wire [31:0] result;   // Output: Dot product of A and B
    wire endf;
    // Instantiate the DotProduct module
    DotProduct #(50) uut (
        result, endf, A, B, CLK, reset
    );

    //wire a, b, c, d, e, f, g, h;
    //reg [31:0] opa, opb;
    //wire [31:0] out;
    //fpu UUT2( CLK, 2'b11, 3'b010, opa, opb, out, a,b,c,d,e,f,g,h);

    // Clock Generation (period 10ns)
    initial begin
        CLK = 0;
        forever #1 CLK = !CLK;
    end;  // Full cycle (10ns)
    

    // Initial block to initialize the test vectors and stimulus
    initial begin
        // Initialize round_down signal 
        $vcdpluson;
        // Initialize input vectors A and B (4 elements)

        $readmemb("./adata.txt", A);
        $readmemb("bdata.txt", B);
        reset = 1;
        #100;
        reset = 0;

        // Display headers
        $display("Time\tA[0]\t\tA[1]\t\tA[2]\t\tA[3]\t\tB[0]\t\tB[1]\t\tB[2]\t\tB[3]\t\tDot Product");

        // Wait for some time to allow initialization
        #10;
        
        // Run simulation for a few clock cycles
        #10; // Wait for the first clock cycle

        // Monitor output value (Dot product)
        $monitor("%0t\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h\t%h", 
                  $time, A[0], A[1], A[2], A[3], B[0], B[1], B[2], B[3], result);
        //$monitor("Time=%t, opA=%b, opB=%b, res=%b",$time, opa,opb,out);
        //opa = 32'b00111101000010111100100000000000;
        //opb = 32'b00111101111110110010011000000000;
        // Finish the simulation after some time
        #100000; // Run the simulation for 100 ns
        
        $finish;  // End simulation
    end

endmodule