GetRandom64Proc proc


;Assembler will add this prologue automatically:
	;push rbp
	;mov rbp,rsp

;Align the Stack by 10h
	and rsp,-16
	sub rsp,100h

lea rcx,hProv
xor rdx,rdx ;pszContainer
xor r8,r8 ;pszProvider
mov r9,1 ;dwProvType = PROV_RSA_FULL = 1
mov qword ptr [rsp+20h],0 ;dwFlags
call CryptAcquireContext

mov rcx,hProv
mov rdx,dwLen
lea r8,pbBuffer
call CryptGenRandom

mov rcx,hProv
xor rdx,rdx ;dwFlags
call CryptReleaseContext

;Return Value
	mov rax,pbBuffer

;Assembler will add this epilogue automatically:
	;leave
	ret

GetRandom64Proc endp



