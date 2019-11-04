wmNgonCreate:

;NGONDATA
;
;00h-N ;Number of Vertices
;04h-Alpha ;Minimal Angle
;08h-AlphaCurr ;Current Angle
;0Ch-CenterX
;10h-CenterY
;14h-Radius
;18h-i ;Iteration Counter
;1Ch-Buffer
;
;lpNgonX = [lpNgonData+20h]
;(N*4)-x[N];...;04h-x[1];00h-x[0]
;
;lpNgonY = [lpNgonData+20h+(N+1)*4]
;(N*4)-y[N];...;04h-y[1];00h-y[0]
;
;lpNgonR = [lpNgonData+20h+(N+1)*4+(N+1)*4]
;02h-b[0];01h-g[0];00h-r[0]
;05h-b[1];04h-g[1];03h-r[1]
;(N*3+3)-b[N];(N*3+2)-g[N];(N*3+1)-r[N]
;
;sizeof NGONDATA =
;= 20h+(N+1)*4+(N+1)*4+(N+1)*3 =
;= 20h+(N+1)*0Bh = (N*0Bh)+2Bh
;
;Vertex Colors are loaded in wmNgonCreate
;Coordinates of Vertices are calculated in wmNgonSize
;Coordinates of Current Point are calculated in wmNgonPaint

;Get Number of Vertices
	;HWND CreateDialogParamA(
	;HINSTANCE hInstance,
	;LPCSTR    lpTemplateName,
	;HWND      hWndParent,
	;DLGPROC   lpDialogFunc,
	;LPARAM    dwInitParam
	;);
	mov NBuffer,9 ;For Example

;Reserve Memory for Current Child
        sub rsp,20h
        call GetProcessHeap
        mov rcx,rax
        mov rdx,8 ;HEAP_ZERO_MEMORY
;sizeof NGONDATA = (N*0Bh)+20h
	xor rax,rax
	mov eax,NBuffer
	mov rbx,0Bh
	mul rbx
	add rax,2Bh
        mov r8,rax ;sizeof NGONDATA
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
	add ebx,NBuffer
	mov dword ptr [rax],ebx
;Get NgonData Variable Pointers
	include 711_GetData.asm

;Calculate Step Angle 
	finit
;Alpha = 360/N = 2*pi/N
	fldpi
	mov rdi,lpAlpha
	mov dword ptr[rdi],2
	;fimul because 2 is an Integer
	fimul dword ptr[rdi] ;2*pi
	mov rsi,lpNgonData ;N
	;fidiv because N is an Integer
	fidiv dword ptr[rsi] ;2*pi/N
	;mov rdi,lpAlpha
	fst dword ptr[rdi] ;Store Back

;Load Vertex Colors

;Red
	;mov lpGasketR ;r[0]
;Green
	;mov lpGasketG ;g[0]
;Blue
	;mov lpGasketB ;b[0]

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

