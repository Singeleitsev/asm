parseObjData proc

PROLOG 100h

;Initialize the Destination Pointers
mov rax,gpDataObjects
mov gpCurrentObject,rax
mov rax,gpDataGroups
mov gpCurrentGroup,rax
mov rax,gpDataSubGroups
mov gpCurrentSubGroup,rax
mov rax,gpDataVertices
mov gpCurrentVertex,rax
mov rax,gpDataNormals
mov gpCurrentNormal,rax
mov rax,gpDataTextureVectors
mov gpCurrentTextureVector,rax
mov rax,gpDataFaces
mov gpCurrentFace,rax
mov rax,gpDataMtlLibs
mov gpCurrentMtlLib,rax

;Set the Source Pointer
mov rcx,gpObjDataStart
cmp rcx,gpObjDataEnd
jge lbl_EndOfFile
;mov pCurrentPosition,rcx

lbl_ReadNextLine:
mov rsi,rcx
;Do not use rcx to store pCurrentPosition
;because it is used by vpcmpistri as index

lbl_NextXmmword_0:
cmp rsi,gpObjDataEnd
jge lbl_EndOfFile

;Pattern: ASCII code: 'm', '#', 's', 'u', 'o', 'g', 'f', 'v'
mov rax,6D2373756F676676h ;m#suogfv
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
cmp rcx,gpObjDataEnd
jge lbl_EndOfFile



;Token detection. Arranged by Probability
cmp byte ptr[rcx],76h ;"v"
je lbl_Branch_v
cmp byte ptr[rcx],66h ;"f"
je lbl_Branch_f
cmp byte ptr[rcx],67h ;"g"
je lbl_Branch_g
cmp byte ptr[rcx],6Fh ;"o"
je lbl_Branch_o
cmp byte ptr[rcx],75h ;"u"
je lbl_Branch_u
cmp byte ptr[rcx],73h ;"s"
je lbl_Branch_s
cmp byte ptr[rcx],23h ;"#"
je lbl_BranchComment
cmp byte ptr[rcx],6Dh; "m"
je lbl_Branch_m
jmp lbl_FindNextLine



;Branch "v"
lbl_Branch_v:
inc rcx ;Check what's next to "v"
cmp byte ptr[rcx],20h ;Space after "v" - Most probable
je lbl_TokenVertex
cmp byte ptr[rcx],6Eh ;"n" after "v"
je lbl_Branch_vn
cmp byte ptr[rcx],74h ;"t" after "v"
je lbl_Branch_vt
cmp byte ptr[rcx],9 ;Tab after "v" - Least probable
je lbl_TokenVertex
jmp lbl_FindNextLine

;Count vertex: v x y z
lbl_TokenVertex:
inc rcx ;Skip Space or Tab
call parseFloat3 ;returns xmm0=x, xmm1=y, xmm2=z, rax=updated pointer
;Store in vertex array
mov rdx,gpCurrentVertex
movss dword ptr[rdx],xmm0 ;Store X
movss dword ptr[rdx+4],xmm1 ;Store Y
movss dword ptr[rdx+8],xmm2 ;Store Z
;Next
mov rcx,rax ;Returned by parseFloat3
add gpCurrentVertex,12
jmp lbl_FindNextLine

;Branch "vn"
lbl_Branch_vn:
inc rcx ;Check what's next to "vn" - Most probable
cmp byte ptr[rcx],20h ;Space after "vn"
je lbl_TokenNormal
cmp byte ptr[rcx],9 ;Tab after "vn" - Least probable
je lbl_TokenNormal
jmp lbl_FindNextLine ;Junk

;Count normal: vn x y z
lbl_TokenNormal:
inc rcx ;Skip Space or Tab
call parseFloat3 ;returns xmm0=x, xmm1=y, xmm2=z, rax=updated pointer
;Store in vertex array
mov rdx,gpCurrentNormal
movss dword ptr[rdx],xmm0 ;Store X
movss dword ptr[rdx+4],xmm1 ;Store Y
movss dword ptr[rdx+8],xmm2 ;Store Z
;Next
mov rcx,rax ;pCurrentPosition returned by parseFloat3
add gpCurrentNormal,12
jmp lbl_FindNextLine

;Branch "vt"
lbl_Branch_vt:
inc rcx ;Check what's next to "vt"
cmp byte ptr[rcx],20h ;Space after "vt" - Most probable
je lbl_TokenTextureVector
cmp byte ptr[rcx],9 ;Tab after "vt" - Least probable
je lbl_TokenTextureVector
jmp lbl_FindNextLine ;Junk

;Count texture vector: vt u v w
lbl_TokenTextureVector:
inc rcx ;Skip Space or Tab
call parseFloat3 ;returns xmm0=x, xmm1=y, xmm2=z, rax=updated pointer
;Store in vertex array
mov rdx,gpCurrentTextureVector
movss dword ptr[rdx],xmm0 ;Store X
movss dword ptr[rdx+4],xmm1 ;Store Y
movss dword ptr[rdx+8],xmm2 ;Store Z
;Next
mov rcx,rax ;pCurrentPosition returned by parseFloat3
add gpCurrentTextureVector,12
jmp lbl_FindNextLine

;Branch "f"
lbl_Branch_f:
inc rcx ;Check what's next to "f"
cmp byte ptr[rcx],20h ;Space after "f" - Most probable
je lbl_TokenFace
cmp byte ptr[rcx],9 ;Tab after "f" - Least probable
je lbl_TokenFace
jmp lbl_FindNextLine ;Junk

;Count face: f v/vt/vn v/vt/vn v/vt/vn
lbl_TokenFace:
inc rcx ;Skip Space or Tab
call parseFace
mov rcx,rax ;pCurrentPosition returned by parseFace
jmp lbl_FindNextLine

;Branch "g"
lbl_Branch_g:
inc rcx ;Check what's next to "g"
cmp byte ptr[rcx],20h ;Space after "g" - Most probable
je lbl_TokenGroup
cmp byte ptr[rcx],9 ;Tab after "g" - Least probable
je lbl_TokenGroup
jmp lbl_FindNextLine ;Junk

;Count object name: g name
lbl_TokenGroup:
inc rcx ;Skip Space or Tab
call parseGroup
mov rcx,rax ;pCurrentPosition returned by parseGroup
jmp lbl_FindNextLine

;Branch "o"
lbl_Branch_o:
inc rcx ;Check what's next to "o"
cmp byte ptr[rcx],20h ;Space after "o" - Most probable
je lbl_TokenObject
cmp byte ptr[rcx],9 ;Tab after "o" - Least probable
je lbl_TokenObject
jmp lbl_FindNextLine ;Junk

;Count object name: o name
lbl_TokenObject:
inc rcx ;Skip Space or Tab
call parseObject
mov rcx,rax ;pCurrentPosition returned by parseObject
jmp lbl_FindNextLine

;Branch "u"
lbl_Branch_u:
cmp dword ptr[rcx], 6D657375h ; "usem" in little-endian
jne lbl_FindNextLine
cmp word ptr[rcx+4], 6C74h ;"tl" in little-endian
jne lbl_FindNextLine ;Junk
add rcx,6 ;Skip Token
cmp byte ptr[rcx],20h ;Space after "usemtl" - Most probable
je lbl_TokenUseMtl
cmp byte ptr[rcx],9 ;Tab after "usemtl" - Least probable
je lbl_TokenUseMtl
jmp lbl_FindNextLine ;Junk

;Count SubGroup: "usemtl"
lbl_TokenUseMtl:
inc rcx ;Skip Space or Tab
call parseSubGroup
mov rcx,rax ;pCurrentPosition returned by parseSubGroup
jmp lbl_FindNextLine

;Branch "s"
lbl_Branch_s:
inc rcx ;Set pCurrentPosition after the token
;Skip the smoothing groups temporarily
jmp lbl_FindNextLine

;Branch "#"
lbl_BranchComment:
;Skip the comments
jmp lbl_FindNextLine

;Branch "m"
lbl_Branch_m:
cmp dword ptr[rcx], 6c6c746Dh ;"mtll" in little-endian
jne lbl_FindNextLine
cmp word ptr[rcx+4], 6269h ;"ib" in little-endian
jne lbl_FindNextLine ;Junk
add rcx,6 ;Skip Token
cmp byte ptr[rcx],20h ;Space after "mtllib" - Most probable
je lbl_TokenMtlLib
cmp byte ptr[rcx],9 ;Tab after "mtllib" - Least probable
je lbl_TokenMtlLib
jmp lbl_FindNextLine ;Junk

;Count material: "mtllib"
lbl_TokenMtlLib:
;inc rcx ;Skip Space or Tab
;call parseMtlLib
;mov rcx,rax ;pCurrentPosition returned by parseMtlLib
jmp lbl_FindNextLine




lbl_FindNextLine:
inc rcx ;Skip previously checked byte
mov rsi,rcx ;pCurrentPosition
;Do not use rcx to store pCurrentPosition
;because it is used by vpcmpistri as index

lbl_NextXmmword_1:
cmp rsi,gpObjDataEnd
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
cmp rcx,gpObjDataEnd
jge lbl_EndOfFile
jmp lbl_ReadNextLine



;Success
lbl_EndOfFile:
mov rax,1
jmp lbl_End

lbl_WinError:
call SpellWinError
xor rax,rax
;jmp lbl_End

lbl_End:
EPILOG
parseObjData endp

