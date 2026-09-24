;wmSize:

cmp wParam,1 ; SIZE_MINIMIZED
je WndProc_Return0

;Fill the RECT structure
invoke GetClientRect,hWnd,OFFSET_RECT_CLIENT
test eax,eax
jz WndProc_Error

;Store the Client Area Dimensions

;Width
mov eax,lParam
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
fild gRectClientWidth ;st0 = Width
fild gRectClientHeight ;st0 = Height, st1 = Width
fdivp st(1),st(0) ;st0 = Aspect
fstp gRectClientAspect

;Trackball Radius
;Radius = min(clientWidth, clientHeight) / 2
mov eax,gRectClientWidth
cmp eax,gRectClientHeight
jbe @f
mov eax, gRectClientHeight
@@:
shr eax,1
mov Radius,eax

;Force the Status Bar to recompute its parts layout
;WM_SIZE = 5
invoke SendMessageA,ghwndStatusBar,5,0,0

;xStatusParts(i) = xStatusProportions(i)*RectWidth/1024
mov cl,STATUS_BAR_PARTS-1
mov ebx,gRectClientWidth
lea esi,xStatusProportions
lea edi,xStatusParts
lbl_NextStatusPart:
mov eax,dword ptr[esi] ;xStatusProportions(i)
mul ebx ;*RectWidth
shr eax,10 ;Divide by DEFAULT_SCREEN_WIDTH = 1024
mov dword ptr[edi],eax ;xStatusParts(i)
add esi,4
add edi,4
dec cl
cmp cl,0
jg lbl_NextStatusPart

;Send the updated coordnates to the Status Bar Window
push offset xStatusParts
push 9 ;wParam = Number of Parts
push 404h ;Msg = SB_SETPARTS = WM_USER + 4
push ghwndStatusBar
call SendMessageA

;Update OpenGL Viewport
cmp ghRC,0
je wmSize_End
invoke glViewport,0,0,gRectClientWidth,gRectClientHeight

wmSize_End:
;Set the Flag to ReDraw the Scene
mov isRefreshed,0

;jmp WndProc_Return0

