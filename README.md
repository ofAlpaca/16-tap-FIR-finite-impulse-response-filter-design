# 16 tap FIR filter design

##### FIR(finite impulse response)

- A[0]~A[31] as input.
- C[0]~C[15] as fixed multiplier.

ex:

A[0]xC[0]+A[1]xC[1]+ ... +A[15]xC[15] = output.
 
A[1]xC[0]+A[2]xC[1]+ ... +A[16]xC[15] = output.

> The Top module is **FIR_total.v**
