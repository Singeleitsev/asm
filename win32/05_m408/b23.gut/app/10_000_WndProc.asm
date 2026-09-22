WndProc proc hWnd:DWORD, uMsg:DWORD, wParam:DWORD, lParam:DWORD

;Use the register instead of memory 
mov edx,uMsg

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
cmp edx,111h
je wmCommand
cmp edx,209h
je wmMButtonDblClk
cmp edx,6
je wmActivate
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
invoke DefWindowProcA,hWnd,uMsg,wParam,lParam
jmp WndProc_End

;WM_CREATE = 1
;wmCreate:
;jmp WndProc_Return0

;WM_DESTROY = 2
wmDestroy:
invoke PostQuitMessage,0
jmp WndProc_Return0

;WM_SIZE = 5
wmSize:
include 10_005_Size.asm
jmp WndProc_Return0

;WM_ACTIVATE = 6
wmActivate:
mov eax,wParam
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
invoke CloseWndProc,hWnd
jmp WndProc_Return0

;WM_GETMINMAXINFO = 24h
wmGetMinMaxInfo:
;lParam = address of the Temporary MINMAXINFO created by the System
mov eax,lParam
;lParam+24 is an offset of ptMinTrackSize.x
mov dword ptr [eax+24],MIN_WND_WIDTH ;ptMinTrackSize.x
;lParam+28 is an offset of ptMinTrackSize.y
mov dword ptr [eax+28],MIN_WND_HEIGHT;ptMinTrackSize.y
jmp WndProc_Return0

;WM_KEYDOWN = 100h
wmKeyDown:
include 10_100_KeyDown.asm
jmp WndProc_Return0

;WM_KEYUP = 101h
wmKeyUp:
mov eax,wParam
cmp eax,0FFh ;VK codes are 0...0xFE
jae WndProc_Return0
mov byte ptr[key+eax],0
jmp WndProc_Return0

;WM_COMMAND = 111h
wmCommand:
include 10_111_Command.asm
jmp WndProc_Return0

;WM_MOUSEMOVE = 200h
wmMouseMove:

;WM_LBUTTONDOWN = 201h
wmLButtonDown:

;WM_LBUTTONUP = 202h
wmLButtonUp:

;WM_RBUTTONDOWN = 204h
wmRButtonDown:

;WM_RBUTTONUP = 205h
wmRButtonUp:

;WM_MBUTTONDOWN = 207h
wmMButtonDown:

;WM_MBUTTONUP = 208h
wmMButtonUp:

;WM_MBUTTONDBLCLK = 209h
wmMButtonDblClk:

;WM_MOUSEWHEEL = 20Ah
wmMouseWheel:

WndProc_Return0:
xor eax,eax
jmp WndProc_End

WndProc_Error:
call SpellError
;jmp WndProc_End

WndProc_End:
ret
WndProc endp



