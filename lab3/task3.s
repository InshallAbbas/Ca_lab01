
li x10,0x100    #v

addi x11,x0,0   #k
   #temp

 



jal x1,swap

j exit





swap:

    addi x17,x0,20 
    slli x21,x11,2
    add x22,x10,x21
    sw x17,0(x22)   #temp=v[k]


    lw x18,0(x22)
    sw x18,4(x22)


    lw x19,4(x22)
    sw x17,4(x22)

    jalr x0,0(x1)
    

exit:










