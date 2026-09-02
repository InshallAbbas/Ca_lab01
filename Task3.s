main: 
    li x1,5
    li x2,0
    li x4,-5
    addi x1,x2,32
    add x3,x1,x2
    add x3,x3,x4
    sub x5,x1,x3
    sub x6, x2,x1
    add x7,x5,x6
    add x7,x7,x3
    add x8,x1,x2
    add x9,x3,x7
    add x7,x8,x9
end:
  j end