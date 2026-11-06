countMtlEntities proc
PROLOG 100h

;Initialize Global Counters
xor eax,eax
mov gnCount_newmtl,eax ;Material Libraries

;Set the Local Pointer
mov rsi,gpMtlDataStart ;pCurrentPosition = gpMtlDataStart
mov rdi,gpMtlDataEnd

lbl_FindToken: ;Read xmmword
cmp rsi,gpMtlDataEnd
jge lbl_Success

;Pattern: ASCII code
;Arranged by Probability: 'n', '#'
mov rax,236Eh ;little-endian: #n
movq xmm0,rax
;Compare bytes at [rsi] against pattern in XMM0
;Mode 0: equal_any, positive polarity, implicit length
vpcmpistri xmm0,xmmword ptr[rsi],0
jc lbl_ReadToken

add rsi,10h ;Compute the next address to check
jmp lbl_FindToken ;Next xmmword

lbl_ReadToken:
;rcx contains the index of the first found character
add rsi,rcx ;Compute the absolute address
lea rax,[rsi+3] ;Room check
cmp rax,rdi ;gpMtlDataEnd
ja lbl_Error



;Token detection
mov eax,dword ptr[rsi] ;pCurrentPosition

cmp eax,6D77656Eh ;"newm" in little-endian
je lbl_Branch_newm

jmp lbl_NextLine



lbl_Branch_newm:
mov ax,word ptr[rsi+4] ;pCurrentPosition
cmp ax,6C74h ;"tl" little-endian
je lbl_Token_newmtl
jmp lbl_NextLine



lbl_Token_newmtl:
;Count material: "newmtl"
inc gnCount_newmtl
add rsi,7 ;"newmtl" + delimiter
;jmp lbl_NextLine



lbl_NextLine:
cmp rsi,rdi ;gpMtlDataEnd
jae lbl_Success

mov ax,word ptr[rsi] ;pCurrentPosition

cmp ax,0A0Dh ;0Dh,0Ah in little-endian
je lbl_FindToken
cmp al,0Ah ;Check for LF alone
je lbl_FindToken
cmp al,0Dh ;Check for CR alone
je lbl_FindToken

inc rsi ;pCurrentPosition
jmp lbl_NextLine



;Success
lbl_Success:
mov rax,1
jmp lbl_WriteLog

;Error
lbl_Error:
LOG_TEXT szErrUnexpectedEOF
;jmp lbl_WriteLog



lbl_WriteLog:
LOG_TEXT szLogFoundMtlTokens

LOG_TEXT szLogCount_newmtl
mov ecx,gnCount_newmtl
call WriteDecimalToLog
LOG_TEXT szCRLF

;lbl_End:
EPILOG
countMtlEntities endp


