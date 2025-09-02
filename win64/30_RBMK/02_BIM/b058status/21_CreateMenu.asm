;lbl_CreateMenu:

;Main Menu
Call CreateMenu
mov hMenu,rax

;File
Call CreatePopupMenu
mov hMenuFile,rax

mov rcx,hMenu
mov rdx,10h ;MF_POPUP
mov r8,hMenuFile
lea r9,szMenuFile
Call AppendMenuA

mov rcx,hMenuFile
xor rdx,rdx ;MF_STRING
mov r8,IDM_APP_EXIT
lea r9,szMenuFileExit
Call AppendMenuA

;Help
Call CreatePopupMenu
mov hMenuHelp,rax

mov rcx,hMenu
mov rdx,10h ;MF_POPUP
mov r8,hMenuHelp
lea r9,szMenuHelp
Call AppendMenuA

mov rcx,hMenuHelp
xor rdx,rdx ;MF_STRING
mov r8,IDM_HELP_ABOUT
lea r9,szMenuHelpAbout
Call AppendMenuA

;Done
mov rcx,hWnd
mov rdx,hMenu
Call SetMenu

mov rcx,hWnd
Call DrawMenuBar

jmp lbl_CreateMenu_End

lbl_ErrCreateMenu:
lea rcx,szErrCreateMenu
;mov rdx,24 ;String Length
mov rdx,lpszErrCreateMenuCode
call SpellError
;jmp lbl_CreateMenu_End

lbl_CreateMenu_End:


