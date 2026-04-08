lbl_CreateChild:

;If the number of children reached the maximum
movzx rax,g_iNumChild
cmp al,g_iMaxChild
jae lbl_ChildrenOverflow_Err

;Locate the g_child structure
movzx rax,g_iNumChild
imul eax,30h ;index * SizeOf CHILD64
lea rdi,g_child
add rdi,rax
mov lpChildStruct,rdi

;ZeroMemory(&g_child[i], sizeof(CHILD64));
cld
xor rax,rax
mov rdi,lpChildStruct
mov rcx,6 ;30h bytes = 6 qwords
rep stosq

;Compute childID
movzx rax,g_iNumChild
add rax,ID_MDI_FIRSTCHILD ;3000h+g_iNumChild
mov childID,rax

;ZeroMemory(&cs, sizeof(CREATESTRUCT));
cld
xor rax,rax
lea rdi,csa ;CREATESTRUCT64
mov rcx,0Ah ;50h bytes = 0Ah qwords
rep stosq

;ReStore child window type
xor rcx,rcx
mov ecx,bType
mov rdi,lpChildStruct
mov byte ptr[rdi+28h],cl

;Store CreateChildProc Parameters
cmp rcx,CHILD_TYPE_TOP
je lbl_CreateChild_Top
cmp rcx,CHILD_TYPE_FRONT
je lbl_CreateChild_Front
cmp rcx,CHILD_TYPE_LEFT
je lbl_CreateChild_Left
cmp rcx,CHILD_TYPE_3D
je lbl_CreateChild_3D

;None of the above
jmp lbl_ChildType_Err

lbl_CreateChild_Top:
lea rdx,szChild2DClassName
lea r8,szWindowTitleTop
jmp lbl_CreateChild_Go

lbl_CreateChild_Front:
lea rdx,szChild2DClassName
lea r8,szWindowTitleFront
jmp lbl_CreateChild_Go

lbl_CreateChild_Left:
lea rdx,szChild2DClassName
lea r8,szWindowTitleLeft
jmp lbl_CreateChild_Go

lbl_CreateChild_3D:
lea rdx,szChild3DClassName
lea r8,szWindowTitle3D
;jmp lbl_CreateChild_Go

lbl_CreateChild_Go:
mov rcx,40h ;WS_EX_MDICHILD
;lea rdx,g_szChildClassName
;lea r8,szWindowTitle
mov r9,56cf0000h ;WS_CHILD|WS_VISIBLE|WS_OVERLAPPEDWINDOW+WS_CLIPCHILDREN+WS_CLIPSIBLINGS
mov rax,80000000h ;CW_USEDEFAULT
mov qword ptr[rsp+20h],rax
mov qword ptr[rsp+28h],rax
mov qword ptr[rsp+30h],rax
mov qword ptr[rsp+38h],rax
mov rax,g_hMDIClient
mov qword ptr[rsp+40h],rax
mov rax,childID
mov qword ptr[rsp+48h],rax
mov rax,g_hInst
mov qword ptr[rsp+50h],rax
lea rax,csa ;CREATESTRUCT64
mov qword ptr[rsp+58h],rax
Call CreateWindowExA
;mov hChild,rax
cmp rax,0 ;hChild
je lbl_CreateChild_Err
;Save child window handle
mov rdi,lpChildStruct
mov qword ptr[rdi],rax ;g_child[g_iNumChild].hWnd = hChild

;Set child window device context
;mov rcx,rax ;hChild
mov rdi,lpChildStruct
mov rcx,qword ptr[rdi] ;hChild
Call GetDC
cmp rax,0
je lbl_CreateChild_DC_Err
mov rdi,lpChildStruct
mov qword ptr[rdi+8],rax ;hDC

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

mov rdi,lpChildStruct
mov rcx,qword ptr[rdi+8] ;hDC
lea rdx,pfd
Call ChoosePixelFormat

mov rdi,lpChildStruct
mov rcx,qword ptr[rdi+8] ;hDC
mov rdx,rax ;iFormat retrieved from ChoosePixelFormat
lea r8,pfd
Call SetPixelFormat

mov rdi,lpChildStruct
mov rcx,qword ptr[rdi+8] ;hDC
Call wglCreateContext
cmp rax,0
je lbl_CreateChild_RC_Err
mov rdi,lpChildStruct
mov qword ptr[rdi+10h],rax ;hRC

mov rdi,lpChildStruct
mov rcx,qword ptr[rdi+8] ;hDC
mov rdx,qword ptr[rdi+10h] ;hRC
Call wglMakeCurrent
cmp rax,0
je lbl_CreateChild_MakeCurrent_Err

include 13_InitGL.asm
Call SetTextures

;Increment the number of children
inc g_iNumChild
jmp lbl_WndProc_Return0

