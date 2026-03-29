;WinMain

lbl_RegisterClass_Err:
lea rdx,szRegisterClass_Err ;'Failed to Register the Window'
jmp lbl_WinMain_ShowErrorMessage

lbl_CreateWindowFrame_Err:
lea rdx,szCreateWindowFrame_Err ;'Failed to Create the Frame Window'
jmp lbl_WinMain_ShowErrorMessage

;Show Message and Quit
lbl_WinMain_ShowErrorMessage:
xor rcx,rcx
lea r8,szError
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
mov rax,-1
jmp lbl_WinMain_End


