;90_LoggerProc.asm



InitLogger proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer
    
lea rcx,szLogFileName
mov rdx,40000000h ;GENERIC_WRITE
mov r8,1 ;FILE_SHARE_READ
xor r9,r9 ;NULL
mov qword ptr [rsp+20h],2 ;OPEN_ALWAYS
mov qword ptr [rsp+28h],80h ;FILE_ATTRIBUTE_NORMAL
xor rax,rax
mov qword ptr [rsp+30h],rax
call CreateFileA
cmp rax,-1
je lbl_InitLogger_End
test rax,rax
jz lbl_InitLogger_Error
mov ghLogFile,rax

LOG_TEXT szLogInit

jmp lbl_InitLogger_End

lbl_InitLogger_Error:
mov rcx,ghWndMain
lea rdx,szErrInitLogger
lea r8,szErr
xor r9,r9 ;MB_OK = 0
Call MessageBoxA

lbl_InitLogger_End:
leave
ret
InitLogger endp



WriteLog proc pszText:QWORD

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov pszText,rcx
cmp pszText,0
je lbl_WriteLog_Error

;Clean the Counter
mov dwBytesWritten,0

;mov rcx,pszText
call lstrlenA
test rax,rax
jz lbl_WriteLog_Error
mov r8,rax ;nNumberOfBytesToWrite = lenText

mov rcx,ghLogFile
mov rdx,pszText
;mov r8,lenText
lea r9,dwBytesWritten
mov qword ptr [rsp+20h],0 ;lpOverlapped
call WriteFile

jmp lbl_WriteLog_End

lbl_WriteLog_Error:
mov rcx,ghWndMain
lea rdx,szErrWriteLog
lea r8,szErr
xor r9,r9 ;MB_OK = 0
Call MessageBoxA

lbl_WriteLog_End:
mov rax,dwBytesWritten
leave
ret
WriteLog endp



CloseLogger proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer
    
mov rcx,ghLogFile
test rcx,rcx
jz lbl_CloseLogger_End
call CloseHandle
mov ghLogFile,0

lbl_CloseLogger_End:
leave
ret
CloseLogger endp

