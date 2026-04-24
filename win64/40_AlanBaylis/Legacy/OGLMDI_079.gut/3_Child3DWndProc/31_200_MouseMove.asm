;case WM_MOUSEMOVE:
lbl_Child3D_MouseMove:

;If left mouse button is down
cmp g_bMouseDrag,0
je lbl_Child3D_Return0

;Since in this part of code we don't call other Procedures,
;we can store the Local Variables in the Registers
;without moving them to/from the Memory

;MouseX = LOWORD(lParam);
mov r8,lParam ;X = LOWORD, Y = HIWORD
and r8,0FFFFh ;X = LOWORD
;MouseY = HIWORD(lParam);
mov r9,lParam ;X = LOWORD, Y = HIWORD
shr r9d,16 ;HIWORD to LOWORD
and r9,0FFFFh

;g_iMouseDeltaX = LOWORD(lParam) - g_iMouseLastX
mov eax,r8d
sub eax,g_iMouseLastX
mov g_iMouseDeltaX,eax
;g_iMouseDeltaY = HIWORD(lParam) - g_iMouseLastY
mov ebx,r9d
sub ebx,g_iMouseLastY
mov g_iMouseDeltaY,ebx

;g_iMouseLastX = LOWORD(lParam)
mov g_iMouseLastX,r8d
;g_iMouseLastY = HIWORD(lParam)
mov g_iMouseLastY,r9d

;Apply mouse deltas to cube rotation values
;g_fCubeRotationX += (float)g_iMouseDeltaY * 0.5
cvtsi2ss xmm0,g_iMouseDeltaY
mulss xmm0,f32_0p5
addss xmm0,g_fCubeRotationX
movss g_fCubeRotationX,xmm0
;g_fCubeRotationY += (float)g_iMouseDeltaX * 0.5
cvtsi2ss xmm1, g_iMouseDeltaX
mulss xmm1,f32_0p5
addss xmm1,g_fCubeRotationY
movss g_fCubeRotationY,xmm1

jmp lbl_Child3D_Return0

