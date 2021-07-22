;jmp SetRdRand ;Debug
;jmp SetRdTSC ;Debug
;jmp SetRand ;Debug
;jmp SetRtlRandomEx ;Debug
;jmp SetCrypt ;Debug

CheckRdRand:
 mov eax,1
 cpuid
 and ecx,40000000h
 cmp ecx,40000000h
 jne noRdRand

SetRdRand:
 lea rdi,[WindowProc.PyramidRdRand]
 mov [lpRandMode],rdi
 jmp CreateMainWindow ;Quit

noRdRand:
 sub rsp,20h
 xor rcx,rcx
 lea rdx,[_errRDRAND]
 lea r8,[_title]
 mov r9,10h
 call [MessageBoxA]
 add rsp,20h
 ;jmp SetRdTSC
 ;jmp SetCrypt
 ;jmp SetRand

;SetRdTSC:
 ;lea rdi,[WindowProc.PyramidRdTSC]
 ;mov [lpRandMode],rdi
 ;jmp CreateMainWindow ;Quit

;SetRand:
 ;lea rdi,[WindowProc.PyramidRand]
 ;mov [lpRandMode],rdi
 ;jmp CreateMainWindow ;Quit

;SetRtlRandomEx:
 ;lea rdi,[WindowProc.PyramidRtl]
 ;mov [lpRandMode],rdi
 ;jmp CreateMainWindow ;Quit

;SetCrypt:
 ;lea rdi,[WindowProc.PyramidCrypt]
 ;mov [lpRandMode],rdi
 ;jmp CreateMainWindow ;Quit
