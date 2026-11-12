countMtlEntities proc
PROLOG 100h

;Initialize Global Counters
xor eax,eax
mov gnCount_newmtl,eax ;Material Libraries

;Set the Local Pointer
mov rsi,gpMtlDataStart ;pCurrentPosition = gpMtlDataStart
mov rdi,gpMtlDataEnd

lbl_FindToken:
mov al,byte ptr[rsi] ;pCurrentPosition
test al,al
jz lbl_Success
cmp al,6Eh ;'n' - Left ASCII Range Border
jl lbl_NextByte
cmp al,6Eh ;'n' - Right ASCII Range Border
jg lbl_NextByte
jmp lbl_ReadToken

lbl_NextByte:
inc rsi ;pCurrentPosition
cmp rsi,rdi ;gpMtlDataEnd
jb lbl_FindToken
jmp lbl_Success

lbl_ReadToken:
lea rax,[rsi+7] ;Room check
cmp rax,rdi ;gpMtlDataEnd
ja lbl_Error

;Token detection. Arranged by Probability
mov eax,dword ptr[rsi] ;pCurrentPosition
cmp eax,6D77656Eh ;"newm" in little-endian
jne lbl_NextLine

mov ax,word ptr[rsi+4] ;pCurrentPosition
cmp ax,6C74h ;"tl" little-endian
je lbl_Token_newmtl

jmp lbl_NextLine



lbl_Token_newmtl:
;Count material: "newmtl"
inc gnCount_newmtl
add rsi,7 ;"newmtl" + delimiter
jmp lbl_NextLine



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


