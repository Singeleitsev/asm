RefreshTitle proc
LOCAL fpsTemp:DWORD

;Format FPS as 3 decimal digits
mov eax,FPS
cmp eax,999
jle @f
mov eax,999

@@:
lea edi,szMainWndTitleFPS
add edi,6 ;last digit slot

;Ones
xor edx,edx
mov ecx,10
div ecx
or dl,30h
mov byte ptr[edi],dl
dec edi

;Tens
xor edx,edx
div ecx
or dl,30h
mov byte ptr[edi],dl
dec edi

;Hundreds
or al,30h
mov byte ptr[edi],al

;7. Update window title
RefreshTitle_End:
invoke SetWindowTextA,ghWnd,offset szMainWndTitle

ret
RefreshTitle endp


