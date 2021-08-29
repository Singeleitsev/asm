include win64a.inc
include gdi32.inc
includelib gdi32.lib
IMAGE_BASE	equ 400000h
cdIdTimer	equ 1
PALETTE STRUCT
        blue	BYTE ?
        green	BYTE ?	
	red	BYTE ?	
	alpha	BYTE ?
PALETTE ENDS
.code

Random		proc
		push	rbx
		push	rcx
		push	rdx
		mov	ebx, eax
		mov	eax, vdSeed
		xor	edx, edx
		mov	ecx,127773
		div	ecx
		mov	ecx, eax
		mov	eax,16807
		mul	edx
		mov	edx, ecx
		mov	ecx, eax
		mov	eax,2836
		mul	edx
		sub	ecx, eax
		xor	edx, edx
		mov	eax, ecx
		mov	vdSeed, ecx
		div	ebx;base
		mov	eax, edx
		pop	rdx
		pop	rcx
		pop	rbx
		retn
Random		endp

Llamas		proc
		mov	rax, cdYSize
		dec	eax
		mul	cdXSize
		dec	eax
		add	rax, qword_4030A0
		mov	ebx, eax
		xor ecx,ecx

loc_401055:	mov	rsi, cdXSize
		cmp	ecx, dword_4030C0
		ja	@BLlamas
		inc	ecx

@BLlamas:	xor eax,eax
		mov	al, [rbx]
		push	rbx
		push	rcx
@@:		add	rbx, cdXSize
		add	al, [rbx]
		adc	ah, 0
		add	al, [rbx+1]
		adc	ah, 0
		add	al, [rbx-1]
		adc	ah, 0
		loop	@b
		pop	rcx
		pop	rbx
		sub	eax, 2
		jns	@f
		xor	eax, eax
@@:		mov	edi, eax
		mov	eax, 3
		mul	ecx
		inc	eax
		xchg	eax, edi
		div	edi
		mov	[rbx], al
		dec	ebx
		cmp	rbx, qword_4030A0
		jz	@f
		dec	esi
		jz	 loc_401055
		jmp	@BLlamas
@@:		retn
Llamas		endp


setBottomLine proc
		mov eax,cdXXSize
		call Random
		inc eax
		mov rcx,cdXSize
		xchg eax, ecx
		xor edx,edx
		div ecx
		mov ecx, eax
		mov rsi,cdYSize
		dec esi
		imul rsi,cdXSize
		add esi,ecx
		add rsi,qword_4030A0
@BucleBottom:	mov eax,100
		call Random
		cmp eax,11
		jbe loc_4010FD
		cmp eax,19
		jbe loc_401101
		cmp eax,59
		jbe loc_401105
		mov bl,[rsi+1]
		jmp @BBFin
loc_4010FD:	mov bl,0FFh
		jmp @BBFin
loc_401101:	mov bl,0
		jmp @BBFin
loc_401105:	mov bl,[rsi-1]
@BBFin:		mov [rsi],bl
		inc esi
		inc ecx
		cmp rcx,cdXSize
		jb @BucleBottom
		retn
setBottomLine		endp


proc_3		proc		

		push	rbp
		mov	ebp, esp
		sub	esp,20h
		mov	rdx,cdXSize
		imul	rdx,cdYSize          ; dwBytes
		mov ecx,42h		; uFlags
		call	GlobalAlloc
		mov	hMem,rax
		mov ecx,eax		; hMem
		call	GlobalLock
		mov	qword_4030A0,rax
		leave
		retn
proc_3		endp


CreaPaleta		proc		
		mov ecx,4*3Fh
@@:		mov	miPaleta.red[rcx], cl
		mov	miPaleta.green[rcx], 0
		mov	miPaleta.blue[rcx], 0
		mov	miPaleta.alpha[rcx], 0
		mov	miPaleta.red[rcx+100h], 0FFh
		mov	miPaleta.green[rcx+100h], cl
		mov	miPaleta.blue[rcx+100h], 0
		mov	miPaleta.alpha[rcx+100h], 0
		mov	miPaleta.red[rcx+200h], 0FFh
		mov	miPaleta.green[rcx+200h], 0FFh
		mov	miPaleta.blue[rcx+200h], cl
		mov	miPaleta.alpha[rcx+200h], 0		
                mov	dword ptr miPaleta[rcx+300h],0FFFFFFh
		sub	ecx, 4
		jns	@b
		retn
CreaPaleta		endp


DrawPixel proc
		push	rbx
		push	rcx
		push	rdx
		push	rdi
		mov	rcx,cdXSize
		imul	rcx,cdYSize
		mov	edi, pDIBFire
		mov	rsi,qword_4030A0
@@:		movzx	ebx,byte ptr [rsi]
		mov	eax,dword ptr miPaleta[rbx*4]
		stosd
		inc	esi
		loop @b
		pop	rdi
		pop	rdx
		pop	rcx
		pop	rbx
		retn
DrawPixel		endp

WndProc	proc hWnd:QWORD,Msg:QWORD,wParam:QWORD,lParam:QWORD

local ps:PAINTSTRUCT

		push	rbp
		mov	ebp, esp
		sub	esp,(50h+sizeof PAINTSTRUCT+15)and(-16)

		mov	hWnd,rcx
		mov	wParam,r8
		mov	lParam,r9
		cmp	edx, WM_DESTROY
		jz	wmDESTROY
                cmp	edx, WM_PAINT
		jz	wmPAINT
                cmp	edx, WM_SIZE
		jz	wmSIZE
                cmp	edx, WM_TIMER
		jz	wmTIMER
		leave
                jmp	DefWindowProc
; ---------------------------------------------------------------------------
wmDESTROY::	mov ecx,1		; bShow
		call	ShowCursor
		mov rdx,hOldBmp		; h
		mov rcx,bufDIBDC		; hdc
		call	SelectObject
		mov rcx,bufDIBDC		; hdc
		call	DeleteDC
		mov rcx,hDIBFire		; ho
		call	DeleteObject
		mov rcx,qword_4030A0	; hMem
		call	GlobalUnlock
		mov rcx,hMem		; hMem
		call	GlobalFree
		mov rcx,hWnd
		call	DestroyWindow
		xor ecx,ecx		; nExitCode
		call	ExitProcess
; ---------------------------------------------------------------------------
wmSIZE:         cmp	wParam, 2
		jnz	wmBYE
		xor ecx,ecx		; bShow
		call	ShowCursor
		movzx	eax,word ptr lParam
		mov	cdXSize,rax
		mov	BitmapInfo.bmiHeader.biWidth, eax
		shr	eax, 1
		mov	dword_4030B4, eax
		movzx	eax,word ptr lParam+2
		mov	cdYSize,rax
		mov	BitmapInfo.bmiHeader.biHeight, eax
		neg	BitmapInfo.bmiHeader.biHeight
		shr	eax, 1
		mov	dword_4030B8, eax
		mov ebx,100
		xor edx, edx
		div ebx
		mov dword_4030C0, eax
		mov rax,cdXSize
		mov cdXXSize,eax
		sub cdXXSize, 14h
		call GetTickCount
		mov vdSeed, eax
		mov rcx,hWnd
		call GetDC
		mov hdc,rax
		mov ecx,eax; hdc
		call CreateCompatibleDC
		mov bufDIBDC,rax
                xor r8d,r8d		;DIB_RGB_COLORS=0
		mov [rsp+28h],r8; offset
		mov [rsp+20h],r8; hSection
		mov r9d,offset pDIBFire	; ppvBits		
		mov edx,offset BitmapInfo ; lpbmi
		mov rcx,hdc		; hdc
		call CreateDIBSection
		mov hDIBFire,rax
		mov edx,eax		; h
		mov rcx,bufDIBDC		; hdc
		call SelectObject
		mov hOldBmp,rax
		mov rdx,hdc		; hDC
		mov rcx,hWnd
		call ReleaseDC
		call CreaPaleta
		call proc_3
		call setBottomLine
		call Llamas
		mov flag, 0

		xor r9d,r9d		; lpTimerFunc
		mov r8d,40		; uElapse
		mov edx,cdIdTimer	; nIDEvent
		mov rcx,hWnd
		call SetTimer
		jmp wmBYE
; ---------------------------------------------------------------------------
wmTIMER:        cmp flag, 1
		jnz wmBYE
		mov flag, 0
		call setBottomLine
		call Llamas
		xor r8d,r8d		; bErase
		xor edx,edx		; lpRect
		mov rcx,hWnd
		call InvalidateRect
		jmp wmBYE
; ---------------------------------------------------------------------------
wmPAINT:        lea edx,ps
		mov rcx,hWnd
		call BeginPaint
		mov hdc,rax
		call DrawPixel
		mov qword ptr [rsp+40h],SRCCOPY; rop
                xor edx,edx		; x
		mov [rsp+38h],rdx	; y1
		mov [rsp+30h],rdx	; x1
		mov rax,bufDIBDC	; hdcSrc
                mov [rsp+28h],rax
		mov rax,cdYSize
		mov [rsp+20h],rax
		mov r9,cdXSize		; cx
		xor r8d,r8d		; cy		
		mov rcx,hdc		; hdc
		call BitBlt
		lea edx,ps
		mov rcx,hWnd
		call EndPaint
		mov flag, 1
wmBYE:		leave
		retn
WndProc		endp

WinMain		proc
local msg:MSG

		push	rbp
		mov	ebp, esp
		sub	esp,sizeof MSG

		xor ebx,ebx
		mov esi,IMAGE_BASE
		mov edi,offset ClassName ; "DesktopEnWnd"
		push rbx		;hIconSm
		push rdi		;lpszClassName
		push rbx		;lpszMenuName
		push COLOR_WINDOWTEXT;	hbrBackground
		push rbx		;hCursor
		push rbx        	;hIcon
		push rsi		;hInstance
		push rbx        	;cbClsExtra & cbWndExtra
		db 68h
		dd WndProc      	;lpfnWndProc
		push sizeof WNDCLASSEX	;cbSize & style
		mov ecx,esp		;addr WNDCLASSEX
		call	RegisterClassEx
		push rbx
		push rsi		;rsi=400000h
		push rbx
		push rbx
		push rbx
		push rbx
		push rbx
		push rbx
		mov r9d,WS_VISIBLE
		mov r8,rdi		;offset ClassName
		mov edx,edi		;offset ClassName
		xor ecx,ecx
		sub esp,20h		; dwExStyle
		call CreateWindowEx
		mov edx,SW_MAXIMIZE	; nCmdShow
		mov ecx,eax		; hWnd
		call ShowWindow
@@:     	lea ecx,msg
		xor edx,edx
		xor r8d,r8d
		xor r9d,r9d		
		call GetMessage
		cmp msg.wParam,VK_ESCAPE;user press 'Esc'?
		je wmDESTROY
		lea ecx,msg		
		call DispatchMessage
		jmp @b
WinMain		endp

.data
ClassName	db 'DesktopEnWnd',0
BitmapInfo BITMAPINFO <<28h,14Ah,0FFFFFF2Eh,1,20h,0,0,0,0,0,0>,<0>>
hdc		dq ?
hMem		dq ?
qword_4030A0	dq ?
dword_4030A4	dd ?
cdXSize		dq ?
cdYSize		dq ?
cdXXSize	dd ?
dword_4030B4	dd ?
dword_4030B8	dd ?
dword_4030C0	dd ?
flag		db ?
vdSeed		dd ?
bufDIBDC	dq ?
pDIBFire	dd ?
hDIBFire	dq ?
hOldBmp		dq ?			
miPaleta	PALETTE 100h dup (<>)
end
