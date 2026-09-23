 .text 
.globl main 
 
main:   
   
   
   
   li   x10, 6              # Load argument n = 6 into a0 
    jal  x1, fact       # Call iterative factorial 
    # Print result 
    addi x11, x10, 0            # Move result to a1 
    li   x10, 1              # ecall code 1 
    ecall 
    li   x10, 10             # ecall exit 
    ecall 
fact: 
    li   x5, 1               # long acc = 1; 
while: 
    blez x10, end       # if (n <= 0) break while 
    mul  x5, x5, x10         # acc = acc * n; 
    addi x10, x10, -1        # n = n - 1; 
    j    while           # repeat while (n > 0) 
end: 
    addi x10, x5, 0             # return acc in a0 
    jalr x0, 0(x1) 