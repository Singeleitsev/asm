wmNgonCreate:

	mov NgonSides,9 ;For Example

;Get Number of Vertices
	;HWND CreateDialogParamA(
	;HINSTANCE hInstance,
	;LPCSTR    lpTemplateName,
	;HWND      hWndParent,
	;DLGPROC   lpDialogFunc,
	;LPARAM    dwInitParam);

;Reserve Memory for Current Child
        sub rsp,20h
;RCX = Handle to the Default Heap of the Calling Process
        call GetProcessHeap
        mov rcx,rax
;R8 = sizeof NGONDATA = (N*0Bh)+2Bh
;See '711-SetPointers.asm'
	xor rax,rax
	mov eax,NgonSides
	mov rbx,0Bh
	mul rbx
	add rax,2Bh
        mov r8,rax ;sizeof NGONDATA
;RDX = HEAP_ZERO_MEMORY = 8
;Must be here because of MUL instruction above
	mov rdx,8
        call HeapAlloc ;RtlAllocateHeap
        add rsp,20h
        mov lpNgonData,rax

;SetWindowLong (hwnd, 0, (long) lpNgonData)
        Call3 SetWindowLongPtrA,hwnd,0,lpNgonData

;Re-Load NGONDATA address
;lpNgonData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	Call2 GetWindowLongPtrA,hwnd,0
	mov lpNgonData,rax

;NOTE! The Number of Vertices must be stored
;as soon as possible
;to set the NGONDATA Pointers correctly
	xor rbx,rbx
	mov ebx,NgonSides
	mov dword ptr [rax],ebx


;Get NgonData Variable Pointers
	call SetNgonDataPointers

;Calculate Step Angle 
	call SetNgonStepAngle

;Calculate Colors
	call SetNgonColors


;Start the timer going
        ;Call4 SetTimer,hwnd,1,0FFh,0

;Save some window handles
        Call1 GetParent,hwnd
        mov hwndClientN,rax
        Call1 GetParent,hwndClientN
        mov hwndFrameN,rax

;return 0
xor rax,rax
jmp endNgonWndProc

