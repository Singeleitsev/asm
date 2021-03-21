lblTreeMarginInflate:
;Inflate Width
	xor rbx,rbx ;Clean the Buffer
	xor rcx,rcx ;Clean the Buffer
	xor r8,r8 ;Clean the Buffer
lblTreeMarginCheckWidth:
	mov rax,lpTreeML;Margin Left
	;If there is no place
	;then skip Width inflation
	cmp dword ptr [rax],1 ;1-pixel Border 
	je lblTreeMarginCheckHeight  
lblTreeMarginCheckLeft:
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi] ;rdx = x2
	mov rax,lpTreeML ;Margin Left
	mov ecx,dword ptr [rax] ;rcx = ml
	;If the Point is less than Left
	;then inflate Width
	cmp edx,ecx ;x2 <> ml
	jle lblTreeMarginShiftWidth
lblTreeMarginCheckRight:
	mov rsi,lpTreeX2
	mov edx,dword ptr [rsi] ;rdx = x2
	mov rax,lpTreeMR ;Margin Right
	mov ecx,dword ptr [rax] ;rcx = mr
	;If the Point is less than Right
	;then skip inflation
	cmp edx,ecx ;x2 <> mr
	jl lblTreeMarginCheckHeight
lblTreeMarginShiftWidth:
	mov rax,lpTreeML ;Margin Left
	dec dword ptr [rax] ;ml = ml - 1
	mov rax,lpTreeMR ;Margin Right
	inc dword ptr [rax] ;mr = mr + 1
	mov rax,lpTreeMW ;Margin Width
	add dword ptr [rax],2

;Inflate Height
lblTreeMarginCheckHeight:
	mov rax,lpTreeMT ;Margin Top
	;If there is no place
	;then skip Height inflation
	cmp dword ptr [rax],1 ;1-pixel Border
	je lblTreeNewX
lblTreeMarginCheckTop:
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi] ;r8d = y2
	mov rax,lpTreeMT ;Margin Top
	mov ecx,dword ptr [rax] ;rcx = mt
	;If the Point is above the Top
	;then inflate Height
	cmp r8d,ecx ;y2 <> mt
	jle lblTreeMarginShiftHeight
lblTreeMarginCheckBottom:
	mov rdi,lpTreeY2
	mov r8d,dword ptr [rdi] ;r8d = y2
	mov rax,lpTreeMB ;Margin Bottom
	mov ecx,dword ptr [rax] ;rcx = mb
	;If the Point is above the Bottom
	;then skip inflation
	cmp r8d,ecx ;y2 <> mb
	jl lblTreeNewX
lblTreeMarginShiftHeight:
	mov rax,lpTreeMT ;Margin Top
	dec dword ptr [rax] ;mt = mt - 1
	mov rax,lpTreeMB ;Margin Bottom
	inc dword ptr [rax] ;mb = mb + 1
	mov rax,lpTreeMH ;Margin Height
	add dword ptr [rax],2

jmp lblTreeLoopCheck


