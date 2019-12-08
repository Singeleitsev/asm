;Calculate Step Angle
SetNgonStepAngle:
 
	finit
;Alpha = 360/N = 2*pi/N
	fldpi
	mov rdi,lpNgonAlpha
	mov dword ptr[rdi],2
	;fimul because 2 is an Integer
	fimul dword ptr[rdi] ;2*pi
	mov rsi,lpNgonData ;N
	;fidiv because N is an Integer
	fidiv dword ptr[rsi] ;2*pi/N
	;mov rdi,lpNgonAlpha
	fstp dword ptr[rdi] ;Store Back

;Assembler would place the 'leave' instruction as Epilogue
	;leave
;if the 'ret' instruction was used
	;ret
	pop rax
	jmp rax