;--------------------------------------
;parse_newmtl - parse the material name
;Input:
;rsi = cursor at the end of the current material block (on the CR/LF before the next newmtl, or EOF)
;rdi = pointer to the current NEWMTL_METADATA
;gnCurrent_newmtl incremented
;gpBuffer_newmtl[gnCurrent_newmtl] filled
;Output:
;rsi = cursor at the next cursor at "newmtl <name>"
;rdi = pointer to the current NEWMTL_METADATA
;Current NEWMTL_METADATA filled
;----------------------------------------
parseMtlProperties proc
PROLOG 100h



lbl_FindToken:
mov al,byte ptr[rsi] ;pCurrentPosition
test al,al
jz lbl_Success
cmp al,4Bh ;'K' - Left ASCII Range Border
jl lbl_NextByte
cmp al,6Eh ;'n' - Right ASCII Range Border
jg lbl_NextByte
jmp lbl_ReadToken

lbl_NextByte:
inc rsi ;pCurrentPosition
cmp rsi,gpMtlDataEnd
jb lbl_FindToken
jmp lbl_Success

lbl_ReadToken:
lea rax,[rsi+3] ;Room check
cmp rax,gpMtlDataEnd
ja lbl_Error

;Token detection
mov eax,dword ptr[rsi] ;pCurrentPosition

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
cmp eax,6D77656Eh ;"newm" in little-endian
je lbl_Branch_newm

jmp lbl_NextLine



lbl_Branch_illum:
cmp byte ptr[rsi+4],6Dh ;'m'
je lbl_Token_illum
jmp lbl_NextLine

lbl_Branch_Pc:
cmp byte ptr[rsi+2],20h ;Space
je lbl_Token_Pc
cmp byte ptr[rsi+2],9 ;'Tab'
je lbl_Token_Pc
cmp word ptr[rsi+2],2072h ;"r " in little-endian
je lbl_Token_Pcr
cmp word ptr[rsi+2],0972h ;"r\t" in little-endian
je lbl_Token_Pcr
jmp lbl_NextLine

lbl_Branch_newm:
mov ax,word ptr[rsi+4] ;pCurrentPosition
cmp ax,6C74h ;"tl" little-endian
je lbl_Token_newmtl
jmp lbl_NextLine



lbl_Token_Kd:
add rsi,3 ;skip "Kd "
call parseFloat
movss dword ptr[rdi + OFFSET_KD + 0],xmm0
call parseFloat
movss dword ptr[rdi + OFFSET_KD + 4],xmm0
call parseFloat
movss dword ptr[rdi + OFFSET_KD + 8],xmm0
jmp lbl_NextLine

lbl_Token_Ks:
add rsi,3 ;skip "Ks "
call parseFloat
movss dword ptr[rdi + OFFSET_KS + 0],xmm0
call parseFloat
movss dword ptr[rdi + OFFSET_KS + 4],xmm0
call parseFloat
movss dword ptr[rdi + OFFSET_KS + 8],xmm0
jmp lbl_NextLine

lbl_Token_Ka:
add rsi,3 ;skip "Ka "
call parseFloat
movss dword ptr[rdi + OFFSET_KA + 0],xmm0
call parseFloat
movss dword ptr[rdi + OFFSET_KA + 4],xmm0
call parseFloat
movss dword ptr[rdi + OFFSET_KA + 8],xmm0
jmp lbl_NextLine

lbl_Token_Ke:
add rsi,3 ;skip "Ke "
call parseFloat
movss dword ptr[rdi + OFFSET_KE + 0],xmm0
call parseFloat
movss dword ptr[rdi + OFFSET_KE + 4],xmm0
call parseFloat
movss dword ptr[rdi + OFFSET_KE + 8],xmm0
jmp lbl_NextLine

lbl_Token_Ns:
add rsi,3 ;skip "Ns "
call parseFloat
movss dword ptr[rdi + OFFSET_NS],xmm0
jmp lbl_NextLine

lbl_Token_Ni:
add rsi,3 ;skip "Ni "
call parseFloat
movss dword ptr[rdi + OFFSET_NI],xmm0
jmp lbl_NextLine

lbl_Token_d:
add rsi,2 ;skip "d "
call parseFloat
movss dword ptr[rdi + OFFSET_D],xmm0
jmp lbl_NextLine

lbl_Token_Tr:
add rsi,3 ;skip "Tr "
call parseFloat
movss dword ptr[rdi + OFFSET_TR],xmm0
jmp lbl_NextLine

lbl_Token_Pr:
add rsi,3 ;skip "Pr "
call parseFloat
movss dword ptr[rdi + OFFSET_PR],xmm0
jmp lbl_NextLine

lbl_Token_Pm:
add rsi,3 ;skip "Pm "
call parseFloat
movss dword ptr[rdi + OFFSET_PM],xmm0
jmp lbl_NextLine

lbl_Token_illum:
add rsi,6 ;skip "illum "
call parseSignedInt
mov [rdi + OFFSET_ILLUM],eax
jmp lbl_NextLine

lbl_Token_Tf:
add rsi,3 ;skip "Tf "
call parseFloat
movss dword ptr[rdi + OFFSET_TF + 0],xmm0
call parseFloat
movss dword ptr[rdi + OFFSET_TF + 4],xmm0
call parseFloat
movss dword ptr[rdi + OFFSET_TF + 8],xmm0
jmp lbl_NextLine

lbl_Token_Pc:
add rsi,3 ;skip "Pc "
call parseFloat
movss dword ptr[rdi + OFFSET_PC],xmm0
jmp lbl_NextLine

lbl_Token_Pcr:
add rsi,4 ;skip "Pcr "
call parseFloat
movss dword ptr[rdi + OFFSET_PCR],xmm0
jmp lbl_NextLine

lbl_Token_newmtl:
;Skip to the next material: "newmtl"
jmp lbl_Success



lbl_NextLine:
cmp rsi,gpMtlDataEnd
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
;No actions for now
jmp lbl_End

;Error
lbl_Error:
LOG_TEXT szErrUnexpectedEOF
;jmp lbl_End

lbl_End:
EPILOG
parseMtlProperties endp


