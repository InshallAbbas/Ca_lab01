.globl main 
 
.data 
arr:    .word 4, 2, 8, 1, 5       # Sample unsorted array 
len:    .word 5                   # Array length 
 
.text 
main: 
    la   a0, arr                  # Load base address of arr into a0 
    lw   a1, len                  # Load array length into a1 
 
    jal  ra, bubble_sort          # Call bubble_sort 
 
    # Exit program cleanly in Venus 
    li   a0, 10 
    ecall 
 
bubble_sort: 
    beqz a0, done 
    beqz a1, done 
    li t0, 0                      # i = 0 
 
outer_loop: 
    bgeu t0, a1, done 
    slli t1, t0, 2 
    add t2, a0, t1 
    lw t3, 0(t2) 
    addi t4, t0, 0                # j = i 
 
inner_loop: bgeu t4, a1, next_i 
    slli t5, t4, 2 
    add t6, a0, t5 
    lw t5, 0(t6) 
    bge t3, t5, no_swap 
 
    sw t5, 0(t2) 
    sw t3, 0(t6) 
    addi t3, t5, 0 
 
no_swap: 
    addi t4, t4, 1 
    j inner_loop 
 
next_i: 
    addi t0, t0, 1 
    j outer_loop 
 
done: 
    ret