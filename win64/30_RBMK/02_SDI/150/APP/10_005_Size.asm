;wmSize:

cmp wParam,1 ; SIZE_MINIMIZED
je WndProc_Return0

;Fill the RECT structure
;mov rcx,hWnd ;It's still there
mov rdx,OFFSET_RECT_CLIENT
call GetClientRect
test eax,eax
jz WndProc_Error

;Store the Client Area Dimensions

;Width
mov rax,lParam
movzx ecx,ax ;LOWORD = width
shr eax,16 ;HIWORD = height
mov gRectClientWidth,ecx
mov gRectClientHeight,eax
test eax,eax
jz WndProc_Return0
test ecx,ecx
jz WndProc_Return0

;Width/2
shr ecx,1 ;Divide by 2
mov xScrCenter,ecx

;Height/2
shr eax,1 ;Divide by 2
mov yScrCenter,eax

;Aspect Ratio
cvtsi2sd xmm0,gRectClientWidth
cvtsi2sd xmm1,gRectClientHeight
divsd xmm0,xmm1
movsd gRectClientAspect,xmm0;Must be double for gluPerspective

;Force the Status Bar to recompute its parts layout
mov rcx,ghWndStatusBar
mov rdx,5 ;WM_SIZE
xor r8,r8
xor r9,r9
call SendMessageA

;xStatusParts(i) = xStatusProportions(i)*RectWidth/1024
mov cl,STATUS_BAR_PARTS-1
mov ebx,gRectClientWidth
lea rsi,xStatusProportions
lea rdi,xStatusParts
lbl_NextStatusPart:
mov eax,dword ptr[rsi] ;xStatusProportions(i)
mul ebx ;*RectWidth
shr eax,10 ;Divide by DEFAULT_SCREEN_WIDTH = 1024
mov dword ptr[rdi],eax ;xStatusParts(i)
add rsi,4
add rdi,4
dec cl
cmp cl,0
jg lbl_NextStatusPart

;Send the updated coordnates to the Status Bar Window
mov rcx,ghWndStatusBar
mov rdx,404h ;Msg = SB_SETPARTS = WM_USER + 4
mov r8,STATUS_BAR_PARTS ;wParam = Number of Parts
lea r9,xStatusParts
call SendMessageA

;Update OpenGL Viewport
cmp ghRC,0
je wmSize_End
xor rcx,rcx
xor rdx,rdx
xor r8,r8
mov r8d,gRectClientWidth
xor r9,r9
mov r9d,gRectClientHeight
call glViewport

wmSize_End:
;Set the Flag to ReDraw the Scene
mov isRefreshed,0

;jmp WndProc_Return0

