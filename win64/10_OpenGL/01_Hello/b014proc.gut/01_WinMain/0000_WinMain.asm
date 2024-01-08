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

;Enter the Loop
lblWinMainLoop:
sub rsp,30h
lea rcx,msg ;lpMsg
xor rdx,rdx ;All window messages and thread messages are processed
xor r8,r8 ;Return all available messages (no range filtering)
xor r9,r9 ;Return all available messages (no range filtering)
mov qword ptr [rsp+20h],1 ;PM_REMOVE Messages are removed from the queue after processing
call PeekMessageA
add rsp,30h

cmp rax,0
je lblWinMainReDraw

cmp msg.message,12h ;WM_QUIT
je lblWinMainEnd

lblWinMainProceedMessage:
sub rsp,20h
lea rcx,msg ;lpMsg
call TranslateMessage
lea rcx,msg ;lpMsg
call DispatchMessageA
add rsp,20h
jmp lblWinMainLoop

lblWinMainReDraw:
sub rsp,20h
call DrawGLScene
add rsp,20h
jmp lblWinMainLoop

lblWinMainEnd:
sub rsp,20h
xor rcx,rcx
call ExitProcess
add rsp,20h

WinMain endp
