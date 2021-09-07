wmR2Command:

;switch (wParam)
cmp r8,IDM_BLACK
	jl lblR2CmdRet0
cmp r8,IDM_WHITE
	jg lblR2CmdRet0

;case IDM_BLACK :
;case IDM_RED :
;case IDM_GREEN :
;case IDM_BLUE :
;case IDM_WHITE :

;// Change the text color

Call2 GetWindowLongPtrA,hwnd,0
mov lpR2Data,rax

;Spell64rax hwnd, szR2Title, szGetWindow
;cmp lpGlobalData,rax
;jne errR2WndProc

Call1 GetMenu,s_hwndFrameH
mov hMenu,rax

mov rcx,hMenu
mov rax,lpR2Data			     
mov rdx,qword ptr [rax]
mov r8,0 ;MF_UNCHECKED
call CheckMenuItem

;lpR2Data->iColor = wParam
	mov rax,lpR2Data
	mov r8,wParam
	mov qword ptr [rax],r8

mov rcx,hMenu
mov rax,lpR2Data			     
mov rdx,qword ptr [rax]
mov r8,8 ;MF_CHECKED
call CheckMenuItem

;lpR2Data->clrText = clrTextArray[wParam - IDM_BLACK]
	mov r8,wParam
	sub r8,IDM_BLACK
	shl r8,3 ;mul r8, 8
	lea rax,s_clrTextArray
	add rax,r8
	mov rcx,qword ptr [rax]
	mov rax,lpR2Data
	add rax,8 ;lpR2Data->clrText
	mov qword ptr [rax],rcx

;ReDraw
	Call3 InvalidateRect,hwnd,0,0

lblR2CmdRet0:
	xor rax,rax
	jmp endR2WndProc

