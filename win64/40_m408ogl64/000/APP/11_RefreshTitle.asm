RefreshTitle proc
LOCAL fpsTemp:DWORD
PROLOG 100h

;1. Format FPS as 3 decimal digits
mov eax,FPS
cmp eax,999
jle @f
mov eax,999

@@:
lea rdi,szWndTitleMainFPS
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

;2. Update window title
RefreshTitle_End:
mov rcx,ghWnd ;Global ghWnd
lea rdx,szWndTitleMain
call SetWindowTextA

EPILOG
RefreshTitle endp


