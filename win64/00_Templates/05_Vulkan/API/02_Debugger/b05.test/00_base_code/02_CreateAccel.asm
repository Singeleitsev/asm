;lbl_CreateAccel:

LOG_TEXT szLogCreateAccel

lea rcx,accel
mov rdx,2 ;The number of ACCEL structures in the array
call CreateAcceleratorTableA
test rax,rax
jz lbl_WinMain_Error
mov ghAccTable,rax

lbl_CreateAccel_End:
LOG_TEXT szOK
