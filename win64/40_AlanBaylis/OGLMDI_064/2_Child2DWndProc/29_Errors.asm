lbl_Child2D_Type_Err:
lea rdx,szChildType_Err ;Improper Child Type
jmp lbl_Child2D_ShowErrorMessage

lbl_Child2D_DC_Err:
lea rdx,szChild2D_DC_Err ;hDC is NULL
jmp lbl_Child2D_ShowErrorMessage

lbl_Child2D_RC_Err:
lea rdx,szChild2D_RC_Err ;hRC is NULL
jmp lbl_Child2D_ShowErrorMessage

;Show Message and Quit
lbl_Child2D_ShowErrorMessage:
xor rcx,rcx
lea r8,szChild2D
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
mov rax,-1
jmp lbl_Child2D_End

