li   x10, 5             # g = 5 
    li   x11, 10            # h = 10 
    li   x12, 2             # i = 2 
    li   x13, 3             # j = 3 
 
    jal  ra, leaf_example    
 
    li   a0, 10 
    ecall 
leaf_example: 
    addi sp, sp, -16          
    sw   x18, 0(sp)         # Save x18 
    sw   x19, 4(sp)         # Save x19 
    sw   x20, 8(sp)         # Save x20 
 
    add  x18, x10, x11      # x18 = g + h 
    add  x19, x12, x13      # x19 = i + j 
    sub  x20, x18, x19      # f = (g + h) - (i + j) 
 
    add  x10, x20, zero     # return f 
 
    lw   x18, 0(sp)         # Restore x18 
    lw   x19, 4(sp)         # Restore x19 
    lw   x20, 8(sp)         # Restore x20 
    addi sp, sp, 16         # Restore stack pointer 
 
    jalr zero, 0(ra)