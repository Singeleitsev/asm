;FetchThreads.asm
;-----------------------------------------------------------
; FetchThreads - called when menu item is clicked
;-----------------------------------------------------------
FetchThreads proc

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

call HttpGetWithAuth
test rax, rax
jz fetch_fail

;Show raw JSON in a message box (temporary, later will parse & display)
mov rcx,ghWndMain
mov rdx,rax
lea r8,szFetchSuccess
xor r9,r9 ;MB_OK
call MessageBoxA 
mov rcx,rax
call LocalFree
leave
ret

fetch_fail:
mov rcx,ghWndMain
lea rdx,szFetchFail
lea r8,szErr
xor r9,r9 ;MB_OK
call MessageBoxA
leave
ret
FetchThreads endp