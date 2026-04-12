;lbl_Accel:

;lea rcx,accel
;mov dword ptr[rcx],9 ;accel.fVirt = FVIRTKEY | FCONTROL = 1 + 8
;mov dword ptr[rcx+2],31h ;accel.key = Key 1
;mov dword ptr[rcx+4],CM_FILE_NEW_TOP ;accel.cmd

;mov dword ptr[rcx+6],9 ;accel.fVirt = FVIRTKEY | FCONTROL = 1 + 8
;mov dword ptr[rcx+8],32h ;accel.key = Key 2
;mov dword ptr[rcx+0Ah],CM_FILE_NEW_FRONT ;accel.cmd

;mov dword ptr[rcx+0Ch],9 ;accel.fVirt = FVIRTKEY | FCONTROL = 1 + 8
;mov dword ptr[rcx+0Eh],33h ;accel.key = Key 3
;mov dword ptr[rcx+10h],CM_FILE_NEW_LEFT ;accel.cmd

;mov dword ptr[rcx+12h],9 ;accel.fVirt = FVIRTKEY | FCONTROL = 1 + 8
;mov dword ptr[rcx+14h],34h ;accel.key = Key 4
;mov dword ptr[rcx+16h],CM_FILE_NEW_3D ;accel.cmd

;mov dword ptr[rcx+18h],9 ;accel.fVirt = FVIRTKEY | FCONTROL = 1 + 8
;mov dword ptr[rcx+1Ah],57h ;accel.key = W
;mov dword ptr[rcx+1Ch],CM_FILE_EXIT ;accel.cmd

lea rcx,accel
mov rdx,5 ;The number of ACCEL structures in the array
Call CreateAcceleratorTableA
cmp rax,0
je lbl_Accelerator_Err
mov hAccTable,rax

;lbl_Accel_End:

