readMtlFile proc
PROLOG 100h

;MTL
LOG_TEXT szLogMtlLoad

;1.1. Open file
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
jz lbl_Error_Map
mov gpMtlDataStart,rax
add rax,gnMtlFileSize
mov gpMtlDataEnd,rax

;1.5. Report Success
LOG_TEXT szLogMtlOpened
mov rcx,gnMtlFileSize
call WriteDecimalToLog
LOG_TEXT szCRLF

;2. Pass 1

;2.1. Pass 1 – Counter
call countMtlEntities
test al,al
jz lbl_End

;2.2. Fill the Metadata Structures
call allocMtlBuffers
test al,al
jz lbl_End

;3. Pass 2 – Parser
call parseMtlData
test al,al
jz lbl_End

;4.1. MTL Cleanup
mov rcx,gpMtlDataStart
call UnmapViewOfFile
mov rcx,ghMtlMapping
call CloseHandle
mov rcx,ghMtlFile
call CloseHandle

;4.2. Report Success
LOG_TEXT szLogMtlSuccess
mov rax,1
jmp lbl_End



;Errors
lbl_Error_Open:
LOG_TEXT szErrMtlOpen
jmp lbl_WinError

lbl_Error_Size:
LOG_TEXT szErrMtlFileSize
jmp lbl_WinError


lbl_Error_Map:
LOG_TEXT szErrMtlMap
;jmp lbl_WinError




lbl_WinError:
call SpellWinError

cmp ghMtlMapping,0
je @f
mov rcx,ghMtlMapping
call CloseHandle
mov ghMtlMapping,0

@@:
cmp ghMtlFile,0
je @f
mov rcx,ghMtlFile
call CloseHandle
mov ghMtlFile,0

@@:
xor rax,rax ;Report Error
;jmp lbl_End

lbl_End:
EPILOG
readMtlFile endp


