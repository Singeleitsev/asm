CloseEnumProc proc hwnd:QWORD,lParam:QWORD

;Prologue
push rbp
mov rbp,rsp

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

;Store Parameters
mov hwnd,rcx
;mov lParam,r9 ;not used


mov rcx,hwnd
mov rdx,4 ;GW_OWNER
call GetWindow
cmp rax,0
jne endCloseEnumProc ;return 1;

mov rcx,hwnd
call GetParent

mov rcx,rax
mov rdx,223h ;WM_MDIRESTORE
mov r8,hwnd
xor r9,r9
call SendMessageA

;In Windows NT WM_QUERYENDSESSION can be sent only to the Frame Window
mov rcx,hwnd
mov rdx,11h ;WM_QUERYENDSESSION
xor r8,r8
xor r9,r9
call SendMessageA
cmp rax,0
je endCloseEnumProc ;return 1;

mov rcx,hwnd
call GetParent

mov rcx,rax
mov rdx,221h ;WM_MDIDESTROY
mov r8,hwnd
xor r9,r9
call SendMessageA

endCloseEnumProc: ;return 1;
mov rax,1

;Epilogue
leave
ret
CloseEnumProc endp
