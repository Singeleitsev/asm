lbl_Child3DWndProc_Type_Err:
lea rdx,szChildType_Err ;Improper Child Type
jmp lbl_Child3DWndProc_ShowErrorMessage

;Show Message and Quit
lbl_Child3DWndProc_ShowErrorMessage:
xor rcx,rcx
lea r8,szError
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
xor rax,rax

jmp lbl_Child3D_Return0