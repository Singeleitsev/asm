;--------------------------------------------------------
; countMtlEntities - Count materials and texture names from MTL
; Input: gpMtlDataStart/End
; Output: gnTotalMaterials, gnTotalTextureNames
;--------------------------------------------------------
countMtlEntities proc
LOCAL pCurrentPosition:QWORD
PROLOG 100h

mov rcx,gpMtlDataStart
mov pCurrentPosition,rcx

;Initialize Counters
mov gnTotalMaterials,0
mov gnTotalTextureNames,0

lbl_NextLine:
mov rcx,pCurrentPosition
cmp rcx,gpMtlDataEnd
jge lbl_EndOfFile

;Check for consistency
mov al,byte ptr[rcx]
cmp al,0 ;EOF
je lbl_EndOfFile
cmp al,9 ;Tab
je lbl_SkipByte
cmp al,0Ah ;CR
je lbl_SkipByte
cmp al,0Dh ;LF
je lbl_SkipByte
cmp al,20h ;Space
je lbl_SkipByte
cmp al,23h ;# Comment
je lbl_SkipByte

;Token detection
cmp dword ptr[rcx],6C746D6Eh ;"newm" in reverse - "newmtl"
je lbl_TokenNewMtl
cmp dword ptr[rcx],5F6B616Dh ;"map_" in reverse
je lbl_TokenMap
jmp lbl_SkipByte

;Count material: newmtl name
lbl_TokenNewMtl:
add pCurrentPosition,7 ;skip "newmtl "
inc gnTotalMaterials
jmp lbl_SkipByte

;Count texture name: map_Kd or map_Ks
lbl_TokenMap:
cmp byte ptr[rcx+4],4Bh ;'K'
je lbl_CountTexture
cmp byte ptr[rcx+4],73h ;'s'
je lbl_CountTexture
jmp lbl_SkipByte

lbl_CountTexture:
inc gnTotalTextureNames

lbl_SkipByte:
mov rcx,pCurrentPosition
cmp rcx,gpMtlDataEnd
jge lbl_EndOfFile
mov al,byte ptr[rcx]
cmp al,0 ;EOF
je lbl_EndOfFile
cmp al,0Ah ;LF
je lbl_SkipLF
cmp al,0Dh ;CR
je lbl_SkipCR
inc pCurrentPosition
jmp lbl_SkipByte

lbl_SkipCR:
inc pCurrentPosition
mov rcx,pCurrentPosition
cmp byte ptr[rcx],0Ah ;LF
je lbl_SkipLF
jmp lbl_NextLine

lbl_SkipLF:
inc pCurrentPosition
jmp lbl_NextLine

lbl_EndOfFile:
cmp gnTotalMaterials,0
jne @f
LOG_TEXT szErrNoMaterials
@@:
cmp gnTotalTextureNames,0
jne @f
LOG_TEXT szErrNoTextureNames
@@:

;Log counts
LOG_TEXT szLogMaterialsCount
mov rcx,gnTotalMaterials
call WriteDecimalToLog
LOG_TEXT szCRLF

LOG_TEXT szLogTextureNamesCount
mov rcx,gnTotalTextureNames
call WriteDecimalToLog
LOG_TEXT szCRLF

;Success
mov rax,1
jmp lbl_End

lbl_WinError:
call SpellWinError
xor rax,rax

lbl_End:
EPILOG
countMtlEntities endp

