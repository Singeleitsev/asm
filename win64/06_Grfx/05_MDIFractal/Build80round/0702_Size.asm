wmNgonSize:

cmp wParam,1 ;SIZE_MINIMIZED
        je defNgonWndProc


;Set NgonData Variable Pointers
;lpNgonData = (lpNgonRECTDATA) GetWindowLong (hwnd, 0) ;
	call SetNgonDataPointers


;[R8] = CenterX
;RAX = xWidth = LOWORD (lParam)
	mov rax,lParam
	and rax,0FFFFh
	shr rax,1 ;rax = rax/2 = w/2
	mov r8,lpNgonCenterX
	mov dword ptr [r8],eax
;[R9] = CenterY
;RBX = yHeight = HIWORD (lParam)
        mov rbx,lParam
        shr rbx,10h ;HIWORD (lpNgonaram)
        and rbx,0FFFFh
	shr rbx,1 ;rbx = rbx/2 = h/2
	mov r9,lpNgonCenterY
	mov dword ptr [r9],ebx
;[RDX] = Radius
	mov rdx,lpNgonRadius
	cmp rax,rbx
	;If X > Y then R = Y
	jg lblNgonRadiusV
	;If X < Y then R = X
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
	mov rax,lpNgonAlphaCurr
	mov dword ptr [rax],0 ;AlpNgonhaCurr = 0
;[RBX] = Minimal Angle
	mov rbx,lpNgonAlpha
;[RDX] = Radius
	mov rdx,lpNgonRadius
;[R8] = CenterX
	mov r8,lpNgonCenterX
;[R9] = CenterY
	mov r9,lpNgonCenterY
;[RSI] = x[0]
	mov rsi,lpNgonX
;[RDI] = y[0]
	mov rdi,lpNgonY

	finit
lblNgonCalcVertex:
;Next Step
	add rsi,4 ;Next X
	add rdi,4 ;Next Y
;x[i] = r*cos(a)+xC
	fld dword ptr [rax] ;a
	fcos ;cos(a)
	fimul dword ptr [rdx] ;r*cos(a)
	fiadd dword ptr [r8] ;r*cos(a)+xC
	fistp dword ptr [rsi] ;Integer
;y[i] = r*sin(a)+yC
	fld dword ptr [rax] ;a
	fsin ;sin(a)
	fimul dword ptr [rdx] ;r*sin(a)
	fiadd dword ptr [r9] ;r*sin(a)+yC
	fistp dword ptr [rdi] ;Integer
;Increase Angle
	fld dword ptr [rax] ;a
	fadd dword ptr [rbx] ;a = a + a0
	fstp dword ptr [rax] ;Real
;Check for Loop
	dec rcx
	cmp rcx,0
jg lblNgonCalcVertex ;Loop


;break
;WM_SIZE must be processed by DefMDIChildProc
jmp defNgonWndProc


