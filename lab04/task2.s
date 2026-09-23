.text 
.globl main 
 
main: 
    addi sp, sp, -16 
    sw   ra, 12(sp) 
    li   a0, 5               # Compute the 5th triangular number 
    jal  ra, ntri 
    addi   a1, a0, 0               # Put result into a1 
    li   a0, 1               # ecall 1: print_int 
    ecall 
    lw   ra, 12(sp) 
    addi sp, sp, 16 
    li   a0, 10              # Exit ecall 
    ecall 
ntri: 
    addi sp, sp, -16         # Allocate stack frame  
    sw   ra, 8(sp)           # Save return address 
    sw   a0, 0(sp)           # Save original num 
    li   t0, 1
 ble  a0, t0, ntri_base   # if (num <= 1) return 1 
    addi a0, a0, -1          # Argument = num - 1 
    jal  ra, ntri            # Recursive call 
    lw   t1, 0(sp)           # Restore original num 
    add  a0, a0, t1          # a0 = num + ntri(num - 1) 
    j    end 
ntri_base: 
    li   a0, 1               # return 1 
end: 
    lw   ra, 8(sp)           # Restore return address 
    addi sp, sp, 16          # Release stack frame 
    jalr zero, 0(ra)         # Return 