option casemap:none
;Standard Includes and Libraries
	include D:\bin\dev\ml64\include\user32.inc
	include D:\bin\dev\ml64\include\kernel32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
;Custom includes
	include include\Spell_09.inc

.const
;Window Caption
	szCaption db 'AVX playground',0
	szError db 'AVX instructions are not supported',0
;pi
	pi dq 3.14159265389

.data
;Formatted String
	szFmt db "hInstance = %016Xh",0Ah, "hIcon = %016Xh",0Ah, "hCursor = %016Xh",0
	n = $ - szFmt + 33
	szText db n dup (?)
;Output Messages
	szYMM0 db  "ymm0:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM1 db  "ymm1:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM2 db  "ymm2:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM3 db  "ymm3:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM4 db  "ymm4:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM5 db  "ymm5:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM6 db  "ymm6:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM7 db  "ymm7:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM8 db  "ymm8:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM9 db  "ymm9:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM10 db "ymm10:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM11 db "ymm11:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM12 db "ymm12:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM13 db "ymm13:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM14 db "ymm14:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah
	szYMM15 db "ymm15:", 9,  "%f", 9, "%f", 9, "%f", 9, "%f" ,0; 0Dh,0Ah

.data?
	bBuffer db 1000h dup ?

.code
WinMain proc
;Align the Stack by 10h
	mov rax,rsp
	and rax,0Fh
;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;Check for (in)compatibility
	mov eax,1
	cpuid
	and ecx,18000000h
	cmp ecx,18000000h
	jne noAVX
	xor ecx,ecx ;XCR0 will be read
	xgetbv ;Get Value of Extended Control Register
	and eax,110b
	cmp eax,110b
	jne noAVX

;Broadcast double-precision floating-point element in mem to four locations in ymm0
	vbroadcastsd ymm0,x ;ymm0 = |pi|pi|pi|pi|

	vsqrtpd ymm1,ymm0 ;ymm1 = |sqrt(pi)|sqrt(pi)|sqrt(pi)|sqrt(pi)|

	vsubpd ymm2,ymm0,ymm1 ;ymm2 = |ymm0-ymm1|ymm0-ymm1|ymm0-ymm1|ymm0-ymm1|
	vsubpd ymm3,ymm1,ymm2 ;ymm3 = |ymm1-ymm2|ymm1-ymm2|ymm1-ymm2|ymm1-ymm2|

	vaddpd xmm4,xmm2,xmm3 ;xmm4 = |xmm2+xmm3|xmm2+xmm3|0|0|
	vaddpd ymm5,ymm4,ymm0 ;ymm5 = |ymm4+ymm0|ymm4+ymm0|ymm0|ymm0|

;Permute 128-bit floating-point fields in ymm4 and ymm5 using controls from imm8
;and store result in ymm6
;imm8[1:0] select the source for the first destination 128-bit field,
	;0: DEST[127:0] <- SRC1[127:0]
	;1: DEST[127:0] <- SRC1[255:128]
	;2: DEST[127:0] <- SRC2[127:0]
	;3: DEST[127:0] <- SRC2[255:128]
;imm8[5:4] select the source for the second destination field.
	;0: DEST[255:128] <- SRC1[127:0]
	;1: DEST[255:128] <- SRC1[255:128]
	;2: DEST[255:128] <- SRC2[127:0]
	;3: DEST[255:128] <- SRC2[255:128]
;If imm8[3] is set, the low 128-bit field is zeroed.
	;DEST[127:0] <- 0
;If imm8[7] is set, the high 128-bit field is zeroed.
	;DEST[MAXVL-1:128] <- 0
	vperm2f128 ymm6,ymm4,ymm5,03h ;ymm6 = |ymm5|ymm5|ymm4|ymm4|

;Shuffle four pairs of double-precision floating-point values from ymm6 and ymm5
;using imm8 to select from each pair, interleaved result is stored in ymm7.
	vshufpd ymm7,ymm6,ymm5,10010011b

;Round packed double-precision floating-point values in xmm7 and place the result in xmm8.
;The rounding mode is determined by imm8.
	vroundpd ymm8,ymm7,0011b ;Round toward zero (Truncate)
	vroundpd ymm9,ymm7,0 ;Round to nearest (even)





;Format Data
	lea rcx,bBuffer ;lpOut
	lea rdx,szCaption ;lpFmt
	mov r8, hInstance ;arg_1
	mov r9, hIcon ;arg_2
	mov rax, hCursor
	mov qword ptr [rsp+20h], rax ;arg_n
	call wsprintf
;Show Message
	xor rcx,rcx ;hWnd = HWND_DESKTOP = 0
	lea rdx,szText ;lpText
	lea r8,szCaption ;lpCaption
	mov r9,40h ;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h
	call MessageBoxA

	xor rcx,rcx
	call ExitProcess
WinMain endp
end