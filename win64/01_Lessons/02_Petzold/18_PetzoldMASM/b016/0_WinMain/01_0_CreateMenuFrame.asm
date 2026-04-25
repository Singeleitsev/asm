lbl_CreateMenuFrame:

;Main Menu
Call CreateMenu
cmp rax,0
je lbl_CreateMenu_Err
mov g_hMenuFrame,rax

;Create "File" popup
Call CreatePopupMenu
mov g_hMenuFrame_File,rax

;Append "File" SubMenu
mov rcx,g_hMenuFrame
mov rdx,10h ;MF_POPUP
mov r8,g_hMenuFrame_File
lea r9,szMenu_File
Call AppendMenuA

;Add items to "File" popup
mov rcx,g_hMenuFrame_File
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_FILE_NEW_CHILD_0
lea r9,szMenu_FileNewChild0
Call AppendMenuA

mov rcx,g_hMenuFrame_File
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_FILE_NEW_CHILD_1
lea r9,szMenu_FileNewChild1
Call AppendMenuA

mov rcx,g_hMenuFrame_File
mov rdx,800h ;MF_SEPARATOR
xor r8,r8
xor r9,r9
call AppendMenuA

mov rcx,g_hMenuFrame_File
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_FILE_EXIT
lea r9,szMenu_FileExit
call AppendMenuA

;lbl_CreateMenuFrame_End:


