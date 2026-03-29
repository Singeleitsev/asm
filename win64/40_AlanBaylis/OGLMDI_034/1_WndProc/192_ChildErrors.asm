lbl_ChildrenOverflow_Err:
lea rdx,szRegisterClass_Err ;The number of children has reached the maximum
jmp lbl_CreateChild_ShowErrorMessage

lbl_ChildType_Err:
lea rdx,szChildType_Err ;Improper Child Type
jmp lbl_CreateChild_ShowErrorMessage

lbl_CreateChild_Err:
lea rdx,szCreateChild_Err ;Child Window creation failed
jmp lbl_CreateChild_ShowErrorMessage

;Show Message and Quit
lbl_CreateChild_ShowErrorMessage:
xor rcx,rcx
lea r8,szError
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA
jmp lbl_CreateChild_End

