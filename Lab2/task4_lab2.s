main:
    li x7, 0   
    li x23, 0   
    li x5, 3 

    li x6, 3 
    li x29, 0 
    
    li x10, 0x300 
loop:
    bge x7, x5, end 

   

    loopj:
        bge x29, x6, endj 

        slli x8, x29, 2 

        add x11, x10, x8

        add x9, x7,x29 

        sw x9,0x0(x11)  


        addi x29, x29, 1    
        j loopj             
    endj:

    li x29, 0 


    addi x7, x7, 1   
    j loop             
end:
    j end