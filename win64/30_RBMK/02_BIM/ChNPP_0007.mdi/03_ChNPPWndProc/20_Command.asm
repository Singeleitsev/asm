wmChNPPCommand:

;switch (wParam)
cmp r8,IDM_BLACK
	jl lblChNPPCmdRet0
cmp r8,IDM_WHITE
	jg lblChNPPCmdRet0

;case IDM_BLACK :
;case IDM_RED :
;case IDM_GREEN :
;case IDM_BLUE :
;case IDM_WHITE :

;// Change the text color

Call2 GetWindowLongPtrA,hwnd,0
mov lpChNPPData,rax

;Spell64rax hwnd, szChNPPTitle, szGetWindow
;cmp lpGlobalData,rax
;jne errChNPPWndProc

Call1 GetMenu,s_hwndFrameChNPP
mov hMenu,rax

sub rsp,20h
mov rcx,hMenu
mov rax,lpChNPPData			     
mov rdx,qword ptr [rax]
mov r8,0 ;MF_UNCHECKED
call CheckMenuItem
add rsp,20h

;lpChNPPData->iColor = wParam
	mov rax,lpChNPPData
	mov r8,wParam
	mov qword ptr [rax],r8

sub rsp,20h
mov rcx,hMenu
mov rax,lpChNPPData			     
mov rdx,qword ptr [rax]
mov r8,8 ;MF_CHECKED
call CheckMenuItem
add rsp,20h

;lpChNPPData->clrText = clrTextArray[wParam - IDM_BLACK]
	mov r8,wParam
	sub r8,IDM_BLACK
	shl r8,3 ;mul r8, 8
	lea rax,s_clrTextArray
	add rax,r8
	mov rcx,qword ptr [rax]
	mov rax,lpChNPPData
	add rax,8 ;lpChNPPData->clrText
	mov qword ptr [rax],rcx

;ReDraw
	Call3 InvalidateRect,hwnd,0,0

lblChNPPCmdRet0:
	xor rax,rax
	jmp endChNPPWndProc

