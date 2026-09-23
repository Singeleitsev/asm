;CreateMenu:
LOG_TEXT szLogCreatingMenu

;Main Menu
call CreateMenu
test eax,eax
je WinMain_Error
mov ghMenu,eax

;File
call CreatePopupMenu
test eax,eax
je WinMain_Error
mov ghMenuFile,eax

;MF_POPUP = 10h
invoke AppendMenuA,ghMenu,10h,ghMenuFile,offset szMenuFile
;MF_GRAYED = 1
invoke AppendMenuA,ghMenuFile,1,IDM_FILE_SAVE,offset szMenuFileSave
;MF_STRING = 0
invoke AppendMenuA,ghMenuFile,0,IDM_FILE_EXIT,offset szMenuFileExit

;Help
call CreatePopupMenu
test eax,eax
je WinMain_Error
mov ghMenuHelp,eax

;MF_POPUP = 10h
invoke AppendMenuA,ghMenu,10h,ghMenuHelp,offset szMenuHelp
;MF_STRING = 0
invoke AppendMenuA,ghMenuHelp,0,IDM_HELP_ABOUT,offset szMenuHelpAbout

;Not needed because CreateWindowExA is called with ghMenu argument
;invoke SetMenu,ghWnd,ghMenu
;invoke DrawMenuBar,ghWnd

;Success
LOG_TEXT szOK



;.CreateAccel:
LOG_TEXT szCreateAcceleratorTableA

;The number of ACCEL structures in the array = 2:
;IDM_FILE_EXIT and IDM_HELP_ABOUT (see struct.asm)
invoke CreateAcceleratorTableA,OFFSET_ACCEL,2 
test eax,eax
je WinMain_Error
mov ghAccTable,eax

;Success
LOG_TEXT szOK


