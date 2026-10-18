WinMain proc

sub rsp,8
sub rsp,100h ;Frame

mov rcx,0
call GetModuleHandleA
mov wc.hInstance,rax

;Register Class
;Fill the  WNDCLASSEX64 Structure
 mov wc.cbSize,50h
 lea rax,WindowProc
 mov wc.lpfnWndProc,rax
 lea rax,_class
 mov wc.lpszClassName,rax
;Load Icon
 mov rcx,0
 mov rdx,7F00h ;hIcon = IDI_APPLICATION = 32512 = 7F00h
 call LoadIconA
 mov wc.hIcon,rax
;Load Cursor
 mov rcx,0
 mov rdx,7F00h ;hCursor = IDC_ARROW = 32512 = 7F00h
 call LoadCursorA
 mov wc.hCursor,rax
;Now call the Function
 lea rcx,wc
 call RegisterClassExA

;Create the Window
 mov rcx,0 ;dwExStyle
 lea rdx,_class
 lea r8,_title
 mov r9,16CF0000h ;dwStyle = WS_VISIBLE+WS_OVERLAPPEDWINDOW+WS_CLIPCHILDREN+WS_CLIPSIBLINGS = 16CF.0000h
 mov qword ptr [rsp+20h],10h ;x = 16
 mov qword ptr [rsp+28h],10h ;y = 16
 mov qword ptr [rsp+30h],1B0h ;nWidth = 432
 mov qword ptr [rsp+38h],1B0h ;nHeight = 432
 mov qword ptr [rsp+40h],0 ;hWndParent 
 mov qword ptr [rsp+48h],0 ;hMenu
 mov rax,wc.hInstance
 mov qword ptr [rsp+50h],rax
 mov qword ptr [rsp+58h],0
 call CreateWindowExA

;Store the Handle
;mov hWndMain,rax

msg_loop:
 lea rcx,msg
 xor rdx,rdx
 xor r8,r8
 xor r9,r9
 call GetMessageA
 cmp eax,1
 jb end_loop
 jne msg_loop
 lea rcx,msg
 call TranslateMessage
 lea rcx,msg
 call DispatchMessageA
 jmp msg_loop
end_loop:
 mov rcx,msg.wParam
 call ExitProcess

 add rsp,100h

WinMain endp
