parseMtlData proc

;Initialize Global Counters
xor eax,eax
mov gnCurrent_newmtl,eax ;Materials

;Set the Local Pointer
mov esi,gpMtlDataStart ;pCurrentPosition = gpMtlDataStart

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
cmp esi,gpMtlDataEnd
jb lbl_FindToken
jmp lbl_Success

lbl_ReadToken:
lea eax,[esi+7] ;Room check
cmp eax,gpMtlDataEnd
ja lbl_Error

;Token detection
mov eax,dword ptr[esi] ;pCurrentPosition

cmp eax,6D77656Eh ;"newm" in little-endian
je lbl_Branch_newm

jmp lbl_NextLine



lbl_Branch_newm:
mov ax,word ptr[esi+4] ;pCurrentPosition
cmp ax,6C74h ;"tl" little-endian
je lbl_Token_newmtl
jmp lbl_NextLine



lbl_Token_newmtl:
;Count material: "newmtl"
call parse_newmtl
cmp esi,gpMtlDataEnd
jae lbl_Success
jmp lbl_ReadToken



lbl_NextLine:
cmp esi,gpMtlDataEnd
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
invoke WriteLog,offset szLogParsedMtlEntities
 
invoke WriteLog,offset szLogParsed_newmtl
invoke WriteDecimalToLog,gnCurrent_newmtl
invoke WriteLog,offset szCRLF

;lbl_End:
ret
parseMtlData endp


