;wmKeyDown:

xor rax,rax
mov al,r8b ;LOWORD(wParam)

;Immediate keys
cmp al,1Bh ;VK_ESCAPE
jne @f
;First Esc Hit - Set the Entire Scene to the Default Position
cmp isInitialPosition,0
jne secondEsc
call ResetScene
jmp WndProc_Return0
;Second Esc Hit - Close the Window
secondEsc:
;mov rcx,hWnd
call CloseWndProc ;Argument does not require a reassignment
jmp WndProc_Return0

@@:
cmp al,20h ;VK_SPACE
jne @f
call ResetScene
jmp WndProc_Return0

@@:
cmp al,0Dh ;VK_RETURN (Enter)
jne @f
call AboutProc
jmp WndProc_Return0

@@:
;Held keys - Will be handled in CheckKeys proc
lea rdi,key
add rdi,rax
mov byte ptr[rdi],1
;jmp WndProc_Return0

