;doCreateAccel:
lea rcx,szCreateAcceleratorTableA
call WriteLog

mov rcx,OFFSET_ACCEL
mov rdx,2 ;The number of ACCEL structures in the array = 2 (see struct.asm)
call CreateAcceleratorTableA
test rax,rax
je WinMain_Error
mov ghAccTable,rax

;Success
lea rcx,szOK
call WriteLog


