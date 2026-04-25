lbl_CreateMenuChild0:

;Child0 Menu
Call CreateMenu
cmp rax,0
je lbl_CreateMenu_Err
mov g_hMenuChild0,rax

;Create "File" popup
Call CreatePopupMenu
mov g_hMenuChild0_File,rax

;Append "File" SubMenu
mov rcx,g_hMenuChild0
mov rdx,10h ;MF_POPUP
mov r8,g_hMenuChild0_File
lea r9,szMenu_File
Call AppendMenuA

;Add items to "File" popup
mov rcx,g_hMenuChild0_File
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_FILE_NEW_CHILD_0
lea r9,szMenu_FileNewChild0
Call AppendMenuA

mov rcx,g_hMenuChild0_File
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_FILE_NEW_CHILD_1
lea r9,szMenu_FileNewChild1
Call AppendMenuA

mov rcx,g_hMenuChild0_File
mov rdx,800h ;MF_SEPARATOR
xor r8,r8
xor r9,r9
call AppendMenuA

mov rcx,g_hMenuChild0_File
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_FILE_EXIT
lea r9,szMenu_FileExit
call AppendMenuA

;Create "View" popup
call CreatePopupMenu
test rax,rax
jz lbl_CreateMenu_Err
mov g_hMenuChild0_View,rax

;Append "View" SubMenu
mov rcx,g_hMenuChild0
mov rdx,10h ;MF_POPUP
mov r8,g_hMenuChild0_View
lea r9,szMenu_View
call AppendMenuA

;Add items to "View" popup
mov rcx,g_hMenuChild0_View
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_VIEW_BLACK
lea r9,szMenu_ViewBlack
call AppendMenuA

mov rcx,g_hMenuChild0_View
xor rdx,rdx
mov r8,IDM_VIEW_RED
lea r9,szMenu_ViewRed
call AppendMenuA

mov rcx,g_hMenuChild0_View
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_VIEW_GREEN
lea r9,szMenu_ViewGreen
call AppendMenuA

mov rcx,g_hMenuChild0_View
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_VIEW_BLUE
lea r9,szMenu_ViewBlue
call AppendMenuA

mov rcx,g_hMenuChild0_View
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_VIEW_WHITE
lea r9,szMenu_ViewWhite
call AppendMenuA

;Create "Window" popup
call CreatePopupMenu
test rax,rax
jz lbl_CreateMenu_Err
mov g_hMenuChild0_Window,rax

;Append "Window" SubMenu
mov rcx,g_hMenuChild0
mov rdx,10h ;MF_POPUP
mov r8,g_hMenuChild0_Window
lea r9,szMenu_Window
call AppendMenuA

;Add items to "Window" popup
mov rcx,g_hMenuChild0_Window
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_WINDOW_TILE
lea r9,szMenu_WindowTile
call AppendMenuA

mov rcx,g_hMenuChild0_Window
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_WINDOW_CASCADE
lea r9,szMenu_WindowCascade
call AppendMenuA

mov rcx,g_hMenuChild0_Window
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_WINDOW_ARRANGE
lea r9,szMenu_WindowArrange
call AppendMenuA

mov rcx,g_hMenuChild0_Window
xor rdx,rdx ;MF_STRING or MF_ENABLED
mov r8,IDM_WINDOW_CLOSEALL
lea r9,szMenu_WindowCloseAll
call AppendMenuA

;lbl_CreateMenuChild0_End:


