lbl_CreateMenuMain_Err:
lea rdx,szCreateMenuMain_Err ;MDI Client Window creation failed
jmp lbl_WndProc_ShowErrorMessage

;Show Message and Quit
lbl_WndProc_ShowErrorMessage:
xor rcx,rcx
lea r8,szError
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
jmp lbl_WndProc_Return0

