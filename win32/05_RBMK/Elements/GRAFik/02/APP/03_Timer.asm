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
;gDeltaT = 0.0
mov dword ptr[gDeltaT],0
;exit
ret

Tick_HasPrevious:
;Compute delta_ticks = qpcNow - qpcPrev (64-bit)
mov eax,dword ptr[qpcNow]
mov edx,dword ptr[qpcNow+4]
sub eax,dword ptr[qpcPrev]
sbb edx,dword ptr[qpcPrev+4]

;Save it temporarily as (edx:eax)
;Compute gDeltaT = (double)delta_ticks / (double)qpcFreq

;Push the 64-bit delta onto the stack as a qword for fild
push edx
push eax
fild qword ptr[esp] ;ST(0) = (double)delta_ticks
add esp,8

fild qword ptr[qpcFreq] ;ST(0) = freq, ST(1) = delta
fdivp st(1),st(0) ;ST(0) = delta / freq
fstp dword ptr[gDeltaT] ;store, pop

;Update qpcPrev = qpcNow
mov eax,dword ptr[qpcNow+0]
mov edx,dword ptr[qpcNow+4]
mov dword ptr[qpcPrev+0],eax
mov dword ptr[qpcPrev+4],edx

;Clamp gDeltaT to [0.0, 0.1] and accumulate into tTitleAcc
movss xmm0,dword ptr[gDeltaT] ;xmm0 = gDeltaT
xorps xmm1,xmm1 ;xmm1 = 0.0
maxss xmm0,xmm1  ;xmm0 = max(gDeltaT, 0.0)
movss xmm1,dword ptr[MaxDeltaT] ;xmm1 = 0.1
minss xmm0,xmm1  ;xmm0 = min(xmm0, 0.1)
movss dword ptr[gDeltaT],xmm0 ;store clamped gDeltaT

movss xmm1,dword ptr[tTitleAcc] ;xmm1 = tTitleAcc
addss xmm1,xmm0 ;xmm1 = tTitleAcc + gDeltaT
movss dword ptr[tTitleAcc],xmm1 ;store back

Tick_End:
ret
Tick endp


