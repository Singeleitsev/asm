;lbl_CreateMenu:

;Main Menu
Call CreateMenu
cmp rax,0
je lbl_ErrCreateMenu
mov ghMenu,rax

;File
Call CreatePopupMenu
mov ghMenuFile,rax

mov rcx,ghMenu
mov rdx,10h ;MF_POPUP
mov r8,ghMenuFile
lea r9,szMenuFile
Call AppendMenuA

mov rcx,ghMenuFile
xor rdx,rdx ;MF_STRING
mov r8,IDM_APP_EXIT
lea r9,szMenuFileExit
Call AppendMenuA

;Options
Call CreatePopupMenu
mov ghMenuOptions,rax

mov rcx,ghMenu
mov rdx,10h ;MF_POPUP
mov r8,ghMenuOptions
lea r9,szMenuOptions
Call AppendMenuA

Call CreatePopupMenu
mov ghMenuOptionsCamera,rax

mov rcx,ghMenuOptions
mov rdx,10h ;MF_POPUP
mov r8,ghMenuOptionsCamera
lea r9,szMenuOptionsCamera
Call AppendMenuA

mov rcx,ghMenuOptionsCamera
xor rdx,rdx ;MF_STRING
mov r8,IDM_CAMERA_MODE_PLANAR ;0
lea r9,szMenuOptionsCameraMode0
Call AppendMenuA

mov rcx,ghMenuOptionsCamera
mov rdx,8 ;MF_STRING | MF_CHECKED
mov r8,IDM_CAMERA_MODE_SPATIAL ;1
lea r9,szMenuOptionsCameraMode1
Call AppendMenuA

;Help
Call CreatePopupMenu
mov ghMenuHelp,rax

mov rcx,ghMenu
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
mov accel.fVirt,9 ;FVIRTKEY | FCONTROL = 1 + 8
mov accel.key,57h ;W
mov accel.cmd,IDM_APP_EXIT

lea rcx,accel
mov rdx,1 ;The number of ACCEL structures in the array
Call CreateAcceleratorTableA
cmp rax,0
je lbl_ErrCreateMenu
mov ghAccTable,rax

jmp lbl_CreateMenu_End

lbl_ErrCreateMenu:
lea rcx,szErrCreateMenu
lea rdx,szErrCreateMenuCode
call SpellError
;jmp lbl_CreateMenu_End

lbl_CreateMenu_End:


