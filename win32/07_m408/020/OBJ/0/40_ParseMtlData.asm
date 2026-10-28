parseMtlData proc

PROLOG 100h

;Initialize Global Counters
mov gnTotalMaterials,0

;Set the Local Pointer
mov rcx,gpMtlDataStart
cmp rcx,gpMtlDataEnd
jge lbl_EndOfFile


lbl_ReadNextLine:
mov rsi,rcx ;pCurrentPosition
;Do not use rcx to store pCurrentPosition
;because it is used by vpcmpistri as index

lbl_NextXmmword_0:
cmp rsi,gpMtlDataEnd
jge lbl_EndOfFile

;The Most Frequent Tokens
;Pattern: ASCII code: '#', 'i', 'N', 'd', 'n', 'T', 'P', 'K'
mov rax,23694e646e54504Bh
movq xmm0,rax
;Compare bytes at [rsi] against pattern in XMM0
;Mode 0: equal_any, positive polarity, implicit length
vpcmpistri xmm0,xmmword ptr[rsi],0
jz lbl_EndOfFile
jc lbl_TokenFound

;Less Frequent Tokens
;Pattern: ASCII code: 'm', 'b'
mov rax,6d62h
movq xmm0,rax
;Compare bytes at [rsi] against pattern in XMM0
;Mode 0: equal_any, positive polarity, implicit length
vpcmpistri xmm0,xmmword ptr[rsi],0
jz lbl_EndOfFile
jc lbl_TokenFound
 
add rsi,10h ;Compute the next address to check
jmp lbl_NextXmmword_0
 
lbl_TokenFound:
;ECX contains the index of the first found character
add rcx,rsi ;Compute the absolute address
cmp rcx,gpMtlDataEnd
jge lbl_EndOfFile




;Token detection. Arranged by Probability
cmp byte ptr[rcx],4Bh ;"K"
je lbl_BranchK
cmp byte ptr[rcx],50h ;"P"
je lbl_BranchP
cmp byte ptr[rcx],54h ;"T"
je lbl_BranchT
cmp byte ptr[rcx],6eh ;"n"
je lbl_Branch_n
cmp byte ptr[rcx],64h ;"d"
je lbl_Branch_d
cmp byte ptr[rcx],4eh ;"N"
je lbl_BranchN
cmp byte ptr[rcx],69h ;"i"
je lbl_Branch_i
cmp byte ptr[rcx],23h; "#"
je lbl_BranchComment
cmp byte ptr[rcx],62h; "b"
je lbl_Branch_b
cmp byte ptr[rcx],6Dh; "m"
je lbl_Branch_m
jmp lbl_FindNextLine




;Branch "K"
lbl_BranchK:
add rcx,2 ;Check what's next to "K*"
cmp byte ptr[rcx],20h ;Space after "K*" - Most probable
je lbl_ValidK
cmp byte ptr[rcx],9 ;Tab after "K*" - Least probable
je lbl_ValidK
jmp lbl_FindNextLine

lbl_ValidK:
cmp byte ptr[rcx-1],64h ;"d" after "K"
je lbl_TokenDiffuse
cmp byte ptr[rcx-1],73h ;"s" after "K"
je lbl_TokenSpecular
cmp byte ptr[rcx-1],61h ;"a" after "K"
je lbl_TokenAmbient
cmp byte ptr[rcx-1],65h ;"e" after "K"
je lbl_TokenEmissive
jmp lbl_FindNextLine

;Parse Diffuse: Kd r g b
lbl_TokenDiffuse:
;call parseDiffuse
jmp lbl_FindNextLine

;Parse Specular: Ks r g b
lbl_TokenSpecular:
;call parseSpecular
jmp lbl_FindNextLine

;Parse Ambient: Ka r g b
lbl_TokenAmbient:
;call parseAmbient
jmp lbl_FindNextLine

;Parse Emissive: Ke r g b
lbl_TokenEmissive:
;call parseEmissive
jmp lbl_FindNextLine




;Branch "P"
lbl_BranchP:
jmp lbl_FindNextLine

;Branch "T"
lbl_BranchT:
jmp lbl_FindNextLine

;Branch "n"
lbl_Branch_n:
jmp lbl_FindNextLine




;Branch "d"
lbl_Branch_d:
inc rcx ;Check what's next to "d"
cmp byte ptr[rcx],20h ;Space after "o" - Most probable
je lbl_TokenDissolve
cmp byte ptr[rcx],9 ;Tab after "o" - Least probable
je lbl_TokenDissolve
jmp lbl_FindNextLine ;Skip temporarily

;Parse Dissolve / Opacity: d value
lbl_TokenDissolve:
;call parseDissolve
jmp lbl_FindNextLine






;Branch "N"
lbl_BranchN:
jmp lbl_FindNextLine

;Branch "i"
lbl_Branch_i:
jmp lbl_FindNextLine








;Branch "#"
lbl_BranchComment:
inc rcx ;Check what's next to "s"
;cmp byte ptr[rcx],20h ;Space after "#" - Most probable
;je lbl_TokenS
;cmp byte ptr[rcx],9 ;Tab after "#" - Least probable
;je lbl_TokenS
jmp lbl_FindNextLine ;Skip temporarily





;Branch "b"
lbl_Branch_b:
jmp lbl_FindNextLine

;Branch "m"
lbl_Branch_m:
jmp lbl_FindNextLine





lbl_FindNextLine:
inc rcx ;Skip previously checked byte
mov rsi,rcx ;pCurrentPosition
;Do not use rcx to store pCurrentPosition
;because it is used by vpcmpistri as index

lbl_NextXmmword_1:
cmp rsi,gpMtlDataEnd
jge lbl_EndOfFile

;Pattern: ASCII code: Carriage Return = 0Dh, Line Feed = 0Ah
mov rax,0Ah ;Chech for LF alone
movq xmm0,rax
;Compare bytes at [rsi] against pattern in XMM0
;Mode 0: equal_any, positive polarity, implicit length
vpcmpistri xmm0,xmmword ptr[rsi],0
jz lbl_EndOfFile
jc lbl_EndOfLineFound
 
add rsi,10h ;Compute the next address to check
jmp lbl_NextXmmword_1
 
lbl_EndOfLineFound:
;ECX contains the index of the first found character
add rcx,rsi ;Compute the absolute address
cmp rcx,gpMtlDataEnd
jge lbl_EndOfFile
jmp lbl_ReadNextLine




lbl_EndOfFile:

LOG_TEXT szLogTotalMaterials
xor rcx,rcx
mov ecx,gnTotalMaterials
call WriteDecimalToLog
LOG_TEXT szCRLF



;Success
mov rax,1
jmp lbl_End

lbl_WinError:
call SpellWinError
xor rax,rax
;jmp lbl_End

lbl_End:
EPILOG
parseMtlData endp
