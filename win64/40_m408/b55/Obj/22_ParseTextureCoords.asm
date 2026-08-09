;--------------------------------------------------------
; parseTextureCoordinates – Parse all vt u v lines
;--------------------------------------------------------
parseTextureCoordinates proc
LOCAL hHeap:QWORD,pCurrentSource:QWORD
LOCAL texIndex:DWORD
PROLOG 100h

call GetProcessHeap
test rax,rax
jz lbl_WinError
mov hHeap,rax

cmp gnTotalTextureCoords,0
jle lbl_NoTex

;Allocate texture coords (2 floats * 4 bytes = 8)
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8
xor r8,r8
mov r8d,gnTotalTextureCoords
imul r8,r8,8
call HeapAlloc
test rax,rax
jz lbl_WinError
mov gpDataTextureCoords,rax
LOG_TEXT szOK

mov rcx,gpObjDataStart
mov pCurrentSource,rcx
xor r11,r11
mov texIndex,r11d

lbl_NextLine:
mov rcx,pCurrentSource
cmp rcx,gpObjDataEnd
jge lbl_Done

cmp word ptr[rcx],7476h ;'vt'
jne lbl_SkipLine
cmp byte ptr[rcx+2],20h
je lbl_FoundTex
cmp byte ptr[rcx+2],9
je lbl_FoundTex
jmp lbl_SkipLine

lbl_FoundTex:
add pCurrentSource,3 ;skip "vt "
mov rcx,pCurrentSource
call skipSpace
mov rcx,rax

;Parse U and V
call parseFloat
movss xmm0,xmm0 ;U

mov rcx,rax
call skipSpace
mov rcx,rax
call parseFloat
movss xmm1,xmm0 ;V

;Store
mov rdx,gpDataTextureCoords
mov r8d,texIndex
imul r8,r8,8
add rdx,r8

movss dword ptr[rdx],xmm0
movss dword ptr[rdx+4],xmm1

inc texIndex
mov pCurrentSource,rax

lbl_SkipLine:
mov rcx,pCurrentSource
cmp rcx,gpObjDataEnd
jge lbl_Done

lbl_SkipToEOL:
mov al,byte ptr[rcx]
cmp al,0Ah ;LF
je lbl_SkipLF_ParseTex
cmp al,0Dh ;CR
je lbl_SkipCR_ParseTex
test al,al ;EOF
jz lbl_Done
inc rcx
jmp lbl_SkipToEOL

lbl_SkipCR_ParseTex:
inc rcx
cmp byte ptr[rcx],0Ah
je lbl_SkipLF_ParseTex
jmp lbl_NextLine

lbl_SkipLF_ParseTex:
inc rcx
mov pCurrentSource,rcx
jmp lbl_NextLine

lbl_Done:
LOG_TEXT szLogTextureCoordsParsed
mov rcx,texIndex
call WriteDecimalToLog
LOG_TEXT szCRLF

mov rax,1
jmp lbl_End

lbl_NoTex:
LOG_TEXT szErrNoTextureCoords
xor rax,rax

lbl_WinError:
call SpellWinError
xor rax,rax

lbl_End:
EPILOG
parseTextureCoordinates endp