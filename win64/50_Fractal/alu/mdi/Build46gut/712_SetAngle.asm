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
	fstp dword ptr[rdi] ;Store Back