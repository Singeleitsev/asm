;doCreateMenu:
lea rcx,szLogCreatingMenu
call WriteLog

;Main Menu
call CreateMenu
test rax,rax
je WinMain_Error
mov ghMenu,rax

;File
call CreatePopupMenu
test rax,rax
je WinMain_Error
mov ghMenuFile,rax

mov rcx,ghMenu
mov rdx,10h ;MF_POPUP 
mov r8,ghMenuFile
lea r9,szMenuFile
call AppendMenuA

mov rcx,ghMenuFile
mov rdx,1 ;MF_GRAYED
mov r8,IDM_FILE_SAVE
lea r9,szMenuFileSave
call AppendMenuA

mov rcx,ghMenuFile
xor rdx,rdx ;MF_STRING = 0
mov r8,IDM_FILE_EXIT
lea r9,szMenuFileExit
call AppendMenuA

;Help
call CreatePopupMenu
test rax,rax
je WinMain_Error
mov ghMenuHelp,rax

mov rcx,ghMenu
mov rdx,10h ;MF_POPUP
mov r8,ghMenuHelp
lea r9,szMenuHelp
call AppendMenuA 

mov rcx,ghMenuHelp
xor rdx,rdx ;MF_STRING = 0
mov r8,IDM_HELP_ABOUT
lea r9,szMenuHelpAbout
call AppendMenuA

;Not needed because CreateWindowExA is called with ghMenu argument
;mov rcx,ghWnd
;mov rdx,ghMenu
;call SetMenu
;mov rcx,ghWnd
;call DrawMenuBar

;Success
lea rcx,szOK
call WriteLog


