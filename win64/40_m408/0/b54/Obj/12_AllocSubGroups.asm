;-------------------------------------------------------------------
;allocMaterials – Allocates memory for unique subgroup/material names
;Each "usemtl" token creates a SubGroup bucket with its own material index
;Follows the same pattern as allocObjects and allocGroups
;Input: gnTotalSubGroups (from countEntities)
;Output: gnUniqueSubGroups,gpDataSubGroups allocated and filled
;--------------------------------------------------------------
allocSubGroups proc
LOCAL hHeap:QWORD,pCurrentSource:QWORD
LOCAL pBufferNameSingle:QWORD,pBufferNameArray:QWORD
LOCAL index:DWORD
PROLOG 100h

;1. Get Process Heap since it's unconditional
call GetProcessHeap
test rax,rax
jz lbl_WinError
mov hHeap,rax

;2. Sanity Check
cmp gnTotalSubGroups,1
jg lbl_Pass_1
;Otherwise use defaults
mov gnUniqueSubGroups,1

;3.1. Pass 1 - Parse OBJ and collect Unique Names in the Name Array
lbl_Pass_1:

;Allocate temporary buffer (gnTotalSubGroups + 1) * NAME_BUFFER_SIZE
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,gnTotalSubGroups
inc r8d
imul r8,r8,NAME_BUFFER_SIZE
call HeapAlloc
test rax,rax
jz lbl_WinError
mov pBufferNameSingle,rax ;Current Name at position 0
add rax,NAME_BUFFER_SIZE
mov pBufferNameArray,rax ;Name Array starts at position 1
LOG_TEXT szOK

;Set Local Pointers
mov rcx,gpObjDataStart
mov pCurrentSource,rcx

;Initialize Counters
xor r8,r8
mov gnUniqueSubGroups,r8d
xor r11,r11
mov index,r11d

lbl_NextLine:
mov rcx,pCurrentSource
cmp rcx,gpObjDataEnd
jge lbl_Pass_2 ;Done

;Check for consistency
mov al,byte ptr [rcx]
cmp al,0 ;EOF
je lbl_Pass_2 ;Done
cmp al,9 ;Tab
je lbl_SkipByte
cmp al,0Ah ;CR
je lbl_SkipByte
cmp al,0Dh ;LF
je lbl_SkipByte
cmp al,20h ;Space
je lbl_SkipByte
cmp al,23h ;# OBJ Format Comment
je lbl_SkipByte

;Check for "usemtl" token (4 bytes: 'u','s','e','m')
cmp dword ptr [rcx],6D657375h ;"usem" in reverse order
je lbl_TokenUseMtl
jmp lbl_SkipByte

lbl_TokenUseMtl:
;Copy name to temp buffer
add pCurrentSource,6 ;skip "usemtl"
mov rcx,pCurrentSource
mov rdx,pBufferNameSingle
call parseString ;returns RAX = updated pointer
mov pCurrentSource,rax

xor r11,r11
mov index,r11d

lbl_CompareNames:
mov rcx,pBufferNameSingle
xor rdx,rdx
mov edx,index
imul rdx,rdx,NAME_BUFFER_SIZE
add rdx,pBufferNameArray
call CompareStrings ;Returns RAX = 1 if equal,0 if different
test eax,eax
jz lbl_DifferentNames
jmp lbl_SkipByte ;Not unique. Search for the next Source Name

lbl_DifferentNames:
inc index
mov r11d,index
cmp r11d,gnUniqueSubGroups
jl lbl_CompareNames

;Store the Unique Name
mov rcx,pBufferNameSingle
xor rdx,rdx
mov edx,index
imul rdx,rdx,NAME_BUFFER_SIZE
add rdx,pBufferNameArray
call parseString

;Update the Global Counter
inc gnUniqueSubGroups
mov r8d,gnUniqueSubGroups
cmp r8d,gnTotalSubGroups
jge lbl_Pass_2 ;Done
jmp lbl_SkipByte ;Stored. Search for the next Source Name

lbl_SkipByte:
mov rcx,pCurrentSource
cmp rcx,gpObjDataEnd
jge lbl_Pass_2 ;Done
mov al,byte ptr [rcx]
cmp al,0 ;EOF
je lbl_Pass_2 ;Done
cmp al,0Ah ;LF
je lbl_SkipLF
cmp al,0Dh ;CR
je lbl_SkipCR
inc pCurrentSource
jmp lbl_SkipByte

lbl_SkipCR:
inc pCurrentSource
mov rcx,pCurrentSource
cmp byte ptr [rcx],0Ah ;LF
je lbl_SkipLF
jmp lbl_NextLine

lbl_SkipLF:
inc pCurrentSource
jmp lbl_NextLine

;3.2. Pass 2 - Allocate and fill SubGroups Metadata Array
lbl_Pass_2:

;Allocate Memory for SubGroups Metadata Array
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,gnUniqueSubGroups
imul r8,r8,SUBGROUP_METADATA_SIZE
call HeapAlloc
test rax,rax
jz lbl_WinError
mov gpDataSubGroups,rax
LOG_TEXT szOK

;Initialize Indices
xor r11,r11
mov index,r11d

lbl_NextName:
;Fill SUBGROUP_NAME fields of the SubGroup Metadata Array
xor rcx,rcx
mov ecx,index
shl rcx,3 ;Pointer size (8 bytes)
add rcx,pBufferNameArray
xor rdx,rdx
mov edx,index
imul rdx,rdx,SUBGROUP_METADATA_SIZE
add rdx,gpDataSubGroups
add rdx,OFFSET_SUBGROUP_NAME ;Destination = subgroup name field
call parseString

inc index
mov r11d,index
cmp r11d,gnUniqueSubGroups
jl lbl_NextName

;4. Log Unique Names Count
LOG_TEXT szLogSubGroupsCount
xor rcx,rcx
mov ecx,gnUniqueSubGroups
call WriteDecimalToLog
LOG_TEXT szCRLF

;5. Free the temporary buffer
mov rcx,hHeap
xor rdx,rdx
mov r8,pBufferNameSingle
call HeapFree

;Success
mov rax,1
jmp lbl_End

lbl_WinError:
call SpellWinError
xor rax,rax

lbl_End:
EPILOG
allocSubGroups endp

