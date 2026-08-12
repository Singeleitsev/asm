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



;MTL
LOG_TEXT szLogMtlLoad

;2.1. Open file
lea rcx,szFileNameMtl
mov rdx,80000000h ;GENERIC_READ
mov r8,1 ;FILE_SHARE_READ
xor r9,r9 ;lpSecurityAttributes
mov qword ptr [rsp+20h],3 ;OPEN_EXISTING
mov qword ptr [rsp+28h],80h ;FILE_ATTRIBUTE_NORMAL
mov qword ptr [rsp+30h],0; hTemplateFile
call CreateFileA
cmp rax,-1
je lbl_Error_Open
mov ghMtlFile,rax

;2.2. Get file size
mov rcx,ghMtlFile
xor rdx,rdx ;lpFileSizeHigh
call GetFileSize
test rax,rax
jz lbl_Error_Size
mov gnMtlFileSize,rax

;2.3. Create file mapping
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

;2.4. Map view
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

;2.5. Report Success
LOG_TEXT szLogMtlOpened
mov rcx,gnMtlFileSize
call WriteDecimalToLog
LOG_TEXT szCRLF

;3.1. Pass 1 – Counter
call countEntities
cmp rax,1
jne lbl_Error_Encounter

;3.2. Pass 2 – Allocators
call allocObjects
cmp rax,1
jne lbl_Error_Allocator
call allocGroups
cmp rax,1
jne lbl_Error_Allocator
call allocSubGroups
cmp rax,1
jne lbl_Error_Allocator
call allocMaterials
cmp rax,1
jne lbl_Error_Allocator
call allocTextureNames
cmp rax,1
jne lbl_Error_Allocator
;call allocVertices
cmp rax,1
jne lbl_Error_Allocator
;call allocNormals
cmp rax,1
jne lbl_Error_Allocator
;call allocTextureCoordinates
cmp rax,1
jne lbl_Error_Allocator
;call allocFaces
cmp rax,1
jne lbl_Error_Allocator
;call allocIndices
cmp rax,1
jne lbl_Error_Allocator

;3.3. Pass 3 – Parsers
;call parseObjects
cmp rax,1
jne lbl_Error_Filler
;call parseGroups
cmp rax,1
jne lbl_Error_Filler
;call parseMaterials
cmp rax,1
jne lbl_Error_Filler
;call parseTextures
cmp rax,1
jne lbl_Error_Filler
;call parseVertices
cmp rax,1
jne lbl_Error_Filler
;call parseNormals
cmp rax,1
jne lbl_Error_Filler
;call parseTextureCoordinates
cmp rax,1
jne lbl_Error_Filler
;call parseFaces
cmp rax,1
jne lbl_Error_Filler
;call parseIndices
cmp rax,1
jne lbl_Error_Filler

;4.1. OBJ Cleanup
mov rcx,gpObjDataStart
call UnmapViewOfFile
mov rcx,ghObjMapping
call CloseHandle
mov rcx,ghObjFile
call CloseHandle

;4.2. MTL Cleanup
mov rcx,gpMtlDataStart
call UnmapViewOfFile
mov rcx,ghMtlMapping
call CloseHandle
mov rcx,ghMtlFile
call CloseHandle

;4.3. Report Success
LOG_TEXT szLogObjSuccess
LOG_TEXT szLogMtlSuccess
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

lbl_Error_Filler:
LOG_TEXT szErrObjFiller
jmp lbl_End

lbl_WinError:
call SpellWinError
;jmp lbl_End

lbl_End:
EPILOG
parseObjFile endp


