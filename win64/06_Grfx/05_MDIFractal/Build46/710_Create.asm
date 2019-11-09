wmNgonCreate:

;Get Number of Vertices
	;HWND CreateDialogParamA(
	;HINSTANCE hInstance,
	;LPCSTR    lpTemplateName,
	;HWND      hWndParent,
	;DLGPROC   lpDialogFunc,
	;LPARAM    dwInitParam);

	mov NBuffer,9 ;For Example

;Reserve Memory for Current Child
        sub rsp,20h
;RCX = Handle to the Default Heap of the Calling Process
        call GetProcessHeap
        mov rcx,rax
;R8 = sizeof NGONDATA = (N*0Bh)+20h
	xor rax,rax
	mov eax,NBuffer
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

;Store Number of Vertices
;To be drawn in current Child Window
	xor rbx,rbx
	mov ebx,NBuffer
	mov dword ptr [rax],ebx


;Get NgonData Variable Pointers
	include 711_SetPointers.asm

;Calculate Step Angle 
	include 712_SetAngle.asm

;Calculate Colors
	include 713_SetColors.asm


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

