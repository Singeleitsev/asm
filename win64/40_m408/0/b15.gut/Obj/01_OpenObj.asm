openObj proc
LOCAL hHeap:QWORD
PROLOG 100h

;1. Open file
lea rcx,szFileNameObj
mov rdx,80000000h ;GENERIC_READ
mov r8,1 ;FILE_SHARE_READ
xor r9,r9 ;lpSecurityAttributes
mov qword ptr [rsp+20h],3 ;OPEN_EXISTING
mov qword ptr [rsp+28h],80h ;FILE_ATTRIBUTE_NORMAL
mov qword ptr [rsp+30h],0; hTemplateFile
call CreateFileA
cmp rax,-1
je lbl_OpenObj_Error_Open
mov ghObjFile,rax

;2. Get file size
mov rcx,ghObjFile
xor rdx,rdx ;lpFileSizeHigh
call GetFileSize
test rax,rax
jz lbl_OpenObj_Error_Size
mov gnObjFileSize,eax
mov rbx,rax

;3. Create file mapping
mov rcx,ghObjFile
xor rdx,rdx ;lpFileMappingAttributes
mov r8,2 ;flProtect = PAGE_READONLY
xor r9,r9 ;dwMaximumSizeHigh
mov qword ptr [rsp+20h],0 ;dwMaximumSizeLow
mov qword ptr [rsp+28h],0 ;lpName
call CreateFileMappingA
test rax,rax
jz lbl_OpenObj_Error_Map
mov ghObjMapping,rax

;4. Map view
mov rcx,ghObjMapping
mov rdx,4 ;dwDesiredAccess = FILE_MAP_READ
xor r8,r8 ;dwFileOffsetHigh
xor r9,r9 ;dwFileOffsetLow
xor rbx,rbx
mov ebx,gnObjFileSize
mov qword ptr [rsp+20h],rbx ;dwNumberOfBytesToMap
call MapViewOfFile
test rax,rax
jz lbl_OpenObj_Error_Unmap
mov gpObjDataStart,rax
add rax,rbx
mov gpObjDataEnd,rax

;Success
mov rax,1
jmp lbl_OpenObj_End

;Errors

lbl_OpenObj_Error_Open:
LOG_TEXT szErrLoadObjOpen
call SpellWinError
jmp lbl_OpenObj_Fail

lbl_OpenObj_Error_Size:
LOG_TEXT szErrLoadObjFileSize
call SpellWinError
mov rcx,ghObjFile
call CloseHandle
mov ghObjFile,0
jmp lbl_OpenObj_Fail

lbl_OpenObj_Error_Unmap: ;Must be immediately before Map
mov rcx,ghObjMapping
call CloseHandle
mov ghObjMapping,0
;jmp lbl_OpenObj_Error_Map

lbl_OpenObj_Error_Map: ;Must be immediately after Unmap
LOG_TEXT szErrLoadObjMap
call SpellWinError
mov rcx,ghObjFile
call CloseHandle
mov ghObjFile,0
jmp lbl_OpenObj_Fail

lbl_OpenObj_Fail:
xor rax,rax
;jmp lbl_OpenObj_End

lbl_OpenObj_End:
EPILOG
openObj endp
