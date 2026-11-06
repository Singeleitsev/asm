readObjFile proc
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
jz lbl_Error_Map
mov gpObjDataStart,rax
add rax,gnObjFileSize
mov gpObjDataEnd,rax

;1.5. Report Success
LOG_TEXT szLogObjOpened
mov rcx,gnObjFileSize
call WriteDecimalToLog
LOG_TEXT szCRLF

;2. Pass 1

;2.1. Counter
call countObjEntities
test al,al
jz lbl_End

;2.2. Fill the Metadata Structures
call allocObjBuffers
test al,al
jz lbl_End

;2.3. Read the Material Data
call readMtlFile
test al,al
jz lbl_End

;3. Pass 2

;3.1. Parse Obj and Mtl (nested) Data
call parseObjData
test al,al
jz lbl_End

;3.2. Convert the parsed data to interleaved VNC
call BuildGeometry
test al,al
jz lbl_End

;3.3. Map UseMtl records to Materials
call BuildMaterialMap
test al,al
jz lbl_End

;3.4. Optimize the geometry (future option)
call findOrAddCombinedVertices

;3.5. Build the draw list
call BuildDrawList
test al,al
jz lbl_End

;4.1. OBJ Cleanup (normal case)
mov rcx,gpObjDataStart
call UnmapViewOfFile
mov rcx,ghObjMapping
call CloseHandle
mov rcx,ghObjFile
call CloseHandle

;4.2. Report Success
LOG_TEXT szLogObjSuccess
mov rax,1
jmp lbl_End

;Errors
lbl_Error_Open:
LOG_TEXT szErrObjOpen
jmp lbl_WinError

lbl_Error_Size:
LOG_TEXT szErrObjFileSize
jmp lbl_WinError


lbl_Error_Map:
LOG_TEXT szErrObjMap
;jmp lbl_WinError


lbl_WinError:
call SpellWinError

cmp ghObjMapping,0
je @f
mov rcx,ghObjMapping
call CloseHandle
mov ghObjMapping,0

@@:
cmp ghObjFile,0
je @f
mov rcx,ghObjFile
call CloseHandle
mov ghObjFile,0

@@:
xor rax,rax ;Report Error
;jmp lbl_End

lbl_End:
EPILOG
readObjFile endp


