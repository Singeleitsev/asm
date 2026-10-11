WndProc proc hWnd:QWORD, uMsg:QWORD, wParam:QWORD, lParam:QWORD
PROLOG 100h

;Store the arguments
mov hWnd,rcx
mov uMsg,rdx
mov wParam,r8
mov lParam,r9

;Messages Arranged by Probability
cmp edx,200h
je wmMouseMove
cmp edx,100h
je wmKeyDown
cmp edx,101h
je wmKeyUp
cmp edx,20Ah
je wmMouseWheel
cmp edx,207h
je wmMButtonDown
cmp edx,208h
je wmMButtonUp
cmp edx,201h
je wmLButtonDown
cmp edx,202h
je wmLButtonUp
cmp edx,204h
je wmRButtonDown
cmp edx,205h
je wmRButtonUp
cmp edx,209h
je wmMButtonDblClk
cmp edx,111h
je wmCommand
cmp edx,6
je wmActivate
cmp edx,215h
je wmCaptureChanged
cmp edx,5
je wmSize
cmp edx,24h
je wmGetMinMaxInfo
cmp edx,10h
je wmClose
cmp edx,2
je wmDestroy
;cmp edx,1
;je wmCreate

;None of the Above
WndProc_Default:
;mov rcx,hWnd
;mov rdx,uMsg
;mov r8,wParam
;mov r9,lParam
call DefWindowProcA ;Arguments do not require a reassignment
jmp WndProc_End

;WM_CREATE = 1
;wmCreate:
;jmp WndProc_Return0

;WM_DESTROY = 2
wmDestroy:
xor rcx,rcx
call PostQuitMessage
jmp WndProc_Return0

;WM_SIZE = 5
wmSize:
include 10_005_Size.asm
jmp WndProc_Return0

;WM_ACTIVATE = 6
wmActivate:
mov eax,r8d ;wParam
;LOWORD(wParam) can be WA_ACTIVE, WA_CLICKACTIVE, WA_INACTIVE
test ax,ax ;WA_INACTIVE = 0
jz deActivate
;HIWORD(wParam) Specifies The Minimized State Of The Window Being Activated Or Deactivated
shr eax,10h ;Shift Right 16 bits
test ax,ax ;Not Minimized when HIWORD(wParam) = 0
jnz deActivate

setActive:
mov isActive,1
jmp WndProc_Return0

deActivate:
mov isActive,0
jmp WndProc_Return0

;WM_CLOSE = 10h
wmClose:
;mov rcx,hWnd
call CloseWndProc ;Argument does not require a reassignment
jmp WndProc_Return0

;WM_GETMINMAXINFO = 24h
wmGetMinMaxInfo:
;r9 = lParam = address of the Temporary MINMAXINFO created by the System
;lParam+24 is an offset of ptMinTrackSize.x
mov dword ptr [r9+24],MIN_WND_WIDTH
;lParam+28 is an offset of ptMinTrackSize.y
mov dword ptr [r9+28],MIN_WND_HEIGHT
jmp WndProc_Return0

;WM_KEYDOWN = 100h
wmKeyDown:
include 10_100_KeyDown.asm
jmp WndProc_Return0

;WM_KEYUP = 101h
wmKeyUp:
;r8 = wParam
xor rax,rax
mov al,r8b ;LOWORD(wParam)
lea rdi,key
add rdi,rax
mov byte ptr[rdi],0
jmp WndProc_Return0

;WM_COMMAND = 111h
wmCommand:
include 10_111_Command.asm
jmp WndProc_Return0

;WM_MOUSEMOVE = 200h
wmMouseMove:
;Select Mode
cmp gnMouseMode,MOUSE_MODE_FREE
je WndProc_Return0
cmp gnMouseMode,MOUSE_MODE_CAMERA_ROTATE
jne @f
call CameraRotate
jmp WndProc_Return0
@@:
cmp gnMouseMode,MOUSE_MODE_CAMERA_DRAG
jne @f
call CameraDrag
jmp WndProc_Return0
@@:
cmp gnMouseMode,MOUSE_MODE_OBJECT_ROTATE
jne @f
call ObjectRotate
@@:
jmp WndProc_Return0

;WM_LBUTTONDOWN = 201h
wmLButtonDown:
mov gnMouseMode,MOUSE_MODE_CAMERA_ROTATE
;mov rcx,hWnd
call SetCapture ;Argument does not require a reassignment
mov r9,lParam
GET_REFERENCE_CURSOR_POSITION
;Set Flags
mov isInitialPosition,0
mov isRefreshed,0
jmp WndProc_Return0

;WM_LBUTTONUP = 202h
wmLButtonUp:
call ReleaseCapture
mov gnMouseMode,MOUSE_MODE_FREE
jmp WndProc_Return0

;WM_RBUTTONDOWN = 204h
wmRButtonDown:
mov gnMouseMode,MOUSE_MODE_OBJECT_ROTATE
;mov rcx,hWnd
call SetCapture ;Argument does not require a reassignment
mov r9,lParam
GET_REFERENCE_CURSOR_POSITION
;Set Flags
mov isInitialPosition,0
mov isRefreshed,0
jmp WndProc_Return0

;WM_RBUTTONUP = 205h
wmRButtonUp:
call ReleaseCapture
mov gnMouseMode,MOUSE_MODE_FREE
jmp WndProc_Return0

;WM_MBUTTONDOWN = 207h
wmMButtonDown:
mov gnMouseMode,MOUSE_MODE_CAMERA_DRAG
;mov rcx,hWnd
call SetCapture ;Argument does not require a reassignment
mov r9,lParam
GET_REFERENCE_CURSOR_POSITION
;Set Flags
mov isInitialPosition,0
mov isRefreshed,0
jmp WndProc_Return0

;WM_MBUTTONUP = 208h
wmMButtonUp:
call ReleaseCapture
mov gnMouseMode,MOUSE_MODE_FREE
jmp WndProc_Return0

;WM_MBUTTONDBLCLK = 209h
wmMButtonDblClk:
call ResetScene
jmp WndProc_Return0

;WM_MOUSEWHEEL = 20Ah
wmMouseWheel:
call CameraDolly
jmp WndProc_Return0

;WM_CAPTURECHANGED = 215h
wmCaptureChanged:
mov gnMouseMode,MOUSE_MODE_FREE
jmp WndProc_Return0

WndProc_Return0:
xor rax,rax
jmp WndProc_End

WndProc_Error:
call SpellError
;jmp WndProc_End

WndProc_End:
EPILOG
WndProc endp


