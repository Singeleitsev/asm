wmChild0Paint:

mov rcx,hwnd
lea rdx,ps
call BeginPaint
mov hdc,rax

mov rcx,hwnd
xor rdx,rdx
call GetWindowLongPtrA
mov lpChild0Data,rax

;Spell64rax hwnd, szFrameTitle, szGetWindow
;cmp rax,lpGlobalData
;jne errChild0WndProc

;SetTextColor (hdc, lpChild0Data->clrText);
mov rcx,hdc
mov rax,lpChild0Data
mov rdx,qword ptr [rax+8] ;lpChild0Data.clrText
call SetTextColor

mov rcx,hwnd
lea rdx,rect
call GetClientRect

mov rcx,hdc
lea rdx,szTitleChild0
mov r8,-1
lea r9,rect
mov qword ptr [rsp+20h],25h ;DT_SINGLELINE + DT_CENTER + DT_VCENTER = 25h
call DrawTextA

mov rcx,hwnd
lea rdx,ps
call EndPaint

xor rax,rax
jmp endChild0WndProc



