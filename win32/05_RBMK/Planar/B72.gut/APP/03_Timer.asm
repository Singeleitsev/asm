InitTimer proc

;invoke QueryPerformanceFrequency,offset qpcFreq
;invoke QueryPerformanceCounter,offset qpcPrev

InitTimer_End:
ret
InitTimer endp



Tick proc

;Load current counter
;invoke QueryPerformanceCounter, offset qpcFreq   ; reuse qpcFreq as scratch

;dt = now - prev
;mov eax, dword ptr [qpcFreq]
;mov edx, dword ptr [qpcFreq+4]
;sub eax, dword ptr [qpcPrev]
;sbb edx, dword ptr [qpcPrev+4]

;store dt
;mov dword ptr [gDeltaT], eax
;mov dword ptr [gDeltaT+4], edx

;prev = now
;mov eax, dword ptr [qpcFreq]
;mov edx, dword ptr [qpcFreq+4]
;mov dword ptr [qpcPrev], eax
;mov dword ptr [qpcPrev+4], edx

Tick_End:
ret
Tick endp


