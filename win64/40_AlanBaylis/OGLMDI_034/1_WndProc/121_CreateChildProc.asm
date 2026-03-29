CreateChild proc bType:QWORD

LOCAL lpChildStruct:QWORD

;Since the Proc has parameters
;Assembler will add this prologue automatically:
;push rbp
;mov rbp,rsp

;Stack Usage: 8(return address)+8(parameters)+8(push)+8(locals) = 18h

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

;If the number of children hasn't reached the maximum
mov al,g_iNumChild
cmp al,g_iMaxChild
jl lbl_CreateChild_Start

;Otherwise break out of the routine
jmp lbl_ChildrenOverflow_Err ;The number of children has reached the maximum

lbl_CreateChild_Start:
inc g_iNumChild ;Increment the number of children

;Store CreateChildProc Parameters
mov bType,rcx
cmp rcx,CHILD_TYPE_TOP
je lbl_CreateChild_Top
cmp rcx,CHILD_TYPE_FRONT
je lbl_CreateChild_Front
cmp rcx,CHILD_TYPE_LEFT
je lbl_CreateChild_Left
cmp rcx,CHILD_TYPE_3D
je lbl_CreateChild_3D
jmp lbl_ChildType_Err

lbl_CreateChild_Top:
lea rdx,g_szChild2DClassName
lea r8,szWindowTitleTop
jmp lbl_CreateChild_ClearStruct

lbl_CreateChild_Front:
lea rdx,g_szChild2DClassName
lea r8,szWindowTitleFront
jmp lbl_CreateChild_ClearStruct

lbl_CreateChild_Left:
lea r8,szWindowTitleLeft
lea rdx,g_szChild2DClassName
jmp lbl_CreateChild_ClearStruct

lbl_CreateChild_3D:
lea rdx,g_szChild3DClassName
lea r8,szWindowTitle3D

lbl_CreateChild_ClearStruct:
;ZeroMemory(&cs, sizeof(CREATESTRUCT));
cld
xor rax,rax
lea rdi,csa
mov rcx,50h ;SizeOf CREATESTRUCT
rep stosb

mov rcx,40h ;WS_EX_MDICHILD
;lea rdx,g_szChild3DClassName
;lea r8,szWindowTitle
mov r9,50cf0000h ;WS_CHILD | WS_VISIBLE | WS_OVERLAPPEDWINDOW
mov rax,80000000 ;CW_USEDEFAULT
mov qword ptr[rsp+20h],rax
mov qword ptr[rsp+28h],rax
mov qword ptr[rsp+30h],rax
mov qword ptr[rsp+38h],rax
mov rax,g_hMDIClient
mov qword ptr[rsp+40h],rax
mov qword ptr[rsp+48h],0
mov rax,g_hInst
mov qword ptr[rsp+50h],rax
lea rax,csa ;CREATESTRUCT64
mov qword ptr[rsp+58h],rax
Call CreateWindowExA
;mov hChild,rax
cmp rax,0 ;hChild
je lbl_CreateChild_Err

;Save child window handle
xor rbx,rbx ;Use rbx. Keep unchanged rax = hChild
mov bl,g_iNumChild
dec bl
imul bx,30h ;index * SizeOf CHILD64
lea rdi,g_child
add rdi,rbx
mov lpChildStruct,rdi
mov qword ptr[rdi],rax ;g_child[g_iNumChild - 1].hWnd = hChild

;Set child window device context
mov rcx,rax ;hChild
Call GetDC
xor rbx,rbx
mov ebx,eax
mov rdi,lpChildStruct
mov qword ptr[rdi+8],rbx ;hDC

;Set child window type
mov rax,bType
mov byte ptr[rdi+18h],al

;ZeroMemory(&pfd, sizeof(pfd));
cld
xor rax,rax
lea rdi,pfd
mov rcx,28h ;SizeOf pfd
rep stosb

mov pfd.nSize,28h ;sizeof pfd
mov pfd.nVersion,1
mov pfd.dwFlags,25h ;PFD_DRAW_TO_WINDOW | PFD_SUPPORT_OPENGL | PFD_DOUBLEBUFFER
mov pfd.iPixelType,0 ;PFD_TYPE_RGBA
mov pfd.cColorBits,24
mov pfd.cDepthBits,16
mov pfd.iLayerType,0 ;PFD_MAIN_PLANE

mov rsi,lpChildStruct
mov rcx,qword ptr[rsi+8] ;hDC
lea rdx,pfd
Call ChoosePixelFormat

mov rsi,lpChildStruct
mov rcx,qword ptr[rsi+8] ;hDC
lea rdx,pfd
mov r8,rax ;iFormat retrieved from ChoosePixelFormat
Call SetPixelFormat

mov rsi,lpChildStruct
mov rcx,qword ptr[rsi+8] ;hDC
Call wglCreateContext
mov rdi,lpChildStruct
mov qword ptr[rdi+10h],rax ;hRC

mov rsi,lpChildStruct
mov rcx,qword ptr[rsi+8] ;hDC
mov rdx,qword ptr[rsi+10h] ;hRC
Call wglMakeCurrent

Call InitGL

include 192_ChildErrors.asm

lbl_CreateChild_End:
add rsp,100h
;Since the Proc has parameters
;Assembler will add this epilogue automatically:
;leave
ret
CreateChild endp

