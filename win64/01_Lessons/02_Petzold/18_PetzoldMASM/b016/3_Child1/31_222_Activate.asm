wmChild1Activate:

;if (lParam == (LPARAM) hwnd)
;mov r9,lParam
cmp hwnd,r9
jne notChild1

;Child1:
mov rcx,g_hWndClient
mov rdx,230h ;WM_MDISETMENU
mov r8,g_hMenuChild1
mov r9,g_hMenuChild1_Window
call SendMessageA
jmp lbl_Child1_DrawMenu

notChild1:
mov rcx,g_hWndClient
mov rdx,230h ;WM_MDISETMENU
mov r8,g_hMenuFrame
mov r9,g_hMenuFrame_File
call SendMessageA

lbl_Child1_DrawMenu:
mov rcx,g_hWndFrame
call DrawMenuBar

;return 0
xor rax,rax
jmp endChild1WndProc

