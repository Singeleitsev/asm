;===========================================================
WndProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;===========================================================
;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp
;Ensure the Stack is Aligned by 10h
	and rax,-16

;Store Values retrieved by DispatchMessageA:
	mov hWnd,rcx
	mov uMsg,rdx
	mov wParam,r8
	mov lParam,r9

;Distributing with respect to uMsg
	cmp rdx,1 ;WM_CREATE = 0x0001
		je wmCreate
	;cmp rdx,6 ;WM_ACTIVATE = 0x0006
		;je wmActivate
	cmp rdx,202h ;WM_LBUTTONUP = 0x0202
		je wmLButtonUp
	cmp rdx,205h ;WM_RBUTTONUP = 0x0205
		je wmRButtonUp
        cmp rdx,10h ;WM_CLOSE = 0x0010
                je wmClose ;mdidemo4018F5
	cmp rdx,2 ;WM_DESTROY = 0x0002
		je wmDestroy
	jmp defWndProc

wmCreate:
;https://ru.wikipedia.org/wiki/Beep
	sub rsp,20h ;Must be 20h
	mov rcx,294 ;dwFreq = 294 Hz
	mov rdx,125 ;dwDuration = 1000/8 ms
	call Beep
	mov rcx,440 ;dwFreq = 440 Hz
	mov rdx,250 ;dwDuration = 1000/4 ms
	call Beep
	mov rcx,524 ;dwFreq = 262*2 Hz
	mov rdx,250 ;dwDuration = 1000/4 ms
	call Beep
	mov rcx,660 ;dwFreq = 330*2 Hz
	mov rdx,250 ;dwDuration = 1000/4 ms
	call Beep
	mov rcx,415 ;dwFreq = 415 Hz
	mov rdx,125 ;dwDuration = 1000/8 ms
	call Beep
	mov rcx,440 ;dwFreq = 440 Hz
	mov rdx,1000 ;dwDuration = 1000 ms
	call Beep
	add rsp,20h ;Must be 20h
	xor rax,rax
	jmp endWndProc
;wmActivate:
	;xor rax,rax
	;jmp endWndProc
wmLButtonUp:
	sub rsp,20h ;Must be 20h
	lea rsi,f
	xor rdi,rdi
	gamma:
		mov rcx,qword ptr [rsi] ;dwFreq
		mov rdx,500 ;dwDuration = 500 ms
		call Beep
		add rsi,8
		inc rdi
		cmp rdi,7
		jl gamma
		add rsp,20h ;Must be 20h
	;Quit
	xor rax,rax
	jmp endWndProc
wmRButtonUp:
	sub rsp,20h
	xor rcx,rcx ;uType
	call MessageBeep
	add rsp,20h
	jmp endWndProc
wmClose:
	Call4 MessageBoxA,hWnd,offset szExit,offset szAppTitle,21h
	cmp rax,1 ;IDOK
	je defWndProc
	xor rax,rax
	jmp endWndProc
wmDestroy:
	Call1 PostQuitMessage,0
	xor rax,rax
	jmp endWndProc
defWndProc:
	Call4 DefWindowProcA,hWnd,uMsg,wParam,lParam
endWndProc:
;Assembler will add this epilogue automatically:
	;leave 
	ret
WndProc endp


