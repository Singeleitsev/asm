;--------------------------------------------------------
; parseMtlFile - Load and memory-map the MTL file
; Input: szFileNameMtl
; Output: ghMtlFile, gnMtlFileSize, ghMtlMapping,
;         gpMtlDataStart, gpMtlDataEnd
;--------------------------------------------------------
parseMtlFile proc
PROLOG 100h

LOG_TEXT szLogMtlLoad

;1.1. Open file
lea rcx,szFileNameMtl
mov rdx,80000000h ;GENERIC_READ
mov r8,1 ;FILE_SHARE_READ
xor r9,r9 ;lpSecurityAttributes
mov qword ptr [rsp+20h],3 ;OPEN_EXISTING
mov qword ptr [rsp+28h],80h ;FILE_ATTRIBUTE_NORMAL
mov qword ptr [rsp+30h],0
call CreateFileA
cmp rax,-1
je lbl_Error_Open
mov ghMtlFile,rax

;1.2. Get file size
mov rcx,ghMtlFile
xor rdx,rdx ;lpFileSizeHigh
call GetFileSize
test rax,rax
jz lbl_Error_Size
mov gnMtlFileSize,rax

;1.3. Create file mapping
mov rcx,ghMtlFile
xor rdx,rdx ;lpFileMappingAttributes
mov r8,2 ;flProtect = PAGE_READONLY
xor r9,r9 ;dwMaximumSizeHigh
mov qword ptr [rsp+20h],0 ;dwMaximumSizeLow
mov qword ptr [rsp+28h],0 ;lpName
call CreateFileMappingA
test rax,rax
jz lbl_Error_Map
mov ghMtlMapping,rax

;1.4. Map view
mov rcx,ghMtlMapping
mov rdx,4 ;dwDesiredAccess = FILE_MAP_READ
xor r8,r8 ;dwFileOffsetHigh
xor r9,r9 ;dwFileOffsetLow
mov rbx,gnMtlFileSize
mov qword ptr [rsp+20h],rbx ;dwNumberOfBytesToMap
call MapViewOfFile
test rax,rax
jz lbl_Error_Unmap
mov gpMtlDataStart,rax
add rax,gnMtlFileSize
mov gpMtlDataEnd,rax

;1.5. Report Success
LOG_TEXT szLogMtlOpened
mov rcx,gnMtlFileSize
call WriteDecimalToLog
LOG_TEXT szCRLF

;2.1. Pass 1 – Counter
call countMtlEntities
cmp rax,1
jne lbl_Error_Encounter

;2.2. Pass 2 – Allocators
call allocMaterials
cmp rax,1
jne lbl_Error_Allocator
call allocTextures
cmp rax,1
jne lbl_Error_Allocator

;2.3. Parsers
call parseMaterials
cmp rax,1
jne lbl_Error_Parser
call parseTextures
cmp rax,1
jne lbl_Error_Parser

;3.1. MTL Cleanup
mov rcx,gpMtlDataStart
call UnmapViewOfFile
mov rcx,ghMtlMapping
call CloseHandle
mov rcx,ghMtlFile
call CloseHandle

;3.2. Report Success
mov rax,1
LOG_TEXT szLogMtlSuccess
jmp lbl_End

;Errors
lbl_Error_Open:
LOG_TEXT szErrLoadMtlOpen
jmp lbl_WinError

lbl_Error_Size:
LOG_TEXT szErrLoadMtlFileSize
call SpellWinError
mov rcx,ghMtlFile
call CloseHandle
mov ghMtlFile,0
xor rax,rax
jmp lbl_End

lbl_Error_Map:
LOG_TEXT szErrLoadMtlMap
call SpellWinError
mov rcx,ghMtlFile
call CloseHandle
mov ghMtlFile,0
xor rax,rax
jmp lbl_End

lbl_Error_Unmap:
LOG_TEXT szErrLoadMtlMap
call SpellWinError
mov rcx,ghMtlMapping
call CloseHandle
mov ghMtlMapping,0
mov rcx,ghMtlFile
call CloseHandle
mov ghMtlFile,0
xor rax,rax

lbl_Error_Encounter:
LOG_TEXT szErrMtlEncounter
jmp lbl_End

lbl_Error_Allocator:
LOG_TEXT szErrMtlAllocator
jmp lbl_End

lbl_Error_Parser:
LOG_TEXT szErrMtlParser
jmp lbl_End

lbl_WinError:
call SpellWinError
xor rax,rax

lbl_End:
EPILOG
parseMtlFile endp


