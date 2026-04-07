;WinMain Errors

;Main Window Errors
lbl_CreateMenuMain_Err:
lea rdx,szCreateMenuMain_Err ;Main Menu creation failed
jmp lbl_WndProc_ShowErrorMessage

;Client Window Errors
lbl_CreateMDIClient_Err:
lea rdx,szCreateMDIClient_Err ;MDI Client Window creation failed
jmp lbl_WndProc_ShowErrorMessage

;Show Message and Quit
lbl_WndProc_ShowErrorMessage:
xor rcx,rcx
lea r8,szWndProc
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
mov rax,-1
jmp lbl_WndProc_End