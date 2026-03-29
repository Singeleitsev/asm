;case WM_CLOSE:
lbl_WndProc_Close:

cmp g_iNumChild,0 ;If there are any children
je lbl_WndProc_CallDestroy

;Send all children the WM_CLOSE to free up their DC and RC
;for(iLoop = 0;iLoop < g_iNumChild;iLoop++)
xor rax,rax
mov al,g_iNumChild
mov iLoop,al
lbl_CloseChildLoop:

xor rax,rax
mov al,iLoop
imul ax,30h ;index * SizeOf CHILD64
lea rcx,g_child
add rcx,rax ;rcx = lpChildStruct = AddressOf hWnd
mov rdx,10h ;WM_CLOSE
xor r8,r8
xor r9,r9
Call SendMessageA

lbl_NextChild:
dec iLoop
cmp iLoop,0
jg lbl_CloseChildLoop

lbl_WndProc_CallDestroy:
mov rcx,hWnd
Call DestroyWindow

jmp lbl_WndProc_Return0

