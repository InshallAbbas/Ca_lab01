.data 
source_str:  .string "Habib"      
dest_str:    .space 16            
 
.text 
.globl main 
main: 
    la   a0, dest_str              
    la   a1, source_str          
    jal  ra, strcpy               
 
    li   a0, 10 
    ecall 
 
strcpy: 
    addi sp, sp, -16 
    sw   s0, 0(sp)           
    add  s0, zero, zero     
 
L1: 
    add  t1, s0, a1          
    lbu  t2, 0(t1)            
 
    add  t3, s0, a0         
    sb   t2, 0(t3)           
 
    beq  t2, zero, L2        
    addi s0, s0, 1          
    jal  zero, L1             
 
L2: 
    lw   s0, 0(sp)          
    addi sp, sp, 16          
    jalr zero, 0(ra)         