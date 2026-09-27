InitTimer proc

;Get the QPC frequency
invoke QueryPerformanceFrequency,offset qpcFreq

InitTimer_End:
ret
InitTimer endp



Tick proc

;Load current counter
invoke QueryPerformanceCounter,offset qpcNow

;Check if this is the first call (qpcPrev == 0)
mov eax,dword ptr [qpcPrev+0]
mov edx,dword ptr [qpcPrev+4]
or eax,edx
jnz Tick_HasPrevious

;First call
;qpcPrev = qpcNow
mov eax,dword ptr[qpcNow+0]
mov edx,dword ptr[qpcNow+4]
mov dword ptr[qpcPrev+0],eax
mov dword ptr[qpcPrev+4],edx
;gDeltaT = 0
mov dword ptr[gDeltaT+0],0
mov dword ptr[gDeltaT+4],0
;exit
ret

Tick_HasPrevious:
;Compute delta_ticks = qpcNow - qpcPrev (64-bit)
mov eax,dword ptr [qpcNow]
mov edx,dword ptr [qpcNow+4]
sub eax,dword ptr [qpcPrev]
sbb edx,dword ptr [qpcPrev+4]

;Save it temporarily as (edx:eax)
;Compute gDeltaT = (double)delta_ticks / (double)qpcFreq

;Push the 64-bit delta onto the stack as a qword for fild
push edx
push eax
fild qword ptr[esp] ;ST(0) = (double)delta_ticks
add esp,8

fild qword ptr[qpcFreq] ;ST(0) = freq, ST(1) = delta
fdivp st(1),st(0) ;ST(0) = delta / freq
fstp qword ptr[gDeltaT] ;store as double, pop

;Update qpcPrev = qpcNow
mov eax, dword ptr[qpcNow+0]
mov edx, dword ptr[qpcNow+4]
mov dword ptr[qpcPrev+0], eax
mov dword ptr[qpcPrev+4], edx

;Clamp gDeltaT to [0, 0.1]
fld qword ptr [gDeltaT] ;ST(0) = delta

;If delta < 0, set to 0
fldz  ; ST(0) = 0.0, ST(1) = delta
fcomip st, st(1); compare 0.0 with delta; pop ST(0)
jbe Tick_CheckMax ;if 0.0 <= delta, delta >= 0, ok
fstp st(0) ;pop delta (discard)
fldz ;ST(0) = 0.0
fstp qword ptr[gDeltaT]
jmp Tick_Accumulate

Tick_CheckMax:
;If delta > 0.1, set to 0.1
fld qword ptr[MaxDeltaT] ;ST(0) = 0.1, ST(1) = delta
fcomip st, st(1) ;compare 0.1 with delta; pop ST(0)
jae Tick_Store ;if 0.1 >= delta, keep delta
fstp st(0) ;pop delta (discard)
fld qword ptr[MaxDeltaT] ;ST(0) = 0.1
fstp qword ptr[gDeltaT]
jmp Tick_Accumulate

Tick_Store:
fstp qword ptr [gDeltaT] ;store delta back (unchanged)

Tick_Accumulate:
;;tStatusAcc += gDeltaT
;fld qword ptr [tStatusAcc]
;fadd qword ptr [gDeltaT]
;fstp qword ptr [tStatusAcc]

;tTitleAcc += gDeltaT
fld qword ptr[tTitleAcc]
fadd qword ptr[gDeltaT]
fstp qword ptr[tTitleAcc]

Tick_End:
ret
Tick endp


