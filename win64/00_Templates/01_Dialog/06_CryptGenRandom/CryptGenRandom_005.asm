option casemap:none

;Standard Includes and Libraries
	include D:\bin\dev\ml64\VS2015\include\user32.inc
	include D:\bin\dev\ml64\VS2015\include\kernel32.inc
	includelib D:\bin\dev\ml64\VS2017\lib\user32.lib
	includelib D:\bin\dev\ml64\VS2017\lib\kernel32.lib
;Extended Includes and Libraries
	include include\Advapi32.inc ;extern CryptGenRandom:proc
	includelib include\Advapi32.lib
;Custom Includes
	include include\Spell_09.inc

.const
	szCaption db "Cryptography Next Generation APIs", 0
.data
	szText db "Generated Random Number: 0000.0000.0000.0000h",0
	hProv dq ?
	Buffer dq ? ;db 8 dup (?)
	dwLen = $-Buffer

.code
WinMain proc
;Align the Stack by 10h
	mov rax,rsp
	and rax,0Fh
 ;Reserve 80h Bytes as Buffer for possible 16 Parameters
	add rax,80h
	sub rsp,rax

;invoke CryptAcquireContext, addr hProv,0,0,PROV_RSA_FULL,0
	lea rcx,hProv
	xor rdx,rdx ;pszContainer
	xor r8,r8 ;pszProvider
	mov r9,1 ;dwProvType = PROV_RSA_FULL = 1
	mov qword ptr [rsp+20h],0 ;dwFlags
	call CryptAcquireContext
;invoke CryptGenRandom, hProv,5,addr Buffer
	mov rcx,hProv
	mov rdx,dwLen
	lea r8,Buffer ;pbBuffer
	call CryptGenRandom
;invoke CryptReleaseContext, hProv,0
	mov rcx,hProv
	xor rdx,rdx ;dwFlags
	call CryptReleaseContext

;Show Message
	mov rax,Buffer
	Spell64rax 0,szCaption,szText
;EndAll
	xor rcx,rcx
	call ExitProcess
WinMain endp
end