wmChild0Command:

;switch (wParam)
cmp r8w,IDM_VIEW_BLACK
jl lblChild0CmdRet0
cmp r8w,IDM_VIEW_WHITE
jg lblChild0CmdRet0

;Change the text color
mov rcx,hwnd
xor rdx,rdx
call GetWindowLongPtrA
mov lpChild0Data,rax

mov rcx,g_hMenuChild0
mov rax,lpChild0Data			     
mov rdx,qword ptr[rax]
mov r8,0 ;MF_UNCHECKED
call CheckMenuItem

;lpChild0Data->iColor = wParam
mov rax,lpChild0Data
mov r8,wParam
mov qword ptr[rax],r8

mov rcx,g_hMenuChild0
mov rax,lpChild0Data			     
mov rdx,qword ptr[rax]
mov r8,8 ;MF_CHECKED
call CheckMenuItem

;lpChild0Data->clrText = clrTextArray[wParam - IDM_BLACK]
mov r8,wParam
sub r8,IDM_VIEW_BLACK
shl r8,3 ;mul r8,8
lea rax,rgbBlack
add rax,r8
mov rcx,qword ptr[rax]
mov rax,lpChild0Data
add rax,8 ;lpChild0Data->clrText
mov qword ptr[rax],rcx

;ReDraw
mov rcx,hwnd
xor rdx,rdx
xor r8,r8
call InvalidateRect

lblChild0CmdRet0:
xor rax,rax
jmp endChild0WndProc


