
 main:
    
    lb   x5, 0x100(x0)      
    lh   x6, 0x200(x0)      
    add  x7, x5, x6          
    sw   x7, 0x300(x0)      

    lb   x5, 0x101(x0)       
    lh   x6, 0x202(x0)     
    add  x7, x5, x6        
    sw   x7, 0x304(x0)       
    lb   x5, 0x102(x0)      
    lh   x6, 0x204(x0)       
    add  x7, x5, x6          
    sw   x7, 0x308(x0)      

    
    lb   x5, 0x103(x0)       
    lh   x6, 0x206(x0)      
    add  x7, x5, x6          
    sw   x7, 0x30C(x0)     

end:
    j end


