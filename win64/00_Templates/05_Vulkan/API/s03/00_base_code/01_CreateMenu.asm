;lbl_CreateMenu:

;Main Menu
Call CreateMenu
cmp rax,0
je lbl_ErrCreateMenu
mov ghMenuMain,rax

;File
Call CreatePopupMenu
mov ghMenuFile,rax

mov rcx,ghMenuMain
mov rdx,10h ;MF_POPUP
mov r8,ghMenuFile
lea r9,szMenuFile
Call AppendMenuA

mov rcx,ghMenuFile
xor rdx,rdx ;MF_STRING
mov r8,IDM_APP_EXIT
lea r9,szMenuFileExit
Call AppendMenuA

;Help
Call CreatePopupMenu
mov ghMenuHelp,rax

mov rcx,ghMenuMain
mov rdx,10h ;MF_POPUP
mov r8,ghMenuHelp
lea r9,szMenuHelp
Call AppendMenuA

mov rcx,ghMenuHelp
xor rdx,rdx ;MF_STRING
mov r8,IDM_HELP_ABOUT
lea r9,szMenuHelpAbout
Call AppendMenuA

;Done
;mov rcx,ghWnd
;mov rdx,ghMenu
;Call SetMenu

;mov rcx,ghWnd
;Call DrawMenuBar

;Accelerators
lea rcx,accel
mov rdx,2 ;The number of ACCEL structures in the array
call CreateAcceleratorTableA
test rax,rax
jz lbl_ErrCreateMenu
mov ghAccTable,rax

jmp lbl_CreateMenu_End

lbl_ErrCreateMenu:
lea rcx,szErrCreateMenu
lea rdx,szErrCreateMenuCode
call SpellError
;jmp lbl_CreateMenu_End

lbl_CreateMenu_End:


