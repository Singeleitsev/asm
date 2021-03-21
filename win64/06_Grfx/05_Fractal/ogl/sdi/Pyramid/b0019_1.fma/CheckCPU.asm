;jmp SetAVX ;Debug
;jmp SetSSE ;Debug
;jmp SetX87 ;Debug

;CheckFMA:
 mov eax,1
 cpuid
 and ecx,18001000h
 cmp ecx,18001000h
 jne noFMA

;SetFMA:
 lea rdi,[WindowProc.modeFMA]
 mov [lpMode],rdi
 jmp CreateMainWindow

noFMA:
 sub rsp,20h
 xor rcx,rcx
 lea rdx,[_errFMA]
 lea r8,[_title]
 mov r9,10h
 call [MessageBoxA]
 add rsp,20h

;CheckAVX:
 mov eax,1
 cpuid
 and ecx,18000000h
 cmp ecx,18000000h
 jne noAVX
 xor ecx,ecx
 xgetbv
 and eax,110b
 cmp eax,110b
 jne noAVX

;CheckRDRAND:
 mov eax,1
 cpuid
 and ecx,40000000h
 cmp ecx,40000000h
 jne noRDRAND

;SetAVX:
 lea rdi,[WindowProc.modeAVX]
 mov [lpMode],rdi
 jmp CreateMainWindow

noAVX:
 sub rsp,20h
 xor rcx,rcx
 lea rdx,[_errAVX]
 lea r8,[_title]
 mov r9,10h
 call [MessageBoxA]
 add rsp,20h
 jmp SetSSE

noRDRAND:
 sub rsp,20h
 xor rcx,rcx
 lea rdx,[_errRDRAND]
 lea r8,[_title]
 mov r9,10h
 call [MessageBoxA]
 add rsp,20h
 invoke  CryptAcquireContext, hProv, 0,0,1,0 ;PROV_RSA_FULL = 1
 ;jmp SetSSE

SetSSE:
 lea rdi,[WindowProc.modeSSE]
 mov [lpMode],rdi
 jmp CreateMainWindow

SetX87:
 lea rdi,[WindowProc.modeX87]
 mov [lpMode],rdi
 jmp CreateMainWindow