;--------------------------------------------------------
; allocObjects – Allocates memory for unique object names
; Input: gnTotalObjects (from countEntities)
; Output: gnUniqueObjects,gpDataObjects allocated and filled
;------------------------------------------------------------

allocObjects proc
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
cmp gnTotalObjects,1
jg lbl_Pass_1
;Otherwise use defaults
mov gnUniqueObjects,1

;3.1. Pass 1 - Parse OBJ and collect Unique Names in the Name Array
lbl_Pass_1:

;Allocate temporary buffer (gnTotalObjects + 1 ) * NAME_BUFFER_SIZE
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,gnTotalObjects
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
mov gnUniqueObjects,r8d
xor r11,r11
mov index,r11d

lbl_NextLine:

mov rcx,pCurrentSource
cmp rcx,gpObjDataEnd
jge lbl_Pass_2 ;Done

;Check for consistency
mov al,byte ptr[rcx]
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

;Check for "o" token
cmp word ptr[rcx],206Fh ;"o" with Space in reverse order
je lbl_TokenObject
cmp word ptr[rcx],096Fh ;"o" with Tab in reverse order
je lbl_TokenObject
jmp lbl_SkipByte

lbl_TokenObject:
;Copy name to temp buffer
add pCurrentSource,2 ;skip "o "
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
cmp r11d,gnUniqueObjects
jl lbl_CompareNames

;Store the Unique Name
mov rcx,pBufferNameSingle
xor rdx,rdx
mov edx,index
imul rdx,rdx,NAME_BUFFER_SIZE
add rdx,pBufferNameArray
call parseString

;Update the Global Counter
inc gnUniqueObjects
mov r8d,gnUniqueObjects
cmp r8d,gnTotalObjects
jge lbl_Pass_2 ;Done
jmp lbl_SkipByte ;Stored. Search for the next Source Name

lbl_SkipByte:
mov rcx,pCurrentSource
cmp rcx,gpObjDataEnd
jge lbl_Pass_2 ;Done
mov al,byte ptr[rcx]
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
cmp byte ptr[rcx],0Ah ;LF
je lbl_SkipLF
jmp lbl_NextLine

lbl_SkipLF:
inc pCurrentSource
jmp lbl_NextLine

;3.2. Pass 2 - Allocate and fill Objects Metadata Array
lbl_Pass_2:

;Allocate Memory for Objects Metadata Array
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,gnUniqueObjects
imul r8,r8,OBJECT_METADATA_SIZE
call HeapAlloc
test rax,rax
jz lbl_WinError
mov gpDataObjects,rax
LOG_TEXT szOK
;call SpellRAX

;Initialize Indices
xor r11,r11
mov index,r11d

lbl_NextName:
;Fill OBJECT_NAME fields of the Object Metadata Array
xor rcx,rcx
mov ecx,index
shl rcx,3 ;Pointer size
add rcx,pBufferNameArray
xor rdx,rdx
mov edx,index
imul rdx,rdx,OBJECT_METADATA_SIZE
add rdx,gpDataObjects
call parseString

inc index
mov r11d,index
cmp r11d,gnUniqueObjects
jl lbl_NextName

;4. Log Unique Names Count
LOG_TEXT szLogObjectsCount
xor rcx,rcx
mov ecx,gnUniqueObjects
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
;jmp lbl_End

lbl_End:
EPILOG
allocObjects endp


