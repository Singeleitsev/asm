;MACRO translating pBCD to hex
;input: 8-byte variable containing 4-byte 4-digit right-to-left decimal number
;output: same variable containing hexadecimal value of given BCD

sim4_to_RAXbin MACRO sim4
local m1
	push rax
	push rbx
	push rcx
	push rdx

	mov rbx,sim4 ;rbx = 0000.0000.3433.3231
	bswap ebx ;rbx = 0000.0000.3132.3334
	and rbx,0F0F0F0Fh ;rbx = 0000.0000.0102.0304
	mov rcx,1 ;Degrees of Ten
	mov sim4,0
m1:
	xor rax,rax
	mov al,bl
	mul ecx
	add sim4,rax
	ror ebx,8
	imul ecx,10
	cmp ecx,1000
	jle m1

	pop rdx
	pop rcx
	pop rbx
	pop rax
ENDM ;sim4_to_RAXbin