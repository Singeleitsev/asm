InitLogger proc
PROLOG 100h
 
lea rcx,szLogFileName
mov rdx,40000000h ;dwDesiredAccess = GENERIC_WRITE
mov r8,1 ;dwShareMode = FILE_SHARE_READ
xor r9,r9 ;lpSecurityAttributes
mov qword ptr[rsp+20h],2 ;dwCreationDisposition = CREATE_ALWAYS
mov qword ptr[rsp+28h],80h ;dwFlagsAndAttributes = FILE_ATTRIBUTE_NORMAL
mov qword ptr[rsp+30h],0 ;hTemplateFile
call CreateFileA
cmp rax,-1
je InitLogger_Error
test rax,rax
jz InitLogger_Error
mov ghLogFile,rax

lea rcx,szLogInit
call WriteLog

jmp InitLogger_End

InitLogger_Error:
mov rcx,ghWnd
lea rdx,szErrInitLogger
lea r8,szError
xor r9,r9 ;MB_OK = 0
call MessageBoxA

InitLogger_End:
EPILOG
InitLogger endp



WriteLog proc pszText:QWORD
PROLOG_PUSH 100h

;Clean the Counter
mov dwBytesWritten,0

mov pszText,rcx
cmp pszText,0
je WriteLog_Error

;mov rcx,pszText
call lstrlenA
test eax,eax
jz WriteLog_Error
mov r8,rax ;nNumberOfBytesToWrite = lenText

mov rcx,ghLogFile
mov rdx,pszText
;mov r8,lenText
lea r9,dwBytesWritten
mov qword ptr[rsp+20h],0 ;lpOverlapped
call WriteFile
test eax,eax
jz WriteLog_Error

jmp WriteLog_End

WriteLog_Error:
mov rcx,ghWnd
lea rdx,szErrWriteLog
lea r8,szError
xor r9,r9 ;MB_OK = 0
call MessageBoxA

WriteLog_End:
mov eax,dwBytesWritten
EPILOG_POP
WriteLog endp



CloseLogger proc
PROLOG 100h

mov rcx,ghLogFile
test rcx,rcx
jz CloseLogger_End
call CloseHandle
mov ghLogFile,0

CloseLogger_End:
EPILOG
CloseLogger endp


