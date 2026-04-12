;WinMain Errors

;Main Window Errors
lbl_CreateMenuMain_Err:
lea rdx,szCreateMenuMain_Err ;Main Menu creation failed
jmp lbl_WndProc_ShowErrorMessage

lbl_CreateSubMenu_Err:
lea rdx,szCreateSubMenu_Err ;SubMenu creation failed
jmp lbl_WndProc_ShowErrorMessage

;Client Window Errors
lbl_CreateMDIClient_Err:
lea rdx,szCreateMDIClient_Err ;MDI Client Window creation failed
jmp lbl_WndProc_ShowErrorMessage

;Child Window Errors
lbl_ChildrenOverflow_Err:
lea rdx,szRegisterClass_Err ;The number of children has reached the maximum
jmp lbl_WndProc_ShowErrorMessage

lbl_ChildType_Err:
lea rdx,szChildType_Err ;Improper Child Type
jmp lbl_WndProc_ShowErrorMessage

lbl_CreateChild_Err:
lea rdx,szCreateChild_Err ;Child Window creation failed
jmp lbl_WndProc_ShowErrorMessage

lbl_CreateChild_NoSysMenu:
lea rdx,szCreateChild_NoSysMenu ;No SysMenu for Child Window
jmp lbl_WndProc_ShowErrorMessage

lbl_CreateChild_ParentMisMatch:
lea rdx,szCreateChild_ParentMisMatch ;Parent MisMatch
jmp lbl_WndProc_ShowErrorMessage

lbl_CreateChild_DC_Err:
call DestroyWindow
lea rdx,szCreateChild_DC_Err ;Failed to get Device Context
jmp lbl_WndProc_ShowErrorMessage

lbl_CreateChild_RC_Err:
call DestroyWindow
lea rdx,szCreateChild_RC_Err ;hRC is NULL
jmp lbl_WndProc_ShowErrorMessage

lbl_CreateChild_MakeCurrent_Err:
lea rdx,szMakeCurrent_Err ;'wglMakeCurrent Error'
jmp lbl_WndProc_ShowErrorMessage

;Show Message and Quit
lbl_WndProc_ShowErrorMessage:
xor rcx,rcx
lea r8,szWndProc
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
mov rax,-1
jmp lbl_WndProc_End