;WinMain Errors

lbl_RegisterClass_Err:
lea rdx,szRegisterClass_Err ;'Failed to Register the Window'
jmp lbl_WinMain_ShowErrorMessage

lbl_CreateWindowFrame_Err:
lea rdx,szCreateWindowFrame_Err ;'Failed to Create the Frame Window'
jmp lbl_WinMain_ShowErrorMessage

lbl_CreateMenu_Err:
lea rdx,szCreateMenu_Err ;'Failed to Create the Menu'
jmp lbl_WinMain_ShowErrorMessage

lbl_LoadMenu_Err:
lea rdx,szLoadMenu_Err ;'Failed to Load the Menu'
jmp lbl_WinMain_ShowErrorMessage

lbl_Accel_Err:
lea rdx,szAccel_Err ;'Failed to Create the Accelerators'
jmp lbl_WinMain_ShowErrorMessage

;lbl_WinMain_MakeCurrent_Err:
;lea rdx,szMakeCurrent_Err ;'wglMakeCurrent Error'
;jmp lbl_WinMain_ShowErrorMessage

;Show Message and Quit
lbl_WinMain_ShowErrorMessage:
xor rcx,rcx
lea r8,szWinMain
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
mov rax,-1
jmp lbl_WinMain_End

