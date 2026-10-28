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
cmp al,4Bh ;'K' - Left ASCII Range Border
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

;Token detection. Arranged by Probability
mov eax,dword ptr[esi] ;pCurrentPosition

cmp eax,6D77656Eh ;"newm" in little-endian
je lbl_Branch_newm
cmp ax,644Bh ;"Kd" in little-endian
je lbl_Token_Kd
cmp ax,734Bh ;"Ks"
je lbl_Token_Ks
cmp ax,614Bh ;"Ka"
je lbl_Token_Ka
cmp ax,654Bh ;"Ke"
je lbl_Token_Ke
cmp ax,734Eh ;"Ns"
je lbl_Token_Ns
cmp ax,694Eh ;"Ni"
je lbl_Token_Ni
cmp ax,2064h ;"d "
je lbl_Token_d
cmp ax,7254h ;"Tr"
je lbl_Token_Tr
cmp ax,7250h ;"Pr"
je lbl_Token_Pr
cmp ax,6D50h ;"Pm"
je lbl_Token_Pm
cmp eax,756C6C69h ;"illu" -> illum
je lbl_Branch_illum
cmp ax,6654h ;"Tf"
je lbl_Token_Tf
cmp ax,6350h ;"Pc" -> Pc or Pcr
je lbl_Branch_Pc



jmp lbl_NextLine



lbl_Branch_newm:
mov ax,word ptr[esi+4] ;pCurrentPosition
cmp ax,6C74h ;"tl" little-endian
je lbl_Token_newmtl
jmp lbl_NextLine

lbl_Branch_illum:
cmp byte ptr[esi+4],6Dh ;'m'
je lbl_Token_illum
jmp lbl_NextLine

lbl_Branch_Pc:
cmp byte ptr[esi+2],72h ;'r'
je lbl_Token_Pcr
jmp lbl_Token_Pc



lbl_Token_newmtl:
;Count material: "newmtl"
call parse_newmtl
jmp lbl_NextLine

lbl_Token_Kd:
add esi,3 ;skip "Kd "
call parseFloat
movss [edi + OFFSET_KD + 0],xmm0
call parseFloat
movss [edi + OFFSET_KD + 4],xmm0
call parseFloat
movss [edi + OFFSET_KD + 8],xmm0
jmp lbl_NextLine

lbl_Token_Ks:
add esi,3 ;skip "Ks "
call parseFloat
movss [edi + OFFSET_KS + 0],xmm0
call parseFloat
movss [edi + OFFSET_KS + 4],xmm0
call parseFloat
movss [edi + OFFSET_KS + 8],xmm0
jmp lbl_NextLine

lbl_Token_Ka:
add esi,3 ;skip "Ka "
call parseFloat
movss [edi + OFFSET_KA + 0],xmm0
call parseFloat
movss [edi + OFFSET_KA + 4],xmm0
call parseFloat
movss [edi + OFFSET_KA + 8],xmm0
jmp lbl_NextLine

lbl_Token_Ke:
add esi,3 ;skip "Ke "
call parseFloat
movss [edi + OFFSET_KE + 0],xmm0
call parseFloat
movss [edi + OFFSET_KE + 4],xmm0
call parseFloat
movss [edi + OFFSET_KE + 8],xmm0
jmp lbl_NextLine

lbl_Token_Ns:
add esi,3 ;skip "Ns "
call parseFloat
movss [edi + OFFSET_NS],xmm0
jmp lbl_NextLine

lbl_Token_Ni:
add esi,3 ;skip "Ni "
call parseFloat
movss [edi + OFFSET_NI],xmm0
jmp lbl_NextLine

lbl_Token_d:
add esi,2 ;skip "d "
call parseFloat
movss [edi + OFFSET_D],xmm0
jmp lbl_NextLine

lbl_Token_Tr:
add esi,3 ;skip "Tr "
call parseFloat
movss [edi + OFFSET_TR],xmm0
jmp lbl_NextLine

lbl_Token_Pr:
add esi,3 ;skip "Pr "
call parseFloat
movss [edi + OFFSET_PR],xmm0
jmp lbl_NextLine

lbl_Token_Pm:
add esi,3 ;skip "Pm "
call parseFloat
movss [edi + OFFSET_PM],xmm0
jmp lbl_NextLine

lbl_Token_illum:
add esi,6 ;skip "illum "
call ParseSignedInt
mov [edi + OFFSET_ILLUM],eax
jmp lbl_NextLine

lbl_Token_Tf:
add esi,3 ;skip "Tf "
call parseFloat
movss [edi + OFFSET_TF + 0],xmm0
call parseFloat
movss [edi + OFFSET_TF + 4],xmm0
call parseFloat
movss [edi + OFFSET_TF + 8],xmm0
jmp lbl_NextLine

lbl_Token_Pc:
add esi,3 ;skip "Pc "
call parseFloat
movss [edi + OFFSET_PC],xmm0
jmp lbl_NextLine

lbl_Token_Pcr:
add esi,4 ;skip "Pcr "
call parseFloat
movss [edi + OFFSET_PCR],xmm0
jmp lbl_NextLine



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


