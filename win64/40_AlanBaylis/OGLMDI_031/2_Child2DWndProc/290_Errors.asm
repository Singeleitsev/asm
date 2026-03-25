lbl_Child2D_Type_Err:
lea rdx,szChildType_Err ;Improper Child Type
;jmp lbl_Child2DWndProc_ShowErrorMessage

;Show Message and Quit
;lbl_Child2D_ShowErrorMessage:
xor rcx,rcx
lea r8,szError
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA

jmp lbl_Child2D_Return0

