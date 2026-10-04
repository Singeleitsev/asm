ComputeFPS proc

;Load Current Counter
invoke QueryPerformanceCounter,offset qpcNow

;delta_ticks = qpcNow - qpcPrev (64-bit)
mov ecx,dword ptr[qpcNow+0]
mov ebx,dword ptr[qpcNow+4]
sub ecx,dword ptr[qpcPrev+0]
sbb ebx,dword ptr[qpcPrev+4]
test ecx,ecx
jz FPS_End

;delta_seconds = (double)delta_ticks / (double)qpcFreq
;fps = 1 / delta_seconds = qpcFreq / delta_ticks = rax / rcx
mov eax,dword ptr[qpcFreq+0] ;low32(qpcFreq)
mov edx,dword ptr[qpcFreq+4] ;High32(qpcFreq)
div ecx ;eax = qpcFreq / delta_ticks = FPS
mov FPS,eax

FPS_End:
;Advance qpcPrev = qpcNow
mov eax,dword ptr[qpcNow+0]
mov edx,dword ptr[qpcNow+4]
mov dword ptr[qpcPrev+0],eax
mov dword ptr[qpcPrev+4],edx

ret
ComputeFPS endp


