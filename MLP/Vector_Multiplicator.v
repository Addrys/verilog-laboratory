

//rmode = rounding mode -> 3 (round_down)
//fpu_op -> 0 = add, 2 = mul
//opa, opb, out = operands, out. 32bit fp IEEE754
//Rest are flags (out) like overlof, infinite FP flag, ...
fpu( clk, rmode, fpu_op, opa, opb, out, inf, snan, qnan, ine, overflow, underflow, zero, div_by_zero);