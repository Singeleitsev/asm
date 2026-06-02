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
jz lbl_InitLogger_End
mov ghLogFile,rax
    
lea rcx,szLogInit
call WriteLog

lbl_InitLogger_End:
leave
ret
InitLogger endp



WriteLog proc
LOCAL pszText:QWORD
LOCAL dwWritten:QWORD

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

test rcx,rcx
jz lbl_WriteLog_End
mov pszText,rcx

;mov rcx,pszText
call lstrlenA
test rax,rax
jz lbl_WriteLog_End
mov r8,rax ;Bytes to Write

mov rcx,ghLogFile
mov rdx,pszText
;mov r8,rax ;Bytes to Write
lea r9,dwWritten
mov qword ptr [rsp+30h],0 ;lpOverlapped
;call WriteFile

;Caret Return
mov rcx,ghLogFile
lea rdx,szCRLF
mov r8,2
lea r9,dwWritten
mov qword ptr [rsp+30h],0 ;lpOverlapped
;call WriteFile

lbl_WriteLog_End:

mov rcx,ghWndMain
mov rdx,pszText
lea r8,szErr
xor r9,r9 ;MB_OK = 0
Call MessageBoxA

leave
ret
WriteLog endp




WriteLogNumber proc dwNumber:QWORD

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer
    
    ; Конвертируем число в строку (простой hex)
    mov rax, dwNumber
    lea rdi, szLogBuffer
    mov rcx, 8
    
    ; Заполняем нулями
    push rcx
    mov rcx, 16
    xor al, al
    rep stosb
    pop rcx
    
    ; Конвертируем в hex
    lea rdi, szLogBuffer
    add rdi, 15
    mov rsi, rcx
    
next_digit:
    mov rbx, rax
    and rbx, 0Fh
    cmp rbx, 9
    jg letter
    add rbx, '0'
    jmp store
letter:
    add rbx, 'A' - 10
store:
    mov byte ptr [rdi], bl
    dec rdi
    shr rax, 4
    dec rsi
    jnz next_digit
    
    ; Пишем "0x" + hex
    push rdi
    lea rcx, szHexPrefix
    call WriteLog
    pop rcx
    lea rcx, szLogBuffer
    call WriteLog
    
    leave
    ret
WriteLogNumber endp



CloseLogger proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer
    
mov rcx,ghLogFile
test rcx, rcx
jz lbl_CloseLogger_End
call CloseHandle
mov ghLogFile,0

lbl_CloseLogger_End:
leave
ret
CloseLogger endp

