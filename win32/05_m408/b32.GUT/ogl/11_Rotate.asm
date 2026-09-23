;ModelRotate
;Rotation about one of the object's own axes onto mtxObjectVolatile
;Only the upper-left 3x3 block is modified
;the translation column is preserved.
;Parameters (stdcall):
; direction: signed REAL4, either -1.0 or 1.0
; axis:
;  0 = rotate about Local X
;  1 = rotate about Local Y
;  2 = rotate about Local Z

;x|00|10|20|30| |x|00|04|08|12|
;y|01|11|21|31| |y|01|05|09|13|
;z|02|12|22|32| |z|02|06|10|14|
;w|03|13|23|33| |w|03|07|11|15|

ModelRotate proc direction:REAL4, axis:DWORD

;1.1. Check for Angular Boost
cmp byte ptr[key+10h],0 ;Shift
je RegularAngle

;1.2. Angular Boost
movss xmm0,sinFast
movss xmm1,cosFast
jmp UseDirection

;1.3. No Angular Boost
RegularAngle:
movss xmm0,sinSlow
movss xmm1,cosSlow

;1.4. Use the Direction
UseDirection:
mulss xmm0,direction ;Only Sine can be Negative

;1.5. Fill all 4 xmm lanes
shufps xmm0,xmm0,0
shufps xmm1,xmm1,0

;2. Load Objet Matrix Address
lea ecx,mtxObjectVolatile

;3. Dispatch on axis
mov eax,axis
cmp eax,0
je Rx
cmp eax,1
je Ry
cmp eax,2
je Rz
jmp ModelRotate_End ;invalid axis - no-op

Rx:
;1   0    0 0 
;0 cos -sin 0
;0 sin  cos 0
;0   0    0 1

;Load Values
movups xmm2,oword ptr[ecx+4*4] ;old[04..07]
movups xmm3,oword ptr[ecx+8*4] ;old[08..11]
movaps xmm4,xmm2 ;old[04..07]
movaps xmm5,xmm3 ;old[08..11]

;new[04] = c * old[04] + s * old[08]
;new[05] = c * old[05] + s * old[09]
;new[06] = c * old[06] + s * old[10]
;new[07] = c * old[07] + s * old[11]
mulps xmm2,xmm1 ;old[04..07]*cos
mulps xmm3,xmm0 ;old[08..11]*sin
addps xmm2,xmm3
movups oword ptr[ecx+4*4],xmm2 ;new[04..07]

;new[08] = c * old[08] - s * old[04]
;new[09] = c * old[09] - s * old[05]
;new[10] = c * old[10] - s * old[06]
;new[11] = c * old[11] - s * old[07]
mulps xmm5,xmm1 ;old[08..11]*cos
mulps xmm4,xmm0 ;old[04..07]*sin
subps xmm5,xmm4
movups oword ptr[ecx+8*4],xmm5 ;new[08..11]

jmp ModelRotate_End

Ry:
; cos 0 sin 0
;   0 1   0 0
;-sin 0 cos 0
;   0 0   0 1

;Load Values
movups xmm2,oword ptr[ecx+0*4] ;old[00..03]
movups xmm3,oword ptr[ecx+8*4] ;old[08..11]
movaps xmm4,xmm2 ;old[00..03]
movaps xmm5,xmm3 ;old[08..11]

;new[00] =  c * old[00] - s * old[08]
;new[01] =  c * old[01] - s * old[09]
;new[02] =  c * old[02] - s * old[10]
;new[03] =  c * old[03] - s * old[11]
mulps xmm2,xmm1 ;old[00..03]*cos
mulps xmm3,xmm0 ;old[08..11]*sin
subps xmm2,xmm3
movups oword ptr[ecx+0*4],xmm2 ;new[00..03]

;new[08] =  s * old[00] + c * old[08]
;new[09] =  s * old[01] + c * old[09]
;new[10] =  s * old[02] + c * old[10]
;new[11] =  s * old[03] + c * old[11]
mulps xmm4,xmm0 ;old[00..03]*sin
mulps xmm5,xmm1 ;old[08..11]*cos
addps xmm4,xmm5
movups oword ptr[ecx+8*4],xmm4 ;new[08..11]

jmp ModelRotate_End

Rz:
;cos -sin 0 0
;sin  cos 0 0
;  0    0 1 0
;  0    0 0 1

;Load Values
movups xmm2,oword ptr[ecx+0*4] ;old[00..03]
movups xmm3,oword ptr[ecx+4*4] ;old[04..07]
movaps xmm4,xmm2 ;old[00..03]
movaps xmm5,xmm3 ;old[04..07]

;new[00] = c * old[00] + s * old[04]
;new[01] = c * old[01] + s * old[05]
;new[02] = c * old[02] + s * old[06]
;new[03] = c * old[03] + s * old[07]
mulps xmm2,xmm1 ;old[00..03]*cos
mulps xmm3,xmm0 ;old[04..07]*sin
addps xmm2,xmm3
movups oword ptr[ecx+0*4],xmm2 ;new[00..03]

;new[04] = c * old[04] - s * old[00]
;new[05] = c * old[05] - s * old[01]
;new[06] = c * old[06] - s * old[02]
;new[07] = c * old[07] - s * old[03]
mulps xmm4,xmm0 ;old[00..03]*sin
mulps xmm5,xmm1 ;old[04..07]*cos
subps xmm5,xmm4
movups oword ptr[ecx+4*4],xmm5 ;new[04..07]

jmp ModelRotate_End

ModelRotate_End:
mov isInitialPosition,0
mov isRefreshed,0
ret
ModelRotate endp


