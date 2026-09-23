.globl main 
 
.data 
n:      .word 7# Compute 7th Fibonacci number (Expected: 13) 
 
.text 
main: 
    # Load input value n 
    la   t0, n 
    lw   a0, 0(t0)        # a0 = n 
 
    # Call recursive procedure fib(n) 
    jal  ra, fib 
 
    # Save result in a preserved register 
    mv   s0, a0           # s0 = fib(n) 
 
    # Print integer to Venus console 
    li   a0, 1            # ecall code 1: print_int 
    mv   a1, s0           # a1 = value to print 
    ecall 
 
    # Exit program cleanly 
    li   a0, 10           # ecall code 10: exit 
    ecall 
 
fib: 
    addi sp, sp, -16 
    sw   ra, 12(sp) 
    sw   s0, 8(sp) 
    sw   s1, 4(sp) 
 
    # Keep n in callee-saved register s0 across recursive calls 
    mv   s0, a0 
 
    # Base Case 
    bge  zero, s0, fib_base_zero 
 
    # Base Case: if (n == 1) 
    li   t0, 1 
    beq  s0, t0, fib_base_one 
     # Recursive Step 1: Compute fib(n - 1) 
    addi a0, s0, -1       # Argument = n - 1 
    jal  ra, fib          # Recursive call 
    mv   s1, a0           # Preserve result of fib(n - 1) in s1 
 
    # Recursive Step 2: Compute fib(n - 2) 
    addi a0, s0, -2       # Argument = n - 2 
    jal  ra, fib          # Recursive call; a0 = fib(n - 2) 
 
    # Combine: fib(n) = fib(n - 1) + fib(n - 2) 
    add  a0, s1, a0       # a0 = s1 + a0 
    j    fib_exit 
 
fib_base_zero: 
    li   a0, 0 
    j    fib_exit 
 
fib_base_one: 
    li   a0, 1 
 
fib_exit: 
    #Restore registers, deallocate stack frame, and return 
    lw   s1, 4(sp) 
    lw   s0, 8(sp) 
    lw   ra, 12(sp) 
    addi sp, sp, 16 
    jalr zero, 0(ra) 