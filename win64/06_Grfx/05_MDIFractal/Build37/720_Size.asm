wmNgonSize:

cmp wParam,1 ;SIZE_MINIMIZED
        je defNgonWndProc

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
;lpNgonData = (LPRECTDATA) GetWindowLong (hwnd, 0) ;
	include 711_GetData.asm

;[R8] = CenterX
;RAX = xWidth = LOWORD (lParam)
	mov rax,lParam
	and rax,0FFFFh
	shr rax,1 ;rax = rax/2 = w/2
	mov r8,lpCenterX
	mov dword ptr [r8],eax
;[R9] = CenterY
;RBX = yHeight = HIWORD (lParam)
        mov rbx,lParam
        shr rbx,10h ;HIWORD (lParam)
        and rbx,0FFFFh
	shr rbx,1 ;rbx = rbx/2 = h/2
	mov r9,lpCenterY
	mov dword ptr [r9],ebx
;[RDX] = Radius
	mov rdx,lpRadius
	cmp rax,rbx
	;If X > Y then R = Y
	jg lblNgonRadiusV
	;If Y > X then R = X
;lblNgonRadiusH:
	mov dword ptr [rdx],eax
	jmp CalcCoords	
lblNgonRadiusV:
	mov dword ptr [rdx],ebx

;Calculate Coordinates
CalcCoords:
;[RCX] = Counter
	xor rcx,rcx
	mov rax,lpNgonData ;N
	mov ecx,dword ptr [rax]
;[RAX] = Current Angle
	mov rax,lpAlphaCurr
	mov dword ptr [rax],0 ;AlphaCurr = 0
;[RBX] = Minimal Angle
	mov rbx,lpAlpha
;[RDX] = Radius
	mov rdx,lpRadius
;[R8] = CenterX
	mov r8,lpCenterX
;[R9] = CenterY
	mov r9,lpCenterY
;[RSI] = x[0]
	mov rsi,lpNgonX
;[RDI] = y[0]
	mov rdi,lpNgonY

lblNgonCalcVertex:
;Next Step
	add rsi,4 ;Next X
	add rdi,4 ;Next Y
;x[i] = r*cos(a)+xC
	finit
	fld dword ptr [rax] ;a
	fcos ;cos(a)
	fimul dword ptr [rdx] ;r*cos(a)
	fiadd dword ptr [r8] ;r*cos(a)+xC
	fist dword ptr [rsi]
;y[i] = r*sin(a)+yC
	finit
	fld dword ptr [rax] ;a
	fsin ;sin(a)
	fimul dword ptr [rdx] ;r*sin(a)
	fiadd dword ptr [r9] ;r*sin(a)+yC
	fist dword ptr [rdi]
;Increase Angle
	finit
	fld dword ptr [rax] ;a
	fadd dword ptr [rbx] ;a = a + a0
	fst dword ptr [rax]
;Check for Loop
	dec rcx
	cmp rcx,0 ;Skip the Last Step
jg lblNgonCalcVertex ;Loop


;break
;WM_SIZE must be processed by DefMDIChildProc
jmp defNgonWndProc


