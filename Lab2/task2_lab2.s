 li x20,0
li x21,5
li x22, 2
li x23,3
switch:
    addi x10,x0,1
    beq x20,x10,Case1
        addi x10,x0,2
    beq x20,x10,Case2
        addi x10,x0,3
    beq x20,x10,Case3
        addi x10,x0,4
    beq x20,x10,Case4
        addi x10,x0,0
    beq x20,x10,Case0
Case1:
    add x21,x22,x23
    beq x0,x0,exit
Case2:
    sub x21,x22,x23
    beq x0,x0,exit
Case3:
    slli x21,x22,1
    beq x0,x0,exit
Case4:
    srli x21,x22,1
    beq x0,x0,exit
    
Case0:
    add x21,x0,x0
    beq x0,x0,exit
exit:

