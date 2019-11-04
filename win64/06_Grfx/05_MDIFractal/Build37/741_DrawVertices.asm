;DrawNgon:

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

;Get NgonData Variable Pointers
;lpNgonData = (LPRECTDATA) GetWindowLong (hwnd, 0)
	include 711_GetData.asm

;RAX = Counter
	mov rsi,lpNgonData ;N
	mov rdi,lpIteration
	mov eax,dword ptr[rsi]
	mov dword ptr[rdi],eax
;RSI = x[i]
	mov rsi,lpNgonX
;RDI = y[i]
	mov rdi,lpNgonY

	sub rsp,20h ;call SetPixel
@@:
;lblNgonNewPoint:
	add rsi,4 ;Next X
	add rdi,4 ;Next Y
;rcx = hDC
	mov rcx,hdc
;rdx = x_i
	xor rdx,rdx
	mov edx,dword ptr [rsi]
;r8 = y_i
	xor r8,r8
	mov r8d,dword ptr [rdi]
;r9 = Color
	xor r9,r9
	mov r9,0FFFFFFh ;White
	call SetPixel

;Check for Loop
	mov rax,lpIteration
	dec dword ptr[rax]
	cmp dword ptr[rax],0 ;Skip the Last Cycle
jg @b ;lblNgonNewPoint

	add rsp,20h ;call SetPixel

