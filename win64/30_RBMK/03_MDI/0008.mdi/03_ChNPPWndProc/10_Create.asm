wmChNPPCreate:

sub rsp,20h
call GetProcessHeap
mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
mov r8,10h ;sizeof HELLODATA
call HeapAlloc ;RtlAllocateHeap
add rsp,20h
mov lpChNPPData,rax

;Spell64rax hwnd, szFrameTitle, szHeapAddress

;lpChNPPData->iColor = IDM_BLACK ;
	mov rax,lpChNPPData
	mov qword ptr [rax],IDM_BLACK ;lpChNPPData+0

;lpChNPPData->clrText = RGB (0, 0, 0) ;
        mov qword ptr [rax+8],0 ;lpChNPPData+8

Call3 SetWindowLongPtrA,hwnd,0,lpChNPPData
;cmp rax,0
;je errChNPPWndProc
        
;Save some window handles
	Call1 GetParent,hwnd
	mov s_hwndClientChNPP,rax
	Call1 GetParent,s_hwndClientChNPP
	mov s_hwndFrameChNPP,rax

xor rax,rax
jmp endChNPPWndProc

