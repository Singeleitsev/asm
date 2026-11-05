countMtlEntities proc

;Initialize Global Counters
xor eax,eax
mov gnCount_newmtl,eax ;Material Libraries

;Set the Local Pointer
mov esi,gpMtlDataStart ;pCurrentPosition = gpMtlDataStart
mov edi,gpMtlDataEnd

lbl_FindToken:
mov al,byte ptr[esi] ;pCurrentPosition
test al,al
jz lbl_Success
cmp al,6Eh ;'n' - Left ASCII Range Border
jl lbl_NextByte
cmp al,6Eh ;'n' - Right ASCII Range Border
jg lbl_NextByte
jmp lbl_ReadToken

lbl_NextByte:
inc esi ;pCurrentPosition
cmp esi,edi ;gpMtlDataEnd
jb lbl_FindToken
jmp lbl_Success

lbl_ReadToken:
lea eax,[esi+7] ;Room check
cmp eax,edi ;gpMtlDataEnd
ja lbl_Error

;Token detection. Arranged by Probability
mov eax,dword ptr[esi] ;pCurrentPosition
cmp eax,6D77656Eh ;"newm" in little-endian
jne lbl_NextLine

mov ax,word ptr[esi+4] ;pCurrentPosition
cmp ax,6C74h ;"tl" little-endian
je lbl_Token_newmtl

jmp lbl_NextLine



lbl_Token_newmtl:
;Count material: "newmtl"
inc gnCount_newmtl
add esi,7 ;"newmtl" + delimiter
jmp lbl_NextLine



lbl_NextLine:
cmp esi,edi ;gpMtlDataEnd
jae lbl_Success

mov ax,word ptr[esi] ;pCurrentPosition

cmp ax,0A0Dh ;0Dh,0Ah in little-endian
je lbl_FindToken
cmp al,0Ah ;Check for LF alone
je lbl_FindToken
cmp al,0Dh ;Check for CR alone
je lbl_FindToken

inc esi ;pCurrentPosition
jmp lbl_NextLine



;Success
lbl_Success:
;No actions for now
jmp lbl_WriteLog

;Error
lbl_Error:
invoke WriteLog,offset szErrUnexpectedEOF
;jmp lbl_WriteLog



lbl_WriteLog:
invoke WriteLog,offset szLogFoundMtlTokens

invoke WriteLog,offset szLogCount_newmtl
invoke WriteDecimalToLog,gnCount_newmtl
invoke WriteLog,offset szCRLF

;lbl_End:
ret
countMtlEntities endp


