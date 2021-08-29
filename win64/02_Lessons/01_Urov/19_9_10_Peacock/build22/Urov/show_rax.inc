;;show_rax_xx.inc
;в секции .data? определить переменые:
;eedx db 17 dup (0)
;template db '0123456789ABCDEF'
;MesMsgBox db 'Отладка (содержимое rax):',0

;xlat instruction
;AL = [RBX][AL]

show_rax MACRO
LOCAL SetDigit
	push rax
	push rbx
	push rcx
	push rdx
	push r8
	push r9

;Store input Value
	mov r8,rax
;Prepare the Table for XLAT
	lea rbx,template
;Output Address
	lea rdx,eedx
	add rdx,16

	mov rcx,16 ;Digit Counter 16*4 = 64
SetDigit:
	mov rax,r8  ;Reload
	and rax,0Fh ;Crop
	xlat ;rax = template[al]
	dec rdx ;Next Input
	mov byte ptr [rdx],al ;Write
	ror r8,4 ;Next Output
loop SetDigit

	;xor rcx,rcx
	;lea rdx,eedx
	lea r8,MesMsgBox
	mov r9,40h ;MB_ICONINFORMATION+MB_OK
	call MessageBoxA

	pop r9
	pop r8
	pop rdx
	pop rcx
	pop rbx
	pop rax
ENDM ;show_rax
