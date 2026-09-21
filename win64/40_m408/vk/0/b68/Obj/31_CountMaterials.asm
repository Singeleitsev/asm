countMaterials proc

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
;Pattern: ASCII code: 'n
mov rax,6eh
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



;Token detection
cmp dword ptr[rcx],6d77656eh ;"newm"
jne lbl_FindNextLine
add rcx,4
cmp word ptr[rcx],6c74h ;"tl" in reverse order
jne lbl_FindNextLine
add rcx,2
cmp byte ptr[rcx],20h ;Space after "newmtl" - Most probable
je lbl_TokenMaterial
cmp byte ptr[rcx],9 ;Tab after "newmtl" - Least probable
je lbl_TokenMaterial
jmp lbl_FindNextLine ;Junk

;Count Material name: newmtl name
lbl_TokenMaterial:
inc gnTotalMaterials
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
countMaterials endp
