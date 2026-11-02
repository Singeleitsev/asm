readMtlFile proc

;MTL
invoke WriteLog,offset szLogMtlLoad

;1.1. Open file
push 0; hTemplateFile
push 80h ;FILE_ATTRIBUTE_NORMAL
push 3 ;OPEN_EXISTING
push 0 ;lpSecurityAttributes
push 1 ;FILE_SHARE_READ
push 80000000h ;GENERIC_READ
push offset szFileNameMtl
call CreateFileA
cmp eax,-1
je lbl_Error_Open
mov ghMtlFile,eax

;1.2. Get file size
invoke GetFileSize,ghMtlFile,0 ;lpFileSizeHigh
test eax,eax
jz lbl_Error_Size
mov gnMtlFileSize,eax

;1.3. Create file mapping
push 0 ;lpName
push 0 ;dwMaximumSizeLow
push 0 ;dwMaximumSizeHigh
push 2 ;flProtect = PAGE_READONLY
push 0 ;lpFileMappingAttributes
push ghMtlFile
call CreateFileMappingA
test eax,eax
jz lbl_Error_Map
mov ghMtlMapping,eax

;1.4. Map view
push gnMtlFileSize ;dwNumberOfBytesToMap
push 0 ;dwFileOffsetLow
push 0 ;dwFileOffsetHigh
push 4 ;dwDesiredAccess = FILE_MAP_READ
push ghMtlMapping
call MapViewOfFile
test eax,eax
jz lbl_Error_Map
mov gpMtlDataStart,eax
add eax,gnMtlFileSize
mov gpMtlDataEnd,eax

;1.5. Report Success
invoke WriteLog,offset szLogMtlOpened
push gnMtlFileSize
call WriteDecimalToLog
invoke WriteLog,offset szCRLF

;2.1. Pass 1 – Counter
call countMtlEntities
call allocMtlBuffers

;2.2. Pass 2 – Parser
call parseMtlData

;3.1. MTL Cleanup
invoke UnmapViewOfFile,gpMtlDataStart
invoke CloseHandle,ghMtlMapping
invoke CloseHandle,ghMtlFile

;3.2. Report Success
invoke WriteLog,offset szLogMtlSuccess
mov eax,1
jmp lbl_End



;Errors
lbl_Error_Open:
invoke WriteLog,offset szErrMtlOpen
jmp lbl_Error

lbl_Error_Size:
invoke WriteLog,offset szErrMtlFileSize
jmp lbl_Error

lbl_Error_Map:
invoke WriteLog,offset szErrMtlMap
;jmp lbl_Error



lbl_Error:
call SpellError

cmp ghMtlMapping,0
je @f
invoke CloseHandle,ghMtlMapping
mov ghMtlMapping,0

@@:
cmp ghMtlFile,0
je @f
invoke CloseHandle,ghMtlFile
mov ghMtlFile,0

@@:
xor eax,eax ;Report Error
;jmp lbl_End

lbl_End:
ret
readMtlFile endp


