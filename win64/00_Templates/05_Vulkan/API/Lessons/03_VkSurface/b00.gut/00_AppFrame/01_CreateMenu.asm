;lbl_CreateMenu:

LOG_TEXT szLogCreateMenu

;Main Menu
Call CreateMenu
test rax,rax
jz lbl_WinMain_Error
mov ghMenuMain,rax

;File
Call CreatePopupMenu
test rax,rax
jz lbl_WinMain_Error
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
test rax,rax
jz lbl_WinMain_Error
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

lbl_CreateMenu_End:
LOG_TEXT szOK
