;============================================================
MenuProc proc hWnd:QWORD,uMsg:QWORD,wParam:QWORD,lParam:QWORD
;============================================================
;This Procedure has parameters hence Assembler WILL add following instructions here:
	;push rbp ;<-- ;sub rsp,8
	;mov rbp,rsp ;<--
;Align the Stack by 10h
	and rsp,-16
	sub rsp,80h

;Store Values retrieved by DispatchMessageA:
	mov hWnd,rcx
	;mov uMsg,rdx
	mov wParam,r8
	;mov lParam,r9

	cmp r8,IDM_DRAWTEXT	
		je idmdrawtext
	cmp r8,IDM_TEXTOUT	
		je idmtextout
	cmp r8,IDM_LENGTH
		je idmlength
	cmp r8,IDM_RECTANGLE
		je idmrectangle
	cmp r8,IDM_PEACOCK
		je idmpeacock
	cmp r8, IDM_LACES
		je idmlaces
	cmp r8,IDM_ABOUT
		je idmabout
	jmp mnuexit

idmdrawtext:
	nop
	jmp mnuexit

idmtextout:
	nop
	jmp mnuexit

idmlength:
;Call Dialog
	mov rcx,hInst ;hInstance
	lea rdx,szDialog1Name ;lpTemplateName
	mov r8,hWnd ;hWndParent
	lea r9,Dialog1Proc ;lpDialogFunc
	mov qword ptr [rsp+20h],0 ;dwInitParam
	call DialogBoxParamA
cmp rax,0
je mnuexit
;Set Start Point
	mov rcx,hDC
	mov rdx,X_start
	mov r8,Y_start
	xor r9,r9
	call MoveToEx
;Draw Line
	mov rcx,hDC
	mov rdx,X_end
	mov r8,Y_end
	call LineTo
;Force WM_PAINT message by invalidating Screen Rect
	mov rcx,hWnd
	xor rdx,rdx
	xor r8,r8
	call InvalidateRect
	jmp mnuexit

idmrectangle:
;Call Dialog
	mov rcx,hInst ;hInstance
	lea rdx,szDialog2Name ;lpTemplateName
	mov r8,hWnd ;hWndParent
	lea r9,Dialog2Proc ;lpDialogFunc
	mov qword ptr [rsp+20h],0 ;dwInitParam
	call DialogBoxParamA
cmp rax,0
je mnuexit
;Draw Rectangle
	mov rcx,hDC
	mov rdx,X_start
	mov r8,Y_start
	mov r9,X_end
	mov rax,Y_end	
	mov qword ptr [rsp+20h],rax
	call Rectangle
;Force WM_PAINT message by invalidating Screen Rect
	mov rcx,hWnd
	xor rdx,rdx
	xor r8,r8
	call InvalidateRect
	jmp mnuexit

idmpeacock:
	nop
	jmp mnuexit

idmlaces:
	nop
	jmp mnuexit

idmabout:
;Call Dialog
	mov rcx,hInst ;hInstance
	lea rdx,szDialog3Name ;lpTemplateName
	mov r8,hWnd ;hWndParent
	lea r9,Dialog3Proc ;lpDialogFunc
	mov qword ptr [rsp+20h],0 ;dwInitParam
	call DialogBoxParamA
	jmp mnuexit

mnuexit:
	xor rax,rax
	ret
MenuProc endp

