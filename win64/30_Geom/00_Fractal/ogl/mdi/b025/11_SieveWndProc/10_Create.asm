wmR2Create:

call GetProcessHeap
mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,10h ;sizeof R2DATA
call HeapAlloc ;RtlAllocateHeap
mov lpR2Data,rax

;Spell64rax hwnd, szFrameTitle, szHeapAddress

;lpR2Data->iColor = IDM_BLACK ;
	mov rax,lpR2Data
	mov qword ptr [rax],IDM_BLACK ;lpR2Data+0

;lpR2Data->clrText = RGB (0, 0, 0) ;
        mov qword ptr [rax+8],0 ;lpR2Data+8

Call3 SetWindowLongPtrA,hwnd,0,lpR2Data
;cmp rax,0
;je errR2WndProc

;Start the timer going
        Call4 SetTimer,hwnd,1,0Ah,0 ;10 ms = 0Ah
        
;Save some window handles
	Call1 GetParent,hwnd
	mov s_hwndClientH,rax
	Call1 GetParent,s_hwndClientH
	mov s_hwndFrameH,rax



;------
;OpenGL
;------
 mov rcx,hwnd ; <-----
 call GetDC
 mov hdc,rax

 lea rdi,pfd
 mov rcx,5 ;sizeof.PIXELFORMATDESCRIPTOR shr 3

 xor eax,eax
 ;rep stosq qword ptr [rdi],rax
 rep stosq

 mov pfd.nSize,28h
 mov pfd.nVersion,1
 mov pfd.dwFlags,25h
 mov pfd.iLayerType,0
 mov pfd.iPixelType,0
 mov pfd.cColorBits,10h
 mov pfd.cDepthBits,10h
 mov pfd.cAccumBits,0
 mov pfd.cStencilBits,0

 mov rcx,hdc
 lea rdx,pfd
 call ChoosePixelFormat

 mov rcx,hdc
 mov edx,eax
 lea r8,pfd
 call SetPixelFormat

 mov rcx,hdc
 call wglCreateContext
 mov hrc,rax

 mov rcx,hdc
 mov rdx,hrc
 call wglMakeCurrent

 mov rcx,hwnd
 lea rdx,rc
 call GetClientRect

 mov rcx,0
 mov rdx,0
 mov r8d,rc.right
 mov r9d,rc.bottom
 call glViewport

xor rax,rax
jmp endR2WndProc


