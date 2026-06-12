LoadShader proc pszFileName:QWORD, pdwSize:QWORD, pszLog:QWORD, pgpBuffer:QWORD
local hFile:QWORD, dwRead:QWORD

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

mov pszFileName,rcx
mov pdwSize,rdx
mov pszLog,r8
mov pgpBuffer,r9

;LOG_TEXT szLog
mov rcx,r8
call WriteLog

;Open file
mov rcx,pszFileName
mov rdx,80000000h ;GENERIC_READ
mov r8,1 ;FILE_SHARE_READ
xor r9,r9 ;lpSecurityAttributes
mov qword ptr [rsp+20h],3 ;OPEN_EXISTING
mov qword ptr [rsp+28h],0 ;dwFlagsAndAttributes
mov qword ptr [rsp+30h],0; hTemplateFile
call CreateFileA
cmp rax,-1
je lbl_LoadShader_WinError
mov hFile,rax

;Get file size
mov rcx,hFile
xor rdx,rdx
xor r8,r8
call GetFileSize
test rax,rax
jz lbl_LoadShader_Error_Close
mov rdi,pdwSize
mov qword ptr[rdi],rax

;Allocate heap memory
call GetProcessHeap
test rax,rax
jz lbl_LoadShader_Error_Close
mov rcx,rax
mov rdx,8 ;HEAP_ZERO_MEMORY
mov rsi,pdwSize
mov r8,qword ptr[rsi]
call HeapAlloc
test rax,rax
jz lbl_LoadShader_Error_Close
mov rdi,pgpBuffer
mov qword ptr[rdi],rax

;Read file
mov rcx,hFile
mov rdi,pgpBuffer
mov rdx,qword ptr[rdi]
mov rsi,pdwSize
mov r8,qword ptr[rsi]
lea r9,dwRead
mov qword ptr[rsp+20h],0
call ReadFile
test rax,rax
jz lbl_LoadShader_Error_Free_Close

;Close file
mov rcx,hFile
call CloseHandle

;Success
LOG_TEXT szOK
jmp lbl_LoadShader_End

lbl_LoadShader_Error_Free_Close:
mov rsi,pgpBuffer
mov rcx,qword ptr[rsi]
call HeapFree
jmp lbl_LoadShader_WinError

lbl_LoadShader_Error_Close:
mov rcx,hFile
call CloseHandle

lbl_LoadShader_WinError:
call SpellWinError

lbl_LoadShader_End:
;Epilogue
leave
ret
LoadShader endp
