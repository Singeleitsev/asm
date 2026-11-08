openMtlFile proc
PROLOG 100h

;1. Open the file
lea rcx,szFileNameMat
mov rdx,80000000h ;GENERIC_READ
mov r8,1 ;FILE_SHARE_READ
xor r9,r9
mov qword ptr [rsp+20h],3 ;OPEN_EXISTING
mov qword ptr [rsp+28h],80h ;FILE_ATTRIBUTE_NORMAL
mov qword ptr [rsp+30h],0
call CreateFileA
cmp rax,-1
je lbl_openMtlFile_Error_Open
mov ghMtlFile,rax

;2. Get file size
mov rcx,ghMtlFile
xor rdx,rdx
call GetFileSize
test rax,rax
jz lbl_openMtlFile_Error_Size
mov gnMtlFileSize,rax

;3. Create file mapping
mov rcx,ghMtlFile
xor rdx,rdx ;lpFileMappingAttributes
mov r8,2 ;PAGE_READONLY
xor r9,r9 ;dwMaximumSizeHigh
mov qword ptr [rsp+20h],0 ;dwMaximumSizeLow
mov qword ptr [rsp+28h],0 ;lpName
call CreateFileMappingA
test rax,rax
jz lbl_openMtlFile_Error_Map
mov ghMtlMapping, rax

;4. Map view
mov rcx, ghMtlMapping
mov rdx,4 ;dwDesiredAccess = FILE_MAP_READ
xor r8,r8 ;dwFileOffsetHigh
xor r9,r9 ;dwFileOffsetLow
mov rbx,gnMtlFileSize
mov qword ptr [rsp+20h],rbx
call MapViewOfFile
test rax,rax
jz lbl_openMtlFile_Error_Unmap
mov gpMtlDataStart,rax
add rax,gnMtlFileSize
mov gpMtlDataEnd,rax

;Success
mov rax,1
jmp lbl_openMtlFile_End

;Errors

lbl_openMtlFile_Error_Open:
LOG_TEXT szErrLoadMtlOpen
call SpellWinError
jmp lbl_openMtlFile_Fail

lbl_openMtlFile_Error_Size:
LOG_TEXT szErrLoadMtlFileSize
call SpellWinError
mov rcx,ghMtlFile
call CloseHandle
mov ghMtlFile,0
jmp lbl_openMtlFile_Fail

lbl_openMtlFile_Error_Unmap: ;Must be immediately before lbl_openMtlFile_Error_Map
mov rcx,ghMtlMapping
call CloseHandle
mov ghMtlMapping,0
;jmp lbl_openMtlFile_Error_Map

lbl_openMtlFile_Error_Map: ;Must be immediately after lbl_openMtlFile_Error_Unmap
LOG_TEXT szErrLoadMtlMap
call SpellWinError
mov rcx,ghMtlFile
call CloseHandle
mov ghMtlFile,0
jmp lbl_openMtlFile_Fail

lbl_openMtlFile_Fail:
xor rax,rax
;jmp lbl_openMtlFile_End

lbl_openMtlFile_End:
EPILOG
openMtlFile endp
