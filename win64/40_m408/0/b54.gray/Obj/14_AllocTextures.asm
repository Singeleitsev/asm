;-----------------------------------------------------------------
;allocTextureNames – Allocates memory for unique texture filenames
;from the MTL file
;Each "map_Kd" or "map_Ks" token creates a texture name entry
;Follows the same pattern as all other allocators
;Input: gnTotalTextureNames (from MTL parser)
;Output: gnUniqueTextureNames,gpDataTextureNames allocated and filled
;---------------------------------------------------------------------
allocTextureNames proc
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
cmp gnTotalTextureNames,1
jg lbl_Pass_1
;Otherwise use defaults
mov gnUniqueTextureNames,1

;3.1. Pass 1 - Parse MTL and collect Unique Texture Names in the Name Array
lbl_Pass_1:

;Allocate temporary buffer (gnTotalTextureNames + 1) * NAME_BUFFER_SIZE
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,gnTotalTextureNames
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
mov rcx,gpMtlDataStart
mov pCurrentSource,rcx

;Initialize Counters
xor r8,r8
mov gnUniqueTextureNames,r8d
xor r11,r11
mov index,r11d

lbl_NextLine:
mov rcx,pCurrentSource
cmp rcx,gpMtlDataEnd
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
cmp al,23h ;# MTL Format Comment
je lbl_SkipByte

;Check for "map_Kd" token (6 bytes: 'm','a','p','_','K','d')
cmp dword ptr [rcx],6B5F706Dh ;"map_" in reverse order? No,that's 'm','a','p','_'
;Actually we need to check the full token. Let's compare the first 6 bytes.
;"map_Kd" = 6D 61 70 5F 4B 64
mov rax,20644B5F70616Dh ;"map_Kd" in little-endian
mov rdx,qword ptr[rcx]
cmp rdx,rax
je lbl_TokenMapKd
mov rax,20734B5F70616Dh ;"map_Ks" in little-endian
mov rdx,qword ptr[rcx]
cmp rdx,rax
je lbl_TokenMapKs
jmp lbl_SkipByte

lbl_TokenMapKd:
add pCurrentSource,6 ;skip "map_Kd"
jmp lbl_ParseTextureName

lbl_TokenMapKs:
add pCurrentSource,6 ;skip "map_Ks"

lbl_ParseTextureName:
;Skip any options (like -bm 0.0200) that may appear before the filename
;We'll use a simple approach: skip spaces and hyphen options
mov rcx,pCurrentSource
call skipSpace
mov pCurrentSource,rax

;Check for option (starts with '-')
lbl_SkipOptions:
mov rcx,pCurrentSource
cmp byte ptr [rcx],2Dh ;'-' character
jne lbl_ReadTextureName

;Skip option name
lbl_SkipOptionName:
inc pCurrentSource
mov rcx,pCurrentSource
cmp byte ptr [rcx],20h ;space
je lbl_SkipOptionValue
cmp byte ptr [rcx],9 ;tab
je lbl_SkipOptionValue
cmp byte ptr [rcx],0 ;EOF
je lbl_Pass_2
cmp byte ptr [rcx],0Ah ;LF
je lbl_Pass_2
cmp byte ptr [rcx],0Dh ;CR
je lbl_Pass_2
jmp lbl_SkipOptionName

lbl_SkipOptionValue:
inc pCurrentSource
mov rcx,pCurrentSource
cmp byte ptr [rcx],20h ;space
je lbl_AfterOption
cmp byte ptr [rcx],9 ;tab
je lbl_AfterOption
cmp byte ptr [rcx],0 ;EOF
je lbl_Pass_2
cmp byte ptr [rcx],0Ah ;LF
je lbl_Pass_2
cmp byte ptr [rcx],0Dh ;CR
je lbl_Pass_2
jmp lbl_SkipOptionValue

lbl_AfterOption:
inc pCurrentSource
jmp lbl_SkipOptions

lbl_ReadTextureName:
;Now read the texture filename
mov rcx,pCurrentSource
mov rdx,pBufferNameSingle
call parseString
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
cmp r11d,gnUniqueTextureNames
jl lbl_CompareNames

;Store the Unique Name
mov rcx,pBufferNameSingle
xor rdx,rdx
mov edx,index
imul rdx,rdx,NAME_BUFFER_SIZE
add rdx,pBufferNameArray
call parseString

;Update the Global Counter
inc gnUniqueTextureNames
mov r8d,gnUniqueTextureNames
cmp r8d,gnTotalTextureNames
jge lbl_Pass_2 ;Done
jmp lbl_SkipByte ;Stored. Search for the next Source Name

lbl_SkipByte:
mov rcx,pCurrentSource
cmp rcx,gpMtlDataEnd
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

;3.2. Pass 2 - Allocate and fill Texture Names Array
lbl_Pass_2:

;Allocate Memory for Texture Names Array
LOG_TEXT szLogMemoryAllocating
mov rcx,hHeap
mov rdx,8 ;HEAP_ZERO_MEMORY
xor r8,r8
mov r8d,gnUniqueTextureNames
imul r8,r8,NAME_BUFFER_SIZE ;Texture names are just strings,use NAME_BUFFER_SIZE
call HeapAlloc
test rax,rax
jz lbl_WinError
mov gpDataTextureNames,rax
LOG_TEXT szOK

;Initialize Indices
xor r11,r11
mov index,r11d

lbl_NextName:
;Fill texture name array
xor rcx,rcx
mov ecx,index
shl rcx,3 ;Pointer size (8 bytes)
add rcx,pBufferNameArray
xor rdx,rdx
mov edx,index
imul rdx,rdx,NAME_BUFFER_SIZE
add rdx,gpDataTextureNames
call parseString

inc index
mov r11d,index
cmp r11d,gnUniqueTextureNames
jl lbl_NextName

;4. Log Unique Names Count
LOG_TEXT szLogTextureNamesCount
xor rcx,rcx
mov ecx,gnUniqueTextureNames
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
allocTextureNames endp


