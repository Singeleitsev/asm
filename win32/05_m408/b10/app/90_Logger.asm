InitLogger proc
    
push 0 ;hTemplateFile
push 80h ;dwFlagsAndAttributes = FILE_ATTRIBUTE_NORMAL
push 2 ;dwCreationDisposition = CREATE_ALWAYS
;push 4 ;dwCreationDisposition = OPEN_ALWAYS
push 0 ;lpSecurityAttributes
push 1 ;dwShareMode = FILE_SHARE_READ
push 40000000h ;dwDesiredAccess = GENERIC_WRITE
push offset szLogFileName
call CreateFileA
cmp eax,-1
je InitLogger_Error
test eax,eax
jz InitLogger_Error
mov ghLogFile,eax

LOG_TEXT szLogInit

jmp InitLogger_End

InitLogger_Error:
push 0 ;MB_OK
push offset szError
push offset szErrInitLogger
push ghWnd
call MessageBoxA

InitLogger_End:
ret
InitLogger endp



WriteLog proc pszText:DWORD

;Clean the Counter
mov dwBytesWritten,0

cmp pszText,0
je WriteLog_Error

invoke lstrlenA,pszText
test eax,eax
jz WriteLog_Error
;mov lenText,eax

push 0 ;lpOverlapped
push offset dwBytesWritten
push eax ;nNumberOfBytesToWrite received from lstrlenA
push pszText
push ghLogFile
call WriteFile
test eax,eax
jz WriteLog_Error

jmp WriteLog_End

WriteLog_Error:
push 0 ;MB_OK
push offset szError
push offset szErrWriteLog
push ghWnd
call MessageBoxA

WriteLog_End:
mov eax,dwBytesWritten
ret
WriteLog endp



CloseLogger proc

cmp ghLogFile,0
je CloseLogger_End

invoke CloseHandle,ghLogFile
mov ghLogFile,0

CloseLogger_End:
ret
CloseLogger endp


