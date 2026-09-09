
li x22,0
li x23,0
li x24,0x200


li x25,10

Loop:

    bge x22,x25,hehe
    slli x1,x22,2
    add x2,x1,x24
    sw  x22,0(x2)
    addi x22,x22,1
    beq x0,x0,Loop
hehe:
    li x22,0
Loop2:

    bge x22,x25,Exit
    slli x1,x22,2
    add x2,x1,x24
    lw x4,0(x2)
    add x23,x23,x4
    addi x22,x22,1
    beq x0,x0,Loop2
    
Exit:

