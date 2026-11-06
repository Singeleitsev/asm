parseObjData proc
PROLOG 100h

;Initialize Global Counters
xor rax,rax
mov gnCurrent_mtllib,eax ;Material Libraries
mov gnCurrent_o,eax ;Objects
mov gnCurrent_g,eax ;Groups
mov gnCurrent_usemtl,eax ;Used Materials
mov gnCurrent_s,eax ;Smoothing Groups
mov gnCurrent_v,eax ;Vertices
mov gnCurrent_vn,eax ;Normals
mov gnCurrent_vt,eax ;Texture Vectors
mov gnCurrent_f,eax ;Faces

;Set the Local Pointer
mov rsi,gpObjDataStart ;pCurrentPosition = gpObjDataStart

lbl_FindToken:
mov al,byte ptr[rsi] ;pCurrentPosition
test al,al
jz lbl_SetLastIndices
cmp al,66h ;'f'
jl lbl_NextByte
cmp al,76h ;'v'
jg lbl_NextByte
jmp lbl_ReadToken

lbl_NextByte:
inc rsi ;pCurrentPosition
cmp rsi,gpObjDataEnd
jb lbl_FindToken
jmp lbl_SetLastIndices

lbl_ReadToken:
lea rax,[rsi+3] ;Room check
cmp rax,gpObjDataEnd
ja lbl_Error

;Token detection. Arranged by Probability
mov ax,word ptr[rsi] ;pCurrentPosition

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
lea rax,[rsi+4] ;Room check
cmp rax,gpObjDataEnd
ja  lbl_Error
cmp byte ptr[rsi+2],20h ;Space after "vn" - Most probable
je lbl_Token_vn
cmp byte ptr[rsi+2],9 ;Tab after "vn" - Least probable
je lbl_Token_vn
jmp lbl_NextLine ;Junk

lbl_Branch_vt:
lea rax,[rsi+4] ;Room check
cmp rax,gpObjDataEnd
ja  lbl_Error
cmp byte ptr[rsi+2],20h ;Space after "vt" - Most probable
je lbl_Token_vt
cmp byte ptr[rsi+2],9 ;Tab after "vt" - Least probable
je lbl_Token_vt
jmp lbl_NextLine ;Junk

lbl_Branch_us:
lea rax,[rsi+8] ;Room check
cmp rax,gpObjDataEnd
ja  lbl_Error
cmp dword ptr[rsi+2],6C746D65h ;"emtl" in little-endian
jne lbl_NextLine
cmp byte ptr[rsi+6],20h ;Space after "usemtl" - Most probable
je lbl_Token_usemtl
cmp byte ptr[rsi+6],9 ;Tab after "usemtl" - Least probable
je lbl_Token_usemtl
jmp lbl_NextLine ;Junk

lbl_Branch_mt:
lea rax,[rsi+8] ;Room check
cmp rax,gpObjDataEnd
ja  lbl_Error
cmp dword ptr[rsi+2],62696C6Ch ;"llib" in little-endian
jne lbl_NextLine
cmp byte ptr[rsi+6],20h ;Space after "mtllib" - Most probable
je lbl_Token_mtllib
cmp byte ptr[rsi+6],9 ;Tab after "mtllib" - Least probable
je lbl_Token_mtllib
jmp lbl_NextLine ;Junk



lbl_Token_v:
;Count vertex: v x y z
call parse_v
jmp lbl_NextLine

lbl_Token_vn:
;Count normal: vn x y z
call parse_vn
jmp lbl_NextLine

lbl_Token_vt:
;Count texture vector: vt u v w
call parse_vt
jmp lbl_NextLine

lbl_Token_f:
;Count face: f v/vt/vn v/vt/vn v/vt/vn
call parse_f
jmp lbl_NextLine

lbl_Token_g:
;Count object name: g name
call parse_g
jmp lbl_NextLine

lbl_Token_o:
;Count object name: o name
call parse_o
jmp lbl_NextLine

lbl_Token_usemtl:
;Count SubGroup: "usemtl"
call parse_usemtl
jmp lbl_NextLine

lbl_Token_s:
;Count SmoothingGroups: s smoothing_group_name
call parse_s
jmp lbl_NextLine

lbl_Token_mtllib:
;Count material: "mtllib"
call parse_mtllib
jmp lbl_NextLine



lbl_NextLine:
cmp rsi,gpObjDataEnd
jae lbl_SetLastIndices

mov ax,word ptr[rsi] ;pCurrentPosition

cmp ax,0A0Dh ;0Dh,0Ah in little-endian
je lbl_FindToken
cmp al,0Ah ;Check for LF alone
je lbl_FindToken
cmp al,0Dh ;Check for CR alone
je lbl_FindToken

inc rsi ;pCurrentPosition
jmp lbl_NextLine



lbl_SetLastIndices:

;close the last object's LAST_GROUP
xor rax,rax
mov eax,gnCurrent_o
test eax,eax
jz @f
dec eax
imul eax,eax,SIZE_OBJECT_METADATA
mov rdx,gpBuffer_o
add rdx,rax
mov eax,gnCurrent_g
dec eax
mov [rdx + OFFSET_OBJECT_LAST_GROUP_INDEX],eax

@@:
;close the last group's LAST_USEMTL
mov eax,gnCurrent_g
test eax,eax
jz @f
dec eax
imul eax,eax,SIZE_GROUP_METADATA
mov rdx,gpBuffer_g
add rdx,rax
mov eax,gnCurrent_usemtl
dec eax
mov [rdx + OFFSET_GROUP_LAST_USEMTL_INDEX],eax

@@:
;close the last usemtl's LAST_SMOOTHING
mov eax,gnCurrent_usemtl
test eax,eax
jz @f
dec eax
imul eax,eax,SIZE_USEMTL_METADATA
mov rdx,gpBuffer_usemtl
add rdx,rax
mov eax,gnCurrent_s
dec eax
mov [rdx + OFFSET_USEMTL_LAST_SMOOTHING_INDEX],eax

@@:
;close the last smoothing's LAST_FACE
mov eax,gnCurrent_s
test eax,eax
jz @f
dec eax
imul eax,eax,SIZE_SMOOTHING_METADATA
mov rdx,gpBuffer_s
add rdx,rax
mov eax,gnCurrent_f
dec eax
mov [rdx + OFFSET_SMOOTHING_LAST_FACE_INDEX],eax

@@:
jmp lbl_WriteLog

;Error
lbl_Error:
LOG_TEXT szErrUnexpectedEOF
;jmp lbl_WriteLog



lbl_WriteLog:
LOG_TEXT szLogParsedObjEntities
 
LOG_TEXT szLogParsed_mtllib
mov ecx,gnCurrent_mtllib
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogParsed_o
mov ecx,gnCurrent_o
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogParsed_g
mov ecx,gnCurrent_g
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogParsed_usemtl
mov ecx,gnCurrent_usemtl
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogParsed_s
mov ecx,gnCurrent_s
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogParsed_v
mov ecx,gnCurrent_v
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogParsed_vn
mov ecx,gnCurrent_vn
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogParsed_vt
mov ecx,gnCurrent_vt
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogParsed_f
mov ecx,gnCurrent_f
call WriteDecimalToLog
LOG_TEXT szCRLF

;lbl_End:
EPILOG
parseObjData endp


