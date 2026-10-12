;doCreateAccel:
invoke WriteLog,offset szCreateAcceleratorTableA

;The number of ACCEL structures in the array = 2 (see struct.asm)
invoke CreateAcceleratorTableA,OFFSET_ACCEL,2 
test eax,eax
je WinMain_Error
mov ghAccTable,eax

;Success
invoke WriteLog,offset szOK


