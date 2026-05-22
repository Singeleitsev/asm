;HttpGetWithAuth.asm
;-----------------------------------------------------------
; HttpGetWithAuth - GET request with API key header
; Returns: allocated buffer with response (caller frees with LocalFree)
;          or NULL on failure
;-----------------------------------------------------------
HttpGetWithAuth proc

    local hInet:QWORD, hConnect:QWORD, hRequest:QWORD
    local lpBuffer:QWORD
    local dwBuffer:DWORD, dwTotalRead:DWORD, dwBytesRead:DWORD

;Prologue:
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

lea rcx,szAgent
mov rdx,1 ;INTERNET_OPEN_TYPE_DIRECT
xor r8,r8 ;lpszProxy
xor r9,r9 ;lpszProxyBypass
mov qword ptr [rsp+20h],0 ;dwFlags
call InternetOpenA
test rax,rax
jz http_fail
mov hInet,rax

mov rcx,rax ;hInet
lea rdx,szHost ;lpszServerName = "wasm.in"
mov r8,1BBh ;nServerPort = 443
;lea r9,szUserName ;lpszUserName = "ml64"
xor r9,r9
;lea rax,szPassword
;mov qword ptr [rsp+20h],rax ;lpszPassword
mov qword ptr [rsp+20h],0 ;lpszPassword
mov qword ptr [rsp+28h],3 ;INTERNET_SERVICE_HTTP
mov qword ptr [rsp+30h],0 ;dwFlags
mov qword ptr [rsp+38h],0 ;dwContext
call InternetConnectA
test rax,rax
jz http_close_inet
mov hConnect,rax

mov rcx,rax ;hConnect
lea rdx,szVerb ;"GET"
lea r8,szApiUrl ;lpszObjectName ("/api/threads")
xor r9,r9 ;lpszVersion (NULL = HTTP/1.1)
mov qword ptr [rsp+20h],0 ;lpszReferrer
mov qword ptr [rsp+28h],0 ;lplpszAcceptTypes
mov dword ptr [rsp+30h],800000h  ;dwFlags = INTERNET_FLAG_SECURE
mov qword ptr [rsp+38h],0 ;dwContext
call HttpOpenRequestA
test rax,rax
jz http_close_connect
mov hRequest,rax

mov rcx,rax ;hRequest
lea rdx, szApiKeyHeader
mov r8,-1 ;dwHeadersLength (-1 = null-terminated string)
xor r9,r9 ;lpOptional
mov qword ptr [rsp+20h],0 ;dwOptionalLength
call HttpSendRequestA
test rax, rax
jz http_close_request

;Read response into dynamically growing buffer
mov dwBuffer,1000h ;4096
xor rcx,rcx ;LMEM_FIXED = 0
xor rdx,rdx
mov edx,dwBuffer ;uBytes
call LocalAlloc
test rax,rax
jz http_close_request
mov lpBuffer,rax
mov dwTotalRead,0

http_read_loop:
mov rcx,hRequest ;hFile
mov rdx,lpBuffer ;lpBuffer
add edx,dwTotalRead
xor r8,r8
mov r8d,dwBuffer ;dwNumberOfBytesToRead
sub r8d,dwTotalRead
lea r9,dwBytesRead ;lpdwNumberOfBytesRead
call InternetReadFile
test rax,rax
jz http_read_error
cmp dwBytesRead,0
je http_read_done
mov eax,dwBytesRead
add dwTotalRead,eax

xor rax,rax
mov eax,dwTotalRead
add eax,1000h ;4096
cmp eax,dwBuffer
jl http_read_loop
mov rcx,lpBuffer
xor rdx,rdx
mov edx,dwBuffer
add edx,1000h ;new size = dwBuffer + 4096
mov r8,0 ;LMEM_FIXED
call LocalReAlloc
test rax, rax
jz http_read_error
mov lpBuffer,rax
add dwBuffer,1000h ;4096
jmp http_read_loop

http_read_error:
mov rcx,lpBuffer
call LocalFree
xor rax,rax
jmp http_cleanup

http_read_done:
;null-terminate
mov rcx,lpBuffer
add ecx,dwTotalRead
mov byte ptr[rcx],0
mov rax,lpBuffer

http_cleanup:
mov rcx,hRequest
call InternetCloseHandle

http_close_request:
mov rcx,hConnect
call InternetCloseHandle

http_close_connect:
mov rcx,hInet
call InternetCloseHandle

http_close_inet:

http_fail:
leave
ret
HttpGetWithAuth endp