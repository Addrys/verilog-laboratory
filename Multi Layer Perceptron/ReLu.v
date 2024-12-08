//Activation function
// F(x) = max(0,x)

module ReLu(out, number);
input[31:0] number; //Number 32b FP 754 IEEE FP
output[31:0] out;
//Cases of FP IEEE number being < 0
//Negative, sign bit = 1.
assign out = number[31] == 1'b1 ? 32'b0 : number;
endmodule