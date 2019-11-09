option casemap:none
;Standard Libraries
	includelib C:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib C:\bin\dev\ml64\VS2017\lib\kernel32.lib
	includelib C:\bin\dev\ml64\VS2017\lib\msvcrt.lib
;Custom includes
	include include\API64.inc

.const
;Window Caption
	szCaption db 'AVX playground',0
	szError db 'AVX instructions are not supported',0
;pi
	pi dq 3.14159265389

.data
;Output Messages
	szYMM db 'ymm0:  %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm1:  %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm2:  %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm3:  %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm4:  %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm5:  %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm6:  %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm7:  %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm8:  %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm9:  %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm10: %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm11: %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm12: %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm13: %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm14: %f,%f,%f,%f', 0Ah,0Dh
	db 'ymm15: %f,%f,%f,%f', 0

.data?
	bBuffer db 1000h dup (?)

.code
WinMain proc
;Align the Stack by 10h
	and rsp,-16

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
	vbroadcastsd ymm0,pi ;ymm0 = |pi|pi|pi|pi|

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


	sub rsp,410h

	vmovups [rsp+10h],ymm0
	vmovups [rsp+30h],ymm1
	vmovups [rsp+50h],ymm2
	vmovups [rsp+70h],ymm3
	vmovups [rsp+90h],ymm4
	vmovups [rsp+0B0h],ymm5
	vmovups [rsp+0D0h],ymm6
	vmovups [rsp+0F0h],ymm7
	vmovups [rsp+110h],ymm8
	vmovups [rsp+130h],ymm9
	vmovups [rsp+150h],ymm10
	vmovups [rsp+170h],ymm11
	vmovups [rsp+190h],ymm12
	vmovups [rsp+1B0h],ymm13
	vmovups [rsp+1D0h],ymm14
	vmovups [rsp+1F0h],ymm15


;Format Data
	lea rcx,bBuffer ;buffer
	lea rdx,szYMM ;format
	mov r8,qword ptr[rsp+10h] ;argument?
	mov r9,qword ptr[rsp+18h] ;locale?
	call sprintf
;Show Message
	xor rcx,rcx ;hWnd = HWND_DESKTOP = 0
	lea rdx,bBuffer ;lpText
	lea r8,szCaption ;lpCaption
	mov r9,40h ;uType = MB_OK + MB_ICONINFORMATION = 0 + 40h
	call MessageBoxA

	xor rcx,rcx ;Return 0
	jmp AppExit

 noAVX:
	sub rsp,20h
	xor ecx,ecx
	lea rdx,szError
	lea r8,szCaption
	mov r9,10h
	call MessageBoxA
	mov ecx,1 ;Return 1

AppExit:
	call FatalExit
WinMain endp
end