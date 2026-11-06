;doCreateAccel:
lea rcx,szCreateAcceleratorTableA
call WriteLog

lea rcx,accel
mov rdx,2 ;The number of ACCEL structures in the array = 2 (see struct.asm)
call CreateAcceleratorTableA
test rax,rax
je CreateMainWnd_Error
mov ghAccTable,rax

;Success
lea rcx,szOK
call WriteLog


