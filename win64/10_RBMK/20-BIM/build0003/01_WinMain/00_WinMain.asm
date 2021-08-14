WinMain proc

sub rsp,8

sub rsp,20h
mov rcx,0
call GetModuleHandleA
add rsp,20h
mov wc.hInstance,rax

;Register Class
;Fill the  WNDCLASSEX64 Structure
 mov wc.cbSize,50h
 mov wc.style,3 ;CS_HREDRAW | CS_VREDRAW ;<---
 lea rax,WindowProc
 mov wc.lpfnWndProc,rax
 lea rax,_class
 mov wc.lpszClassName,rax
;Load Icon
 sub rsp,20h
 mov rcx,0
 mov rdx,7F00h ;hIcon = IDI_APPLICATION = 32512 = 7F00h
 call LoadIconA
 add rsp,20h
 mov wc.hIcon,rax
;Load Cursor
 sub rsp,20h
 mov rcx,0
 mov rdx,7F00h ;hCursor = IDC_ARROW = 32512 = 7F00h
 call LoadCursorA
 add rsp,20h
 mov wc.hCursor,rax
;Now call the Function
 sub rsp,20h
 lea rcx,wc
 call RegisterClassExA
 add rsp,20h

;Create the Window
 sub rsp,60h
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
 add rsp,60h

;Store the Handle
;mov hWndMain,rax

msg_loop:
 sub rsp,20h
 lea rcx,msg
 mov rdx,0
 mov r8,0
 mov r9,0
 call GetMessageA
 add rsp,20h
 cmp eax,1
 jb end_loop
 jne msg_loop
 sub rsp,20h
 lea rcx,msg
 call TranslateMessage
 add rsp,20h
 sub rsp,20h
 lea rcx,msg
 call DispatchMessageA
 add rsp,20h
 jmp msg_loop
end_loop:
 sub rsp,20h
 mov rcx,msg.wParam
 call ExitProcess
 add rsp,20h

WinMain endp
