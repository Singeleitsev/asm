wmHelloCreate:

sub rsp,20h
call GetProcessHeap
mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,10h ;sizeof HELLODATA
call HeapAlloc ;RtlAllocateHeap
add rsp,20h
mov lpHelloData,rax

;Spell64rax hwnd, szFrameTitle, szHeapAddress

;lpHelloData->iColor = IDM_BLACK ;
	mov rax,lpHelloData
	mov qword ptr [rax],IDM_BLACK ;lpHelloData+0

;lpHelloData->clrText = RGB (0, 0, 0) ;
        mov qword ptr [rax+8],0 ;lpHelloData+8

Call3 SetWindowLongPtrA,hwnd,0,lpHelloData
;cmp rax,0
;je errHelloWndProc
        
;Save some window handles
	Call1 GetParent,hwnd
	mov s_hwndClientH,rax
	Call1 GetParent,s_hwndClientH
	mov s_hwndFrameH,rax

xor rax,rax
jmp endHelloWndProc

