wmHelloCommand:

;switch (wParam)
cmp r8,IDM_BLACK
	jl lblHelloCmdRet0
cmp r8,IDM_WHITE
	jg lblHelloCmdRet0

;case IDM_BLACK :
;case IDM_RED :
;case IDM_GREEN :
;case IDM_BLUE :
;case IDM_WHITE :

;// Change the text color

Call2 GetWindowLongPtrA,hwnd,0
mov lpHelloData,rax

;Spell64rax hwnd, szHelloTitle, szGetWindow
;cmp lpGlobalData,rax
;jne errHelloWndProc

Call1 GetMenu,s_hwndFrameH
mov hMenu,rax

sub rsp,20h
mov rcx,hMenu
mov rax,lpHelloData			     
mov rdx,qword ptr [rax]
mov r8,0 ;MF_UNCHECKED
call CheckMenuItem
add rsp,20h

;lpHelloData->iColor = wParam
	mov rax,lpHelloData
	mov r8,wParam
	mov qword ptr [rax],r8

sub rsp,20h
mov rcx,hMenu
mov rax,lpHelloData			     
mov rdx,qword ptr [rax]
mov r8,8 ;MF_CHECKED
call CheckMenuItem
add rsp,20h

;lpHelloData->clrText = clrTextArray[wParam - IDM_BLACK]
	mov r8,wParam
	sub r8,IDM_BLACK
	shl r8,3 ;mul r8, 8
	lea rax,s_clrTextArray
	add rax,r8
	mov rcx,qword ptr [rax]
	mov rax,lpHelloData
	add rax,8 ;lpHelloData->clrText
	mov qword ptr [rax],rcx

;ReDraw
	Call3 InvalidateRect,hwnd,0,0

lblHelloCmdRet0:
	xor rax,rax
	jmp endHelloWndProc

