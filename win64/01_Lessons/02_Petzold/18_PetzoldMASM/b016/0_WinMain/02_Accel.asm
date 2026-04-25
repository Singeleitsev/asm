;lbl_Accel:

lea rcx,StructAccel
mov rdx,5 ;The number of ACCEL structures in the array
Call CreateAcceleratorTableA
cmp rax,0
je lbl_Accel_Err
mov g_hAccel,rax

;lbl_Accel_End:


