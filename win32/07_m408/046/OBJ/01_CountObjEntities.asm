countObjEntities proc

;Initialize Global Counters
xor eax,eax
mov gnCount_mtllib,eax ;Material Libraries
mov gnCount_o,eax ;Objects
mov gnCount_g,eax ;Groups
mov gnCount_usemtl,eax ;Used Materials
mov gnCount_s,eax ;Smoothing Groups
mov gnCount_v,eax ;Vertices
mov gnCount_vn,eax ;Normals
mov gnCount_vt,eax ;Texture Vectors
mov gnCount_f,eax ;Faces

;Set the Local Pointer
mov esi,gpObjDataStart ;pCurrentPosition = gpObjDataStart
mov edi,gpObjDataEnd

lbl_FindToken:
mov al,byte ptr[esi] ;pCurrentPosition
test al,al
jz lbl_Success
cmp al,66h ;'f'
jl lbl_NextByte
cmp al,76h ;'v'
jg lbl_NextByte
jmp lbl_ReadToken

lbl_NextByte:
inc esi ;pCurrentPosition
cmp esi,edi ;gpObjDataEnd
jb lbl_FindToken
jmp lbl_Success

lbl_ReadToken:
lea eax,[esi+3] ;Room check
cmp eax,edi ;gpObjDataEnd
ja lbl_Error

;Token detection. Arranged by Probability
mov ax,word ptr[esi] ;pCurrentPosition

cmp ax,2076h ;Space after "v"
je lbl_Token_v
cmp ax,6E76h ;"vn" little-endian
je lbl_Branch_vn
cmp ax,7476h ;"vt" little-endian
je lbl_Branch_vt

cmp ax,2066h ;Space after "f"
je lbl_Token_f
cmp ax,2067h ;Space after "g"
je lbl_Token_g
cmp ax,206Fh ;Space after "o"
je lbl_Token_o

cmp ax,7375h ;"us" little-endian
je lbl_Branch_us ;part of "usemtl"

cmp ax,2073h ;Space after "s"
je lbl_Token_s

cmp ax,746Dh; "mt" little-endian
je lbl_Branch_mt ;part of "mtllib"

;"Tab" Cases
cmp ax,0976h ;Tab after "v"
je lbl_Token_v
cmp ax,0966h ;Tab after "f"
je lbl_Token_f
cmp ax,0967h ;Tab after "g"
je lbl_Token_g
cmp ax,096Fh ;Tab after "o"
je lbl_Token_o
cmp ax,0973h ;Tab after "s"
je lbl_Token_s

jmp lbl_NextLine



lbl_Branch_vn:
lea eax,[esi+4] ;Room check
cmp eax,edi ;gpObjDataEnd
ja  lbl_Error
cmp byte ptr[esi+2],20h ;Space after "vn" - Most probable
je lbl_Token_vn
cmp byte ptr[esi+2],9 ;Tab after "vn" - Least probable
je lbl_Token_vn
jmp lbl_NextLine ;Junk

lbl_Branch_vt:
lea eax,[esi+4] ;Room check
cmp eax,edi ;gpObjDataEnd
ja  lbl_Error
cmp byte ptr[esi+2],20h ;Space after "vt" - Most probable
je lbl_Token_vt
cmp byte ptr[esi+2],9 ;Tab after "vt" - Least probable
je lbl_Token_vt
jmp lbl_NextLine ;Junk

lbl_Branch_us:
lea eax,[esi+8] ;Room check
cmp eax,edi ;gpObjDataEnd
ja  lbl_Error
cmp dword ptr[esi+2],6C746D65h ;"emtl" in little-endian
jne lbl_NextLine
cmp byte ptr[esi+6],20h ;Space after "usemtl" - Most probable
je lbl_Token_usemtl
cmp byte ptr[esi+6],9 ;Tab after "usemtl" - Least probable
je lbl_Token_usemtl
jmp lbl_NextLine ;Junk

lbl_Branch_mt:
lea eax,[esi+8] ;Room check
cmp eax,edi ;gpObjDataEnd
ja  lbl_Error
cmp dword ptr[esi+2],62696C6Ch ;"llib" in little-endian
jne lbl_NextLine
cmp byte ptr[esi+6],20h ;Space after "mtllib" - Most probable
je lbl_Token_mtllib
cmp byte ptr[esi+6],9 ;Tab after "mtllib" - Least probable
je lbl_Token_mtllib
jmp lbl_NextLine ;Junk



lbl_Token_v:
;Count vertex: v x y z
inc gnCount_v
add esi,2 ;"v" + delimiter
jmp lbl_NextLine

lbl_Token_vn:
;Count normal: vn x y z
inc gnCount_vn
add esi,3 ;"vn" + delimiter
jmp lbl_NextLine

lbl_Token_vt:
;Count texture vector: vt u v w
inc gnCount_vt
add esi,3 ;"vt" + delimiter
jmp lbl_NextLine

lbl_Token_f:
;Count face: f v/vt/vn v/vt/vn v/vt/vn
inc gnCount_f
add esi,2 ;"f" + delimiter
jmp lbl_NextLine

lbl_Token_g:
;Count object name: g name
inc gnCount_g
add esi,2 ;"g" + delimiter
jmp lbl_NextLine

lbl_Token_o:
;Count object name: o name
inc gnCount_o
add esi,2 ;"o" + delimiter
jmp lbl_NextLine

lbl_Token_usemtl:
;Count SubGroup: "usemtl"
inc gnCount_usemtl
add esi,7 ;"usemtl" + delimiter
jmp lbl_NextLine

lbl_Token_s:
;Count SmoothingGroups: s smoothing_group_name
inc gnCount_s
add esi,2 ;"s" + delimiter
jmp lbl_NextLine

lbl_Token_mtllib:
;Count material: "mtllib"
inc gnCount_mtllib
add esi,7 ;"mtllib" + delimiter
jmp lbl_NextLine



lbl_NextLine:
cmp esi,edi ;gpObjDataEnd
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
invoke WriteLog,offset szLogFoundObjTokens

invoke WriteLog,offset szLogCount_mtllib
invoke WriteDecimalToLog,gnCount_mtllib
invoke WriteLog,offset szCRLF

invoke WriteLog,offset szLogCount_o
invoke WriteDecimalToLog,gnCount_o
invoke WriteLog,offset szCRLF

invoke WriteLog,offset szLogCount_g
invoke WriteDecimalToLog,gnCount_g
invoke WriteLog,offset szCRLF

invoke WriteLog,offset szLogCount_usemtl
invoke WriteDecimalToLog,gnCount_usemtl
invoke WriteLog,offset szCRLF

invoke WriteLog,offset szLogCount_s
invoke WriteDecimalToLog,gnCount_s
invoke WriteLog,offset szCRLF

invoke WriteLog,offset szLogCount_v
invoke WriteDecimalToLog,gnCount_v
invoke WriteLog,offset szCRLF

invoke WriteLog,offset szLogCount_vn
invoke WriteDecimalToLog,gnCount_vn
invoke WriteLog,offset szCRLF

invoke WriteLog,offset szLogCount_vt
invoke WriteDecimalToLog,gnCount_vt
invoke WriteLog,offset szCRLF

invoke WriteLog,offset szLogCount_f
invoke WriteDecimalToLog,gnCount_f
invoke WriteLog,offset szCRLF

;lbl_End:
ret
countObjEntities endp


