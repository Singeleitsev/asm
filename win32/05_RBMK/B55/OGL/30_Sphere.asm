MouseToVector proc xMouse:DWORD, yMouse:DWORD, pVecOut:DWORD

;1. Prepare for Output
mov ecx,pVecOut ;Since it's a pointer

;2. Guard Against Zero Sphere Radius
mov eax,dword ptr[Radius]
test eax,eax
jz Degenerate

;3. Compute dx = xMouse - xScrCenter
mov eax,xMouse
sub eax,xScrCenter
cvtsi2ss xmm0,eax ;xmm0 = dx (float)

;4. Compute dy = yScrCenter - yMouse
mov eax,yScrCenter
sub eax,yMouse
cvtsi2ss xmm1,eax ;xmm1 = dy (float)

;5. Convert Sphere Radius to float (once)
cvtsi2ss xmm2,Radius

;6. Divide by radius
divss xmm0,xmm2 ;xf = dx / Radius
divss xmm1,xmm2 ;yf = dy / Radius

;7. Compute d2 = xf*xf + yf*yf
movss xmm3,xmm0 ;Store xmm0
mulss xmm3,xmm3 ;xf*xf
movss xmm4,xmm1 ;Store xmm1
mulss xmm4,xmm4 ;yf*yf
addss xmm3,xmm4 ;d2

;8. Compare d2 to 1.0
movss xmm4,posOne ;xmm4 = 1.0
comiss xmm3,xmm4 ;compare d2 with 1.0
ja MouseToRim ;if d2 > 1.0, jump to rim projection

;9.1.1. Branch 1. Inside the circle
;z = sqrt(1 - d2)
subss xmm4,xmm3 ;xmm4 = 1.0 - d2
sqrtss xmm4,xmm4 ;z = sqrt(1 - d2)

;9.1.2. Store Branch 1
movss dword ptr[ecx+0],xmm0 ;xVecOut
movss dword ptr[ecx+4],xmm1 ;yVecOut
movss dword ptr[ecx+8],xmm4 ;zVecOut

jmp Success

;9.2.1. Branch 2. Outside the circle (project onto rim)
MouseToRim:
sqrtss xmm4,xmm3 ;sqrt(d2)
movss xmm5,posOne ;1.0
divss xmm5,xmm4 ;inv = 1.0 / sqrt(d2)
mulss xmm0,xmm5 ;xf *= inv
mulss xmm1,xmm5 ;yf *= inv

;9.2.2. Store Branch 2
movss dword ptr[ecx+0],xmm0 ;xVecOut
movss dword ptr[ecx+4],xmm1 ;yVecOut
mov dword ptr[ecx+8],0 ;zVecOut

jmp Success

;10. Radius = 0 is Failure
Degenerate:
;Return Unit Vector along z
mov dword ptr[ecx+0],0
mov dword ptr[ecx+4],0
mov dword ptr[ecx+8],3F800000h ;1.0f
mov eax,-1
ret

;11. Report Success
Success:
xor eax,eax
ret

MouseToVector endp

