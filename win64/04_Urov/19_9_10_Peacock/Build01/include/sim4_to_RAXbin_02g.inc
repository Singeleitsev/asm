;MACRO translating pBCD to hex
;input: 8-byte variable containing 4-byte 4-digit right-to-left decimal number
;output: same variable containing hexadecimal value of given BCD

sim4_to_RAXbin MACRO sim4
local m1
	push rax
	push rbx
	push rcx
	push rdx

	mov rbx,1
	mov rax,sim4 ;rax = 0000.0000.3433.3231
	bswap eax ;rax = 0000.0000.3132.3334
	mov sim4,0

	push rax
mov rcx,4
m1:
	and rax,0Fh
	imul rax,rbx
	imul rbx,10
	add sim4,rax
	add rdx,rax
	pop rax
	shr rax,8
	push rax
loop m1
	pop rax

	pop rdx
	pop rcx
	pop rbx
	pop rax
ENDM ;sim4_to_RAXbin