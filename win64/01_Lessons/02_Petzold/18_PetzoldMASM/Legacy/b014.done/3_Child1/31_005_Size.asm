wmChild1Size:

;if (wParam != SIZE_MINIMIZED)
cmp r8,1
je defChild1WndProc

mov rcx,hwnd
xor rdx,rdx
call GetWindowLongPtrA
mov lpChild1Data,rax

;Spell64rax hwnd, szChild1Title, szGetWindow

;cmp rax,lpGlobalData
;jne errChild1WndProc

;lpChild1Data->cxClient = LOWORD (lParam) ;
mov r9,lParam
and r9,0FFFFh
mov rax,lpChild1Data
mov qword ptr [rax],r9 ;lpChild1Data->cxClient

;lpChild1Data->cyClient = HIWORD (lParam) ;
mov r9,lParam
shr r9,10h ;HIWORD (lParam)
and r9,0FFFFh
mov rax,lpChild1Data
mov qword ptr[rax+8],r9 ;lpChild1Data->cyClient

;break
jmp defChild1WndProc ;WM_SIZE must be processed by DefMDIChildProc


