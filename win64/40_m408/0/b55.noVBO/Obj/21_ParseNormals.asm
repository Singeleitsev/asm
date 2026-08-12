;--------------------------------------------------------
; parseNormals – Parse all vn x y z lines from OBJ
;--------------------------------------------------------
parseNormals proc
LOCAL hHeap:QWORD,pCurrentSource:QWORD
LOCAL normalIndex:DWORD
PROLOG 100h

call GetProcessHeap
test rax,rax
jz lbl_WinError
mov hHeap,rax

cmp gnTotalNormals,0
jle lbl_NoNormals

;Allocate normals (3 floats * 4 bytes)
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8
xor r8,r8
mov r8d,gnTotalNormals
imul r8,r8,12
call HeapAlloc
test rax,rax
jz lbl_WinError
mov gpDataNormals,rax
LOG_TEXT szOK

;Parse normals
mov rcx,gpObjDataStart
mov pCurrentSource,rcx
xor r11,r11
mov normalIndex,r11d

lbl_NextLine:
mov rcx,pCurrentSource
cmp rcx,gpObjDataEnd
jge lbl_Done

;Check for 'vn' token
cmp word ptr[rcx],6E76h ;'vn' (reverse)
jne lbl_SkipLine
cmp byte ptr[rcx+2],20h ;space after 'vn'
je lbl_FoundNormal
cmp byte ptr[rcx+2],9 ;tab after 'vn'
je lbl_FoundNormal
jmp lbl_SkipLine

lbl_FoundNormal:
add pCurrentSource,3 ;skip "vn "
mov rcx,pCurrentSource
call skipSpace
mov rcx,rax

call parseFloat3 ;returns x,y,z

;Store normal
mov rdx,gpDataNormals
mov r8d,normalIndex
imul r8,r8,12
add rdx,r8

movss dword ptr[rdx],xmm0
movss dword ptr[rdx+4],xmm1
movss dword ptr[rdx+8],xmm2

inc normalIndex
mov pCurrentSource,rax

lbl_SkipLine:
mov rcx,pCurrentSource
cmp rcx,gpObjDataEnd
jge lbl_Done

lbl_SkipToEOL:
mov al,byte ptr[rcx]
cmp al,0Ah
je lbl_SkipLF
cmp al,0Dh
je lbl_SkipCR
test al,al
jz lbl_Done
inc rcx
jmp lbl_SkipToEOL

lbl_SkipCR:
inc rcx
cmp byte ptr[rcx],0Ah
je lbl_SkipLF
jmp lbl_NextLine

lbl_SkipLF:
inc rcx
mov pCurrentSource,rcx
jmp lbl_NextLine

lbl_Done:
LOG_TEXT szLogNormalsParsed
mov rcx,normalIndex
call WriteDecimalToLog
LOG_TEXT szCRLF

mov rax,1
jmp lbl_End

lbl_NoNormals:
LOG_TEXT szErrNoNormals
xor rax,rax

lbl_WinError:
call SpellWinError
xor rax,rax

lbl_End:
EPILOG
parseNormals endp