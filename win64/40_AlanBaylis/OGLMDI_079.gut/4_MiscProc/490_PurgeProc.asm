ChildStructPurge proc lpChildStruct:QWORD

;Prologue
push rbp
mov rbp,rsp

and rsp,-16 ;Align the Stack
sub rsp,100h ;Create the Buffer

;Store the Parameter
mov lpChildStruct,rcx

xor rcx,rcx
xor rdx,rdx
Call wglMakeCurrent

mov rsi,lpChildStruct
mov rcx,qword ptr[rsi+10h] ;hRC
Call wglDeleteContext

mov rsi,lpChildStruct
mov rcx,qword ptr[rsi] ;hWnd
mov rdx,qword ptr[rsi+8] ;hDC
Call ReleaseDC

mov rsi,lpChildStruct
movzx rbx,byte ptr[rsi+29h] ;iThisChild
cmp bl,7
jg lbl_ChildStructPurge_End
je lbl_ChildStructPurge_Dec ;Shift only if iThisChild < 7

;RCX = number of bytes to copy
movzx rcx,g_iNumChild
sub cl,bl
dec cl ;rcx = g_iNumChild-iThisChild-1
cmp cl,0
je lbl_ChildStructPurge_Dec

imul ecx,ecx,30h ;Length(CHILD64) = 30h
;RDI = destination start = lpChildStruct
mov rdi,lpChildStruct
;RSI = source start = lpChildStruct + 30h
mov rsi,rdi
add rsi,30h
;Clear direction flag > copy forward. WHY FORWARD?!!
cld
rep movsb ;Copy RCX bytes from [RSI] to [RDI]

lbl_ChildStructPurge_Dec:
;Decrement the number of child windows
dec g_iNumChild

;ZeroMemory(&g_child[g_iNumChild], sizeof(CHILD64));
xor rax,rax ;Pattern to broadcast
;RCX = number of bytes to move
mov rcx,30h
;RDI = destination start = g_child + g_iNumChild*30h
lea rdi,g_child
movzx rbx,g_iNumChild
imul ebx,ebx,30h
add rdi,rbx
;Clear direction flag > copy forward
cld
rep stosb

call MenuUpdate

lbl_ChildStructPurge_End:
;Epilogue
leave
ret
ChildStructPurge endp

