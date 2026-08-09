parseObjFile proc
PROLOG 100h

;OBJ
LOG_TEXT szLogObjLoad

;1.1. Open file
lea rcx,szFileNameObj
mov rdx,80000000h ;GENERIC_READ
mov r8,1 ;FILE_SHARE_READ
xor r9,r9 ;lpSecurityAttributes
mov qword ptr [rsp+20h],3 ;OPEN_EXISTING
mov qword ptr [rsp+28h],80h ;FILE_ATTRIBUTE_NORMAL
mov qword ptr [rsp+30h],0; hTemplateFile
call CreateFileA
cmp rax,-1
je lbl_Error_Open
mov ghObjFile,rax

;1.2. Get file size
mov rcx,ghObjFile
xor rdx,rdx ;lpFileSizeHigh
call GetFileSize
test rax,rax
jz lbl_Error_Size
mov gnObjFileSize,rax

;1.3. Create file mapping
mov rcx,ghObjFile
xor rdx,rdx ;lpFileMappingAttributes
mov r8,2 ;flProtect = PAGE_READONLY
xor r9,r9 ;dwMaximumSizeHigh
mov qword ptr [rsp+20h],0 ;dwMaximumSizeLow
mov qword ptr [rsp+28h],0 ;lpName
call CreateFileMappingA
test rax,rax
jz lbl_Error_Map
mov ghObjMapping,rax

;1.4. Map view
mov rcx,ghObjMapping
mov rdx,4 ;dwDesiredAccess = FILE_MAP_READ
xor r8,r8 ;dwFileOffsetHigh
xor r9,r9 ;dwFileOffsetLow
mov rbx,gnObjFileSize
mov qword ptr [rsp+20h],rbx ;dwNumberOfBytesToMap
call MapViewOfFile
test rax,rax
jz lbl_Error_Unmap
mov gpObjDataStart,rax
add rax,gnObjFileSize
mov gpObjDataEnd,rax

;1.5. Report Success
LOG_TEXT szLogObjOpened
mov rcx,gnObjFileSize
call WriteDecimalToLog
LOG_TEXT szCRLF

;2.1. Pass 1 – Counter
call countObjEntities
cmp rax,1
jne lbl_Error_Encounter

;2.2. Pass 2 – Allocators
call allocObjects
cmp rax,1
jne lbl_Error_Allocator
call allocGroups
cmp rax,1
jne lbl_Error_Allocator
call allocSubGroups
cmp rax,1
jne lbl_Error_Allocator
call allocMaterialNames
cmp rax,1
jne lbl_Error_Allocator
call allocTextureNames
cmp rax,1
jne lbl_Error_Allocator
;call allocVertices
;cmp rax,1
;jne lbl_Error_Allocator
;call allocNormals
;cmp rax,1
;jne lbl_Error_Allocator
;call allocTextureCoordinates
;cmp rax,1
;jne lbl_Error_Allocator
;call allocFaces
;cmp rax,1
;jne lbl_Error_Allocator
;call allocIndices
;cmp rax,1
;jne lbl_Error_Allocator

;2.3. Pass 3 – Parsers
;call parseObjects
;cmp rax,1
;jne lbl_Error_Parser
;call parseGroups
;cmp rax,1
;jne lbl_Error_Parser
call parseMaterialNames
cmp rax,1
jne lbl_Error_Parser
call parseTextureNames
cmp rax,1
jne lbl_Error_Parser
call parseVertices
cmp rax,1
jne lbl_Error_Parser
call parseNormals
cmp rax,1
jne lbl_Error_Parser
call parseTextureCoordinates
cmp rax,1
jne lbl_Error_Parser
;call parseFaces
cmp rax,1
jne lbl_Error_Parser
;call parseIndices
cmp rax,1
jne lbl_Error_Parser
call buildCombinedVertices
cmp rax,1
jne lbl_Error_Parser

;3.1. OBJ Cleanup
mov rcx,gpObjDataStart
call UnmapViewOfFile
mov rcx,ghObjMapping
call CloseHandle
mov rcx,ghObjFile
call CloseHandle

;3.2. Report Success
LOG_TEXT szLogObjSuccess
mov rax,1
jmp lbl_End

;Errors
lbl_Error_Open:
LOG_TEXT szErrLoadObjOpen
jmp lbl_WinError

lbl_Error_Size:
LOG_TEXT szErrLoadObjFileSize
call SpellWinError
mov rcx,ghObjFile
call CloseHandle
mov ghObjFile,0
jmp lbl_End

lbl_Error_Map:
LOG_TEXT szErrLoadObjMap
call SpellWinError
mov rcx,ghObjFile
call CloseHandle
mov ghObjFile,0
jmp lbl_End

lbl_Error_Unmap:
LOG_TEXT szErrLoadObjMap
call SpellWinError
mov rcx,ghObjMapping
call CloseHandle
mov ghObjMapping,0
mov rcx,ghObjFile
call CloseHandle
mov ghObjFile,0
jmp lbl_End

lbl_Error_Encounter:
LOG_TEXT szErrObjEncounter
jmp lbl_End

lbl_Error_Allocator:
LOG_TEXT szErrObjAllocator
jmp lbl_End

lbl_Error_Parser:
LOG_TEXT szErrObjParser
jmp lbl_End

lbl_WinError:
call SpellWinError
;jmp lbl_End

lbl_End:
EPILOG
parseObjFile endp


