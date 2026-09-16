li sp,0x200  #initialize stack 
addi x10,x0,12
addi x11, x0, 12
addi x12, x0, 12
addi x13, x0, 5
addi sp,sp,-24
sw x10,0(sp)
sw x11,4(sp)
sw x12,8(sp)
sw x13,12(sp)
jal x1,leaf_example


addi x11,x20,0    #return 
li x10,1
ecall
j exit
leaf_example: 

    
    lw x10,0(sp)
    lw x11,4(sp)
    lw x12,8(sp)
    lw x13,12(sp)

    add x18,x10,x11
    add x19,x12,x13
    sw x18,16(sp)
    sw x19,20(sp)

    addi x20,x0,0
    lw x18,16(sp)
    lw x19,20(sp)

    sub x20,x18,x19
    sw x20,24(sp)
    jalr x0,0(x1)



exit:
