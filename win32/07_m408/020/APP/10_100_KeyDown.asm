;wmKeyDown:

mov eax,wParam
movzx eax,al ;LOWORD(wParam)

cmp eax,0FFh ;VK codes are 0...0xFE
jae WndProc_Return0

;Immediate keys
cmp eax,1Bh ;VK_ESCAPE
jne @f
;First Esc Hit - Set the Entire Scene to the Default Position
cmp isInitialPosition,0
jne secondEsc
call ResetScene
jmp WndProc_Return0
;Second Esc Hit - Close the Window
secondEsc:
invoke CloseWndProc,hWnd
jmp WndProc_Return0

@@:
cmp eax,20h ;VK_SPACE
jne @f
call ResetScene
jmp WndProc_Return0

@@:
cmp eax,0Dh ;VK_RETURN (Enter)
jne @f
call AboutProc
jmp WndProc_Return0

@@:
;Held keys - Will be handled in CheckKeys proc
mov byte ptr[key+eax],1
;jmp WndProc_Return0

