countObjEntities proc
PROLOG 100h

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
mov rsi,gpObjDataStart ;pCurrentPosition = gpObjDataStart
mov rdi,gpObjDataEnd


lbl_FindToken: ;Read xmmword
cmp rsi,gpObjDataEnd
jge lbl_Success

;Pattern: ASCII code
;Arranged by Probability: 'm', '#', 's', 'u', 'o', 'g', 'f', 'v'
mov rax,7666676F7573236Dh ;little-endian: vfgous#m
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
cmp rax,rdi ;gpObjDataEnd
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
cmp rax,rdi ;gpObjDataEnd
ja  lbl_Error
cmp byte ptr[rsi+2],20h ;Space after "vn" - Most probable
je lbl_Token_vn
cmp byte ptr[rsi+2],9 ;Tab after "vn" - Least probable
je lbl_Token_vn
jmp lbl_NextLine ;Junk

lbl_Branch_vt:
lea rax,[rsi+4] ;Room check
cmp rax,rdi ;gpObjDataEnd
ja  lbl_Error
cmp byte ptr[rsi+2],20h ;Space after "vt" - Most probable
je lbl_Token_vt
cmp byte ptr[rsi+2],9 ;Tab after "vt" - Least probable
je lbl_Token_vt
jmp lbl_NextLine ;Junk

lbl_Branch_us:
lea rax,[rsi+8] ;Room check
cmp rax,rdi ;gpObjDataEnd
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
cmp rax,rdi ;gpObjDataEnd
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
inc gnCount_v
add rsi,2 ;"v" + delimiter
jmp lbl_NextLine

lbl_Token_vn:
;Count normal: vn x y z
inc gnCount_vn
add rsi,3 ;"vn" + delimiter
jmp lbl_NextLine

lbl_Token_vt:
;Count texture vector: vt u v w
inc gnCount_vt
add rsi,3 ;"vt" + delimiter
jmp lbl_NextLine

lbl_Token_f:
;Count face: f v/vt/vn v/vt/vn v/vt/vn
inc gnCount_f
add rsi,2 ;"f" + delimiter
jmp lbl_NextLine

lbl_Token_g:
;Count object name: g name
inc gnCount_g
add rsi,2 ;"g" + delimiter
jmp lbl_NextLine

lbl_Token_o:
;Count object name: o name
inc gnCount_o
add rsi,2 ;"o" + delimiter
jmp lbl_NextLine

lbl_Token_usemtl:
;Count SubGroup: "usemtl"
inc gnCount_usemtl
add rsi,7 ;"usemtl" + delimiter
jmp lbl_NextLine

lbl_Token_s:
;Count SmoothingGroups: s smoothing_group_name
inc gnCount_s
add rsi,2 ;"s" + delimiter
jmp lbl_NextLine

lbl_Token_mtllib:
;Count material: "mtllib"
inc gnCount_mtllib
add rsi,7 ;"mtllib" + delimiter
jmp lbl_NextLine




lbl_NextLine:
cmp rsi,rdi ;gpObjDataEnd
jae lbl_Success

lbl_FindEndOfLine:
cmp rsi,gpObjDataEnd
jge lbl_Success

;Pattern: ASCII code: Carriage Return = 0Dh, Line Feed = 0Ah
mov rax,0Ah ;Chech for LF alone
movq xmm0,rax
;Compare bytes at [rsi] against pattern in XMM0
;Mode 0: equal_any, positive polarity, implicit length
vpcmpistri xmm0,xmmword ptr[rsi],0
jz lbl_Success
jc lbl_EndOfLineFound
 
add rsi,10h ;Compute the next address to check
jmp lbl_FindEndOfLine
 
lbl_EndOfLineFound:
;rcx contains the index of the first found character
add rsi,rcx ;Compute the absolute address
cmp rsi,gpObjDataEnd
jge lbl_Success
jmp lbl_FindToken




lbl_Success:
mov rax,1
jmp lbl_WriteLog

;Error
lbl_Error:
LOG_TEXT szErrUnexpectedEOF
;jmp lbl_WriteLog



lbl_WriteLog:
LOG_TEXT szLogFoundObjTokens

LOG_TEXT szLogCount_mtllib
mov ecx,gnCount_mtllib
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogCount_o
mov ecx,gnCount_o
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogCount_g
mov ecx,gnCount_g
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogCount_usemtl
mov ecx,gnCount_usemtl
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogCount_s
mov ecx,gnCount_s
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogCount_v
mov ecx,gnCount_v
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogCount_vn
mov ecx,gnCount_vn
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogCount_vt
mov ecx,gnCount_vt
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogCount_f
mov ecx,gnCount_f
call WriteDecimalToLog
LOG_TEXT szCRLF

;lbl_End:
EPILOG
countObjEntities endp


