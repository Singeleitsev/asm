wmChNPPPaint:

sub rsp,20h
mov rcx,hwnd
lea rdx,ps
call BeginPaint
mov hdc,rax
add rsp,20h

Call2 GetWindowLongPtrA,hwnd,0
mov lpChNPPData,rax

;Spell64rax hwnd, szFrameTitle, szGetWindow
;cmp rax,lpGlobalData
;jne errChNPPWndProc

;SetTextColor (hdc, lpChNPPData->clrText);
sub rsp,20h
mov rcx,hdc
mov rax,lpChNPPData
mov rdx,qword ptr [rax+8] ;lpChNPPData.clrText
call SetTextColor
add rsp,20h

sub rsp,20h
mov rcx,hwnd
lea rdx,rect
call GetClientRect
add rsp,20h

sub rsp,20h
mov rcx,hdc
lea rdx,szChNPPTitle ;"ChNPP - Chernobyl Nuclear Power Plant"
mov r8,-1
lea r9,rect
mov qword ptr [rsp+20h],25h ;DT_SINGLELINE + DT_CENTER + DT_VCENTER = 25h
call DrawTextA
add rsp,20h

sub rsp,20h
mov rcx,hwnd
lea rdx,ps
call EndPaint
add rsp,20h

xor rax,rax
jmp endChNPPWndProc



