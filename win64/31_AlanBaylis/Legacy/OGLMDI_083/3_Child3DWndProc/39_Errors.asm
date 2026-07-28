lbl_Child3D_Type_Err:
lea rdx,szChildType_Err ;Improper Child Type
jmp lbl_Child3D_ShowErrorMessage

lbl_Child3D_DC_Err:
lea rdx,szChild3D_DC_Err ;hDC is NULL
jmp lbl_Child3D_ShowErrorMessage

lbl_Child3D_RC_Err:
lea rdx,szChild3D_RC_Err ;hRC is NULL
jmp lbl_Child3D_ShowErrorMessage

;Show Message and Quit
lbl_Child3D_ShowErrorMessage:
xor rcx,rcx
lea r8,szChild3D
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA

jmp lbl_Child3D_Return0