wmChildActivate:

;mov rcx, hWnd
;mov r9, lParam
cmp r9,rcx
jne notChild

;Child:
;WM_MDISETMENU = 0x0230
Call4 SendMessageA, hWndClient, 230h, hChildMenu, hChildSubMenu
Call1 DrawMenuBar, hWndFrame

xor rax,rax
jmp endChildProc

notChild:
;WM_MDISETMENU = 0x0230
Call4 SendMessageA, hWndClient, 230h, hMainMenu, hMainSubMenu
Call1 DrawMenuBar, hWndFrame

xor rax,rax
jmp endChildProc