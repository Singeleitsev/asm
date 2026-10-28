readObjFile proc

;OBJ
invoke WriteLog,offset szLogObjLoad

;1.1. Open file
push 0; hTemplateFile
push 80h ;FILE_ATTRIBUTE_NORMAL
push 3 ;OPEN_EXISTING
push 0 ;lpSecurityAttributes
push 1 ;FILE_SHARE_READ
push 80000000h ;GENERIC_READ
push offset szFileNameObj
call CreateFileA
cmp eax,-1
je lbl_Error_Open
mov ghObjFile,eax

;1.2. Get file size
invoke GetFileSize,ghObjFile,0 ;lpFileSizeHigh
test eax,eax
jz lbl_Error_Size
mov gnObjFileSize,eax

;1.3. Create file mapping
push 0 ;lpName
push 0 ;dwMaximumSizeLow
push 0 ;dwMaximumSizeHigh
push 2 ;flProtect = PAGE_READONLY
push 0 ;lpFileMappingAttributes
push ghObjFile
call CreateFileMappingA
test eax,eax
jz lbl_Error_Map
mov ghObjMapping,eax

;1.4. Map view
push gnObjFileSize ;dwNumberOfBytesToMap
push 0 ;dwFileOffsetLow
push 0 ;dwFileOffsetHigh
push 4 ;dwDesiredAccess = FILE_MAP_READ
push ghObjMapping
call MapViewOfFile
test eax,eax
jz lbl_Error_Map
mov gpObjDataStart,eax
add eax,gnObjFileSize
mov gpObjDataEnd,eax

;1.5. Report Success
invoke WriteLog,offset szLogObjOpened
push gnObjFileSize
call WriteDecimalToLog
invoke WriteLog,offset szCRLF

;2.1. Pass 1 – Counter
call countObjEntities
call allocObjBuffers

;2.2. Read the Material Data
call readMtlFile

;2.3. Pass 2 – Parser
call parseObjData

;3.1. OBJ Cleanup
invoke UnmapViewOfFile,gpObjDataStart
invoke CloseHandle,ghObjMapping
invoke CloseHandle,ghObjFile

;3.2. Report Success
invoke WriteLog,offset szLogObjSuccess
mov eax,1
jmp lbl_End



;Errors
lbl_Error_Open:
invoke WriteLog,offset szErrObjOpen
jmp lbl_Error

lbl_Error_Size:
invoke WriteLog,offset szErrObjFileSize
jmp lbl_Error

lbl_Error_Map:
invoke WriteLog,offset szErrObjMap
;jmp lbl_Error



lbl_Error:
call SpellError

cmp ghObjMapping,0
je @f
invoke CloseHandle,ghObjMapping
mov ghObjMapping,0

@@:
cmp ghObjFile,0
je @f
invoke CloseHandle,ghObjFile
mov ghObjFile,0

@@:
xor eax,eax ;Report Error
;jmp lbl_End

lbl_End:
ret
readObjFile endp


