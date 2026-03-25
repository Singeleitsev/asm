wmRBMKKeyDown:

cmp r8d,1Bh ;VK_ESCAPE
je vkEscape
jmp defRBMKWndProc

vkEscape:
Call1 GetParent,hwnd
Call4 SendMessageA,rax,221h,hwnd,0 ;WM_MDIDESTROY = 221h
jmp defRBMKWndProc