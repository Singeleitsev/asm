InitCaps proc
PROLOG 100h

;ecx = Vertex Index
;xmm0 = xVertex
;xmm1 = yVertex
;xmm2 = zVertex
;xmm3 = xNormal
;xmm4 = yNormal
;xmm5 = zNormal

;0 - Top

xor rcx,rcx
movss xmm0,f32_110
movss xmm1,f32_110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
xorps xmm4,xmm4 ;0
movss xmm5,f32_posOne
call SetVN

mov rcx,01
movss xmm0,f32_neg110
movss xmm1,f32_110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
xorps xmm4,xmm4 ;0
movss xmm5,f32_posOne
call SetVN

mov rcx,02
movss xmm0,f32_neg110
movss xmm1,f32_neg110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
xorps xmm4,xmm4 ;0
movss xmm5,f32_posOne
call SetVN

mov rcx,03
movss xmm0,f32_110
movss xmm1,f32_neg110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
xorps xmm4,xmm4 ;0
movss xmm5,f32_posOne
call SetVN

;1 - North

mov rcx,04
movss xmm0,f32_120
movss xmm1,f32_120
movss xmm2,f32_neg10
xorps xmm3,xmm3 ;0
movss xmm4,f32_sin45
movss xmm5,f32_sin45
call SetVN

mov rcx,05
movss xmm0,f32_neg120
movss xmm1,f32_120
movss xmm2,f32_neg10
xorps xmm3,xmm3 ;0
movss xmm4,f32_sin45
movss xmm5,f32_sin45
call SetVN

mov rcx,06
movss xmm0,f32_neg110
movss xmm1,f32_110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
movss xmm4,f32_sin45
movss xmm5,f32_sin45
call SetVN

mov rcx,07
movss xmm0,f32_110
movss xmm1,f32_110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
movss xmm4,f32_sin45
movss xmm5,f32_sin45
call SetVN

;2 - West

mov rcx,08
movss xmm0,f32_neg120
movss xmm1,f32_120
movss xmm2,f32_neg10
movss xmm3,f32_negSin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

mov rcx,09
movss xmm0,f32_neg120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
movss xmm3,f32_negSin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

mov rcx,10
movss xmm0,f32_neg110
movss xmm1,f32_neg110
xorps xmm2,xmm2 ;0
movss xmm3,f32_negSin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

mov rcx,11
movss xmm0,f32_neg110
movss xmm1,f32_110
xorps xmm2,xmm2 ;0
movss xmm3,f32_negSin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

;3 - South

mov rcx,12
movss xmm0,f32_neg120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
xorps xmm3,xmm3 ;0
movss xmm4,f32_negSin45
movss xmm5,f32_sin45
call SetVN

mov rcx,13
movss xmm0,f32_120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
xorps xmm3,xmm3 ;0
movss xmm4,f32_negSin45
movss xmm5,f32_sin45
call SetVN

mov rcx,14
movss xmm0,f32_110
movss xmm1,f32_neg110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
movss xmm4,f32_negSin45
movss xmm5,f32_sin45
call SetVN

mov rcx,15
movss xmm0,f32_neg110
movss xmm1,f32_neg110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
movss xmm4,f32_negSin45
movss xmm5,f32_sin45
call SetVN

;4 - East

mov rcx,16
movss xmm0,f32_120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
movss xmm3,f32_sin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

mov rcx,17
movss xmm0,f32_120
movss xmm1,f32_120
movss xmm2,f32_neg10
movss xmm3,f32_sin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

mov rcx,18
movss xmm0,f32_110
movss xmm1,f32_110
xorps xmm2,xmm2 ;0
movss xmm3,f32_sin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

mov rcx,19
movss xmm0,f32_110
movss xmm1,f32_neg110
xorps xmm2,xmm2 ;0
movss xmm3,f32_sin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

xor rax,rax
EPILOG
InitCaps endp

