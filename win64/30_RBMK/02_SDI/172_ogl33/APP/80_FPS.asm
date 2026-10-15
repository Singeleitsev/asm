;Screen Frames per Second
ComputeFPS proc
PROLOG 100h

;Load Current Counter
lea rcx,qpcNow ;Address of qpcNow
call QueryPerformanceCounter

;rcx = delta_ticks = qpcNow - qpcPrev
mov rcx,qpcNow ;Value of qpcNow
sub rcx,qpcPrev
test rcx,rcx
jz FPS_End

;delta_seconds = delta_ticks / qpcFreq
;fps = 1 / delta_seconds = qpcFreq / delta_ticks = rax / rcx
mov rax,qpcFreq
xor rdx,rdx ;Set rdx = 0 for div
div rcx
mov FPS,eax

FPS_End:
;Advance the Counter
mov rax,qpcNow
mov qpcPrev,rax

EPILOG
ComputeFPS endp


