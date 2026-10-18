;jmp SetAVX ;Debug
;jmp SetSSE ;Debug
;jmp SetX87 ;Debug

CheckFMA:
 mov eax,1
 cpuid
 and ecx,18001000h
 cmp ecx,18001000h
 jne noFMA

SetFMA:
 lea rdi,[WindowProc.PyramidModeFMA]
 mov [lpCalcMode],rdi
 jmp CheckRdRand ;Quit

noFMA:
 sub rsp,20h
 xor rcx,rcx
 lea rdx,[_errFMA]
 lea r8,[_title]
 mov r9,10h
 call [MessageBoxA]
 add rsp,20h

CheckAVX:
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

SetAVX:
 lea rdi,[WindowProc.PyramidModeAVX]
 mov [lpCalcMode],rdi
 jmp CheckRdRand ;Quit

noAVX:
 sub rsp,20h
 xor rcx,rcx
 lea rdx,[_errAVX]
 lea r8,[_title]
 mov r9,10h
 call [MessageBoxA]
 add rsp,20h
 ;jmp SetSSE
 ;jmp SetX87

SetSSE:
 lea rdi,[WindowProc.PyramidModeSSE]
 mov [lpCalcMode],rdi
 jmp CheckRdRand ;Quit

SetX87:
 lea rdi,[WindowProc.PyramidModeX87]
 mov [lpCalcMode],rdi
 jmp CheckRdRand ;Quit