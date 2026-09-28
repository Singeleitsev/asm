RefreshTitle proc
LOCAL fpsTemp:DWORD

;1. Frame counter
inc gnFrame
mov eax,gnFrame

lea edi,szMainWndTitleFrame
add edi,11h ;Shift to Last Digit
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
mov byte ptr[edi],bl
shr eax,4
dec edi
dec cl
cmp cl,0
jg NextFrameHexDigit



;2. Increment FPS frame counter

inc nTitleFrames

;3. Check if 1 second has passed
fld dword ptr[tTitleAcc]
fld1
fcomip st,st(1)
fstp st(0) ;pop tTitleAcc
ja RefreshTitle_End ;1.0 > tTitleAcc - not enough time

;4. Compute FPS = nTitleFrames / tTitleAcc
fild dword ptr[nTitleFrames]
fld dword ptr[tTitleAcc]
fdivp st(1),st(0) ;ST(0) = nTitleFrames / tTitleAcc
fistp dword ptr[fpsTemp] ;round and store to fpsTemp

;5. Reset accumulators
mov nTitleFrames, 0
fldz
fstp dword ptr[tTitleAcc]

;6. Format FPS as 3 decimal digits
mov eax,fpsTemp
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
add dl,30h
mov byte ptr[edi],dl
dec edi

;Tens
xor edx,edx
div ecx
add dl,30h
mov byte ptr[edi],dl
dec edi

;Hundreds
add al,30h
mov byte ptr[edi],al

;7. Update window title
RefreshTitle_End:
invoke SetWindowTextA,ghWnd,offset szMainWndTitle

ret
RefreshTitle endp


