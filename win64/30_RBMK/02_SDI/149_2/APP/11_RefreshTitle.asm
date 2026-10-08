RefreshTitle proc
LOCAL fpsTemp:DWORD
PROLOG 100h

;1. Frame counter
inc gnFrame
mov eax,gnFrame

lea rdi,szMainWndTitleFrame
add rdi,11h ;Shift to Last Digit
mov ecx,8 ;Set Counter

NextFrameHexDigit:
mov bl,al ;Use bl as Buffer
and bl,0Fh ;Last Hex Digit Remains

;Convert Hex to ASCII
or bl,30h ;add bl,30h 
cmp bl,3Ah
jl StoreFrameHexDigit

;If more than 9 then skip to ASCII Letters
add bl,7h ;3Ah + 7 = 41h

StoreFrameHexDigit:
mov byte ptr[rdi],bl
shr eax,4 ;Next Digit
dec rdi
dec cl
cmp cl,0
jg NextFrameHexDigit

;2. Format FPS as 3 decimal digits
mov eax,FPS
cmp eax,999
jle @f
mov eax,999

@@:
lea rdi,szMainWndTitleFPS
add rdi,6 ;last digit slot

;Ones
xor rdx,rdx
mov ecx,10
div ecx
or dl,30h
mov byte ptr[rdi],dl
dec rdi

;Tens
xor rdx,rdx
div ecx
or dl,30h
mov byte ptr[rdi],dl
dec rdi

;Hundreds
or al,30h
mov byte ptr[rdi],al

;7. Update window title
RefreshTitle_End:
mov rcx,ghWnd ;Global ghWnd
lea rdx,szMainWndTitle
call SetWindowTextA 

EPILOG
RefreshTitle endp


