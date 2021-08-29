CloseEnumProc proc hwnd:QWORD,lParam:QWORD
;Assembler will add this prologue automatically:
        ;push rbp
        ;mov rbp,rsp

;Align the Stack by 10h
        and rsp,-16
;Store Parameters
        mov hwnd,rcx
        ;mov lParam,r9 ;not used

Call2 GetWindow,hwnd,4 ;GW_OWNER
cmp rax,0
jne endCloseEnumProc ;return 1;

Call1 GetParent,hwnd
;WM_MDIRESTORE = 223h
Call4 SendMessageA,rax,223h,hwnd,0

;WM_QUERYENDSESSION = 11h
;In Windows NT WM_QUERYENDSESSION
;can be sent only to the Frame Window
Call4 SendMessageA,hwnd,11h,0,0
cmp rax,0
je endCloseEnumProc ;return 1;

;WM_MDIDESTROY = 221h
Call1 GetParent,hwnd
Call4 SendMessageA,rax,221h,hwnd,0

endCloseEnumProc: ;return 1;
mov rax,1

;Assembler will add this epilogue automatically:
        ;leave
        ret ;8h
CloseEnumProc endp
