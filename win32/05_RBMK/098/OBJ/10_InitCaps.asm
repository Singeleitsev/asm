InitCaps proc

;ecx = Vertex Index
;xmm0 = xVertex
;xmm1 = yVertex
;xmm2 = zVertex
;xmm3 = xNormal
;xmm4 = yNormal
;xmm5 = zNormal

;0 - Top

xor ecx,ecx ;00
movss xmm0,f32_110
movss xmm1,f32_110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
xorps xmm4,xmm4 ;0
movss xmm5,f32_posOne
call SetVN

mov ecx,01 ;Can't increment because SetVN clobbers ecx
movss xmm0,f32_neg110
movss xmm1,f32_110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
xorps xmm4,xmm4 ;0
movss xmm5,f32_posOne
call SetVN

mov ecx,02
movss xmm0,f32_neg110
movss xmm1,f32_neg110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
xorps xmm4,xmm4 ;0
movss xmm5,f32_posOne
call SetVN

mov ecx,03
movss xmm0,f32_110
movss xmm1,f32_neg110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
xorps xmm4,xmm4 ;0
movss xmm5,f32_posOne
call SetVN

;1 - North

mov ecx,04
movss xmm0,f32_120
movss xmm1,f32_120
movss xmm2,f32_neg10
xorps xmm3,xmm3 ;0
movss xmm4,f32_sin45
movss xmm5,f32_sin45
call SetVN

mov ecx,05
movss xmm0,f32_neg120
movss xmm1,f32_120
movss xmm2,f32_neg10
xorps xmm3,xmm3 ;0
movss xmm4,f32_sin45
movss xmm5,f32_sin45
call SetVN

mov ecx,06
movss xmm0,f32_neg110
movss xmm1,f32_110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
movss xmm4,f32_sin45
movss xmm5,f32_sin45
call SetVN

mov ecx,07
movss xmm0,f32_110
movss xmm1,f32_110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
movss xmm4,f32_sin45
movss xmm5,f32_sin45
call SetVN

;2 - West

mov ecx,08
movss xmm0,f32_neg120
movss xmm1,f32_120
movss xmm2,f32_neg10
movss xmm3,f32_negSin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

mov ecx,09
movss xmm0,f32_neg120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
movss xmm3,f32_negSin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

mov ecx,10
movss xmm0,f32_neg110
movss xmm1,f32_neg110
xorps xmm2,xmm2 ;0
movss xmm3,f32_negSin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

mov ecx,11
movss xmm0,f32_neg110
movss xmm1,f32_110
xorps xmm2,xmm2 ;0
movss xmm3,f32_negSin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

;3 - South

mov ecx,12
movss xmm0,f32_neg120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
xorps xmm3,xmm3 ;0
movss xmm4,f32_negSin45
movss xmm5,f32_sin45
call SetVN

mov ecx,13
movss xmm0,f32_120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
xorps xmm3,xmm3 ;0
movss xmm4,f32_negSin45
movss xmm5,f32_sin45
call SetVN

mov ecx,14
movss xmm0,f32_110
movss xmm1,f32_neg110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
movss xmm4,f32_negSin45
movss xmm5,f32_sin45
call SetVN

mov ecx,15
movss xmm0,f32_neg110
movss xmm1,f32_neg110
xorps xmm2,xmm2 ;0
xorps xmm3,xmm3 ;0
movss xmm4,f32_negSin45
movss xmm5,f32_sin45
call SetVN

;4 - East

mov ecx,16
movss xmm0,f32_120
movss xmm1,f32_neg120
movss xmm2,f32_neg10
movss xmm3,f32_sin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

mov ecx,17
movss xmm0,f32_120
movss xmm1,f32_120
movss xmm2,f32_neg10
movss xmm3,f32_sin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

mov ecx,18
movss xmm0,f32_110
movss xmm1,f32_110
xorps xmm2,xmm2 ;0
movss xmm3,f32_sin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

mov ecx,19
movss xmm0,f32_110
movss xmm1,f32_neg110
xorps xmm2,xmm2 ;0
movss xmm3,f32_sin45
xorps xmm4,xmm4 ;0
movss xmm5,f32_sin45
call SetVN

xor eax,eax
ret
InitCaps endp


