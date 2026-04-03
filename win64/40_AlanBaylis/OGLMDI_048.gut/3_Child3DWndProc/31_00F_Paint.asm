lbl_Child3D_Paint:
mov rcx, hWnd
call IsIconic ;returns non-zero if window is minimized
cmp rax, 0
je lbl_Child3D_Return0

mov rsi,lpChildStruct
cmp qword ptr [rsi+8],0
je lbl_Child3D_DC_Err
cmp qword ptr [rsi+10h],0
je lbl_Child3D_RC_Err

;Debug Indicator
xor rcx,rcx
lea rdx,szLocator
lea r8,szChild3D
mov r9,30h ;MB_OK|MB_ICONEXCLAMATION
call MessageBoxA

;mov rcx,hWnd
;lea rdx,ps
;call BeginPaint

;mov rcx,hWnd
;lea rdx,ps
;call EndPaint
;jmp lbl_Child3D_Return0