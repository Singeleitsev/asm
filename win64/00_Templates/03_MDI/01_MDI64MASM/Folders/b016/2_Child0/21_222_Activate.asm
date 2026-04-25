wmChild0Activate:

;if (lParam == (LPARAM) hwnd)
mov r9,lParam
cmp r9,hwnd
jne notChild0

;Child0:
mov rcx,g_hWndClient
mov rdx,230h ;WM_MDISETMENU
mov r8,g_hMenuChild0
mov r9,g_hMenuChild0_Window
call SendMessageA

mov rcx,hwnd
xor rdx,rdx
call GetWindowLongPtrA
mov lpChild0Data,rax
mov rax,qword ptr[rax] ;Child0Data.iColor

mov rcx,g_hMenuChild0
mov rdx,rax
mov r8,8 ;MF_CHECKED = 8
call CheckMenuItem
jmp lbl_Child0_DrawMenu

notChild0:
mov rcx,hwnd
xor rdx,rdx
call GetWindowLongPtrA
mov lpChild0Data,rax
mov rax,qword ptr[rax] ;Child0Data.iColor

mov rcx,g_hMenuChild0
mov rdx,rax
xor r8,r8 ;MF_UNCHECKED = 0
call CheckMenuItem

mov rcx,g_hWndClient
mov rdx,230h ;WM_MDISETMENU
mov r8,g_hMenuFrame
mov r9,g_hMenuFrame_File
call SendMessageA

lbl_Child0_DrawMenu:
mov rcx,g_hWndFrame
call DrawMenuBar

;return 0
xor rax,rax
jmp endChild0WndProc


