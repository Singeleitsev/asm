;--------------------------------------------------------
; parseTextures - Parse texture map filenames from MTL
; Input: gpMtlDataStart/End, gnUniqueTextureNames
; Output: gpDataTextureNames filled with texture filenames
;--------------------------------------------------------
parseTextures proc
LOCAL hHeap:QWORD,pCurrentSource:QWORD
LOCAL textureIndex:DWORD,currentTexture:DWORD
LOCAL pTempNameBuffer:QWORD
PROLOG 100h

call GetProcessHeap
test rax,rax
jz lbl_WinError
mov hHeap,rax

cmp gnUniqueTextureNames,0
jle lbl_NoTextures

;Allocate temp buffer for texture name
mov rcx,hHeap
mov rdx,8
xor r8,r8
mov r8d,NAME_BUFFER_SIZE
call HeapAlloc
test rax,rax
jz lbl_WinError
mov pTempNameBuffer,rax

;Initialize
mov rcx,gpMtlDataStart
mov pCurrentSource,rcx
xor r11,r11
mov textureIndex,r11d
mov currentTexture,-1

lbl_NextLine:
mov rcx,pCurrentSource
cmp rcx,gpMtlDataEnd
jge lbl_Done

;Check for consistency
mov al,byte ptr[rcx]
cmp al,0 ;EOF
je lbl_Done
cmp al,9 ;Tab
je lbl_SkipLine
cmp al,0Ah ;CR
je lbl_SkipLine
cmp al,0Dh ;LF
je lbl_SkipLine
cmp al,20h ;Space
je lbl_SkipLine
cmp al,23h ;# Comment
je lbl_SkipLine

;Check for "map_Kd" or "map_Ks" token
cmp dword ptr[rcx],5F6B616Dh ;"map_" in reverse
jne lbl_SkipLine
cmp byte ptr[rcx+4],4Bh ;'K'
je lbl_FoundMap
cmp byte ptr[rcx+4],73h ;'s'
je lbl_FoundMap
jmp lbl_SkipLine

lbl_FoundMap:
;Copy name to temp buffer
add pCurrentSource,7 ;skip "map_Kd " or "map_Ks "
mov rcx,pCurrentSource
mov rdx,pTempNameBuffer
call parseString
mov pCurrentSource,rax

;Find texture index by name
xor r11,r11
mov textureIndex,r11d

lbl_FindTexture:
mov rcx,pTempNameBuffer
xor rdx,rdx
mov edx,textureIndex
imul rdx,rdx,NAME_BUFFER_SIZE
add rdx,gpDataTextureNames
call CompareStrings
test eax,eax
jz lbl_NextTexture

mov eax,textureIndex
mov currentTexture,eax
jmp lbl_StoreTexture

lbl_NextTexture:
inc textureIndex
mov r11d,textureIndex
cmp r11d,gnUniqueTextureNames
jl lbl_FindTexture
jmp lbl_SkipLine

lbl_StoreTexture:
;Texture name already stored by allocTextures
;Optionally store additional info like map type
jmp lbl_SkipLine

lbl_SkipLine:
mov rcx,pCurrentSource
cmp rcx,gpMtlDataEnd
jge lbl_Done

lbl_SkipToEOL:
mov al,byte ptr[rcx]
cmp al,0Ah ;LF
je lbl_SkipLF
cmp al,0Dh ;CR
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
;Free temp buffer
mov rcx,hHeap
xor rdx,rdx
mov r8,pTempNameBuffer
call HeapFree

LOG_TEXT szLogTextureNamesCount
mov rcx,gnUniqueTextureNames
call WriteDecimalToLog
LOG_TEXT szCRLF

mov rax,1
jmp lbl_End

lbl_NoTextures:
LOG_TEXT szErrNoTextureNames
mov rax,1
jmp lbl_End

lbl_WinError:
call SpellWinError
xor rax,rax

lbl_End:
EPILOG
parseTextures endp

