wmSieveCommand:

;switch (wParam)
cmp r8,IDM_BLACK
	jl lblSieveCmdRet0
cmp r8,IDM_WHITE
	jg lblSieveCmdRet0

;case IDM_BLACK :
;case IDM_RED :
;case IDM_GREEN :
;case IDM_BLUE :
;case IDM_WHITE :

;// Change the text color

Call2 GetWindowLongPtrA,hwnd,0
mov lpSieveData,rax

;Spell64rax hwnd, szSieveTitle, szGetWindow
;cmp lpGlobalData,rax
;jne errSieveWndProc

Call1 GetMenu,s_hwndFrameChild[01]
mov hMenu,rax

mov rcx,hMenu
mov rax,lpSieveData			     
mov rdx,qword ptr [rax]
mov r8,0 ;MF_UNCHECKED
call CheckMenuItem

;lpSieveData->iColor = wParam
	mov rax,lpSieveData
	mov r8,wParam
	mov qword ptr [rax],r8

mov rcx,hMenu
mov rax,lpSieveData			     
mov rdx,qword ptr [rax]
mov r8,8 ;MF_CHECKED
call CheckMenuItem

;lpSieveData->clrText = clrTextArray[wParam - IDM_BLACK]
	mov r8,wParam
	sub r8,IDM_BLACK
	shl r8,3 ;mul r8, 8
	lea rax,s_clrTextArray
	add rax,r8
	mov rcx,qword ptr [rax]
	mov rax,lpSieveData
	add rax,8 ;lpSieveData->clrText
	mov qword ptr [rax],rcx

;ReDraw
	Call3 InvalidateRect,hwnd,0,0

lblSieveCmdRet0:
	xor rax,rax
	jmp endSieveWndProc

