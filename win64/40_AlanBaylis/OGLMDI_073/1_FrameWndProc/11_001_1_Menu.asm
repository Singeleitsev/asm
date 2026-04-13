;lbl_CreateMenuMain:

;Main Menu
Call CreateMenu
cmp rax,0
je lbl_CreateMenuMain_Err
mov hMenuMain,rax

;0
;File
Call CreatePopupMenu
mov hMenuFile,rax

;Append File submenu
mov rcx,hMenuMain
mov rdx,10h ;MF_POPUP or MF_STRING
mov r8,hMenuFile
lea r9,szMenuFile
call AppendMenuA

mov rcx,hMenuFile
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,CM_FILE_NEW_TOP
lea r9,szMenuFileNewTop
call AppendMenuA

mov rcx,hMenuFile
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,CM_FILE_NEW_FRONT
lea r9,szMenuFileNewFront
call AppendMenuA

mov rcx,hMenuFile
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,CM_FILE_NEW_LEFT
lea r9,szMenuFileNewLeft
call AppendMenuA

mov rcx,hMenuFile
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,CM_FILE_NEW_3D
lea r9,szMenuFileNew3D
call AppendMenuA

mov rcx,hMenuFile
mov rdx,800h ;MF_SEPARATOR
xor r8,r8
xor r9,r9
call AppendMenuA

mov rcx,hMenuFile
mov rdx,1 ;MF_STRING or MF_GRAYED
mov r8,CM_FILE_OPEN
lea r9,szMenuFileOpen
call AppendMenuA

mov rcx,hMenuFile
mov rdx,1 ;MF_STRING or MF_GRAYED
mov r8,CM_FILE_SAVE
lea r9,szMenuFileSave
call AppendMenuA

mov rcx,hMenuFile
mov rdx,1 ;MF_STRING or MF_GRAYED
mov r8,CM_FILE_SAVEAS
lea r9,szMenuFileSaveAs
call AppendMenuA

mov rcx,hMenuFile
mov rdx,800h ;MF_SEPARATOR
xor r8,r8
xor r9,r9
call AppendMenuA

mov rcx,hMenuFile
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,CM_FILE_CLOSE
lea r9,szMenuFileClose
call AppendMenuA

mov rcx,hMenuFile
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,CM_FILE_EXIT
lea r9,szMenuFileExit
call AppendMenuA

;1
;Edit
call CreatePopupMenu
mov hMenuEdit,rax

;Append Edit submenu
mov rcx,hMenuMain
mov rdx,10h ;MF_POPUP or MF_STRING
mov r8,hMenuEdit
lea r9,szMenuEdit
call AppendMenuA

mov rcx,hMenuEdit
mov rdx,1 ;MF_STRING or MF_GRAYED
mov r8,CM_EDIT_UNDO
lea r9,szMenuEditUndo
call AppendMenuA

mov rcx,hMenuEdit
mov rdx,800h ;MF_SEPARATOR
xor r8,r8
xor r9,r9
call AppendMenuA

mov rcx,hMenuEdit
mov rdx,1 ;MF_STRING or MF_GRAYED
mov r8,CM_EDIT_CUT
lea r9,szMenuEditCut
call AppendMenuA

mov rcx,hMenuEdit
mov rdx,1 ;MF_STRING or MF_GRAYED
mov r8,CM_EDIT_COPY
lea r9,szMenuEditCopy
call AppendMenuA

mov rcx,hMenuEdit
mov rdx,1 ;MF_STRING or MF_GRAYED
mov r8,CM_EDIT_PASTE
lea r9,szMenuEditPaste
call AppendMenuA

;2
;Window (for MDI child list)
call CreatePopupMenu
mov hMenuWindow,rax

;Append Window submenu
mov rcx,hMenuMain
mov rdx,10h ;MF_POPUP or MF_STRING
mov r8,hMenuWindow
lea r9,szMenuWindow
call AppendMenuA

mov rcx,hMenuWindow
mov rdx,1 ;MF_STRING or MF_GRAYED
mov r8,CM_WINDOW_TILEVERT
lea r9,szMenuWindowTileVert
call AppendMenuA

mov rcx,hMenuWindow
mov rdx,1 ;MF_STRING or MF_GRAYED
mov r8,CM_WINDOW_TILEHORZ
lea r9,szMenuWindowTileHorz
call AppendMenuA

mov rcx,hMenuWindow
mov rdx,1 ;MF_STRING or MF_GRAYED
mov r8,CM_WINDOW_CASCADE
lea r9,szMenuWindowCascade
call AppendMenuA

;3
;Help
call CreatePopupMenu
mov hMenuHelp,rax

;Append Help submenu
mov rcx,hMenuMain
mov rdx,10h ;MF_POPUP or MF_STRING
mov r8,hMenuHelp
lea r9,szMenuHelp
call AppendMenuA

mov rcx,hMenuHelp
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,CM_HELP_ABOUT
lea r9,szMenuHelpAbout
call AppendMenuA


;Attach the menu to the window
mov rcx,hWnd
mov rdx,hMenuMain
call SetMenu

;Submenu
;Find window menu where children will be listed
;ccs.hMenuWindow = (HMENU)GetSubMenu(GetMenu(hWnd),2)
;mov rcx,hWnd
;Call GetMenu
;mov rcx,rax
mov rcx,hMenuMain
mov rdx,2 ;Position of the "Window" menu
Call GetSubMenu
mov ccs.hWindowMenu,rax
cmp rax,0
je lbl_CreateSubMenu_Err

mov rcx,hWnd
Call DrawMenuBar

;lbl_CreateMenuMain_End:

