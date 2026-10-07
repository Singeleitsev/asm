InitCaps proc

lea esi,CapPattern

;[esi+00] = xVertex
;[esi+04] = yVertex
;[esi+08] = zVertex
;[esi+00] = xNormal
;[esi+04] = yNormal
;[esi+08] = zNormal

movss xmm0,f32_120
movss xmm1,f32_neg120
movss xmm2,f32_110
movss xmm3,f32_neg110
movss xmm4,f32_neg10
movss xmm5,f32_posOne
movss xmm6,f32_sin45
movss xmm7,f32_negSin45

;0 - Top

movss dword ptr[esi+00],xmm2 ;f32_120
movss dword ptr[esi+04],xmm2 ;f32_120
mov dword ptr[esi+08],0
mov dword ptr[esi+12],0
mov dword ptr[esi+16],0
movss dword ptr[esi+20],xmm5 ;f32_posOne

add esi,24
movss dword ptr[esi+00],xmm3 ;f32_neg120
movss dword ptr[esi+04],xmm2 ;f32_120
mov dword ptr[esi+08],0
mov dword ptr[esi+12],0
mov dword ptr[esi+16],0
movss dword ptr[esi+20],xmm5 ;f32_posOne

add esi,24
movss dword ptr[esi+00],xmm3 ;f32_neg120
movss dword ptr[esi+04],xmm3 ;f32_neg120
mov dword ptr[esi+08],0
mov dword ptr[esi+12],0
mov dword ptr[esi+16],0
movss dword ptr[esi+20],xmm5 ;f32_posOne

add esi,24
movss dword ptr[esi+00],xmm2 ;f32_120
movss dword ptr[esi+04],xmm3 ;f32_neg120
mov dword ptr[esi+08],0
mov dword ptr[esi+12],0
mov dword ptr[esi+16],0
movss dword ptr[esi+20],xmm5 ;f32_posOne

;1 - North

add esi,24
movss dword ptr[esi+00],xmm0 ;f32_120
movss dword ptr[esi+04],xmm0 ;f32_120
movss dword ptr[esi+08],xmm4 ;f32_neg10
mov dword ptr[esi+12],0
movss dword ptr[esi+16],xmm6 ;f32_sin45
movss dword ptr[esi+20],xmm6 ;f32_sin45

add esi,24
movss dword ptr[esi+00],xmm1 ;f32_neg120
movss dword ptr[esi+04],xmm0 ;f32_120
movss dword ptr[esi+08],xmm4 ;f32_neg10
mov dword ptr[esi+12],0
movss dword ptr[esi+16],xmm6 ;f32_sin45
movss dword ptr[esi+20],xmm6 ;f32_sin45

add esi,24
movss dword ptr[esi+00],xmm3 ;f32_neg120
movss dword ptr[esi+04],xmm2 ;f32_120
mov dword ptr[esi+08],0
mov dword ptr[esi+12],0
movss dword ptr[esi+16],xmm6 ;f32_sin45
movss dword ptr[esi+20],xmm6 ;f32_sin45

add esi,24
movss dword ptr[esi+00],xmm2 ;f32_120
movss dword ptr[esi+04],xmm2 ;f32_120
mov dword ptr[esi+08],0
mov dword ptr[esi+12],0
movss dword ptr[esi+16],xmm6 ;f32_sin45
movss dword ptr[esi+20],xmm6 ;f32_sin45

;2 - West

add esi,24
movss dword ptr[esi+00],xmm1 ;f32_neg120
movss dword ptr[esi+04],xmm0 ;f32_120
movss dword ptr[esi+08],xmm4 ;f32_neg10
movss dword ptr[esi+12],xmm7 ;f32_negSin45
mov dword ptr[esi+16],0
movss dword ptr[esi+20],xmm6 ;f32_sin45

add esi,24
movss dword ptr[esi+00],xmm1 ;f32_neg120
movss dword ptr[esi+04],xmm1 ;f32_neg120
movss dword ptr[esi+08],xmm4 ;f32_neg10
movss dword ptr[esi+12],xmm7 ;f32_negSin45
mov dword ptr[esi+16],0
movss dword ptr[esi+20],xmm6 ;f32_sin45

add esi,24
movss dword ptr[esi+00],xmm3 ;f32_neg120
movss dword ptr[esi+04],xmm3 ;f32_neg120
mov dword ptr[esi+08],0
movss dword ptr[esi+12],xmm7 ;f32_negSin45
mov dword ptr[esi+16],0
movss dword ptr[esi+20],xmm6 ;f32_sin45

add esi,24
movss dword ptr[esi+00],xmm3 ;f32_neg120
movss dword ptr[esi+04],xmm2 ;f32_120
mov dword ptr[esi+08],0
movss dword ptr[esi+12],xmm7 ;f32_negSin45
mov dword ptr[esi+16],0
movss dword ptr[esi+20],xmm6 ;f32_sin45

;3 - South

add esi,24
movss dword ptr[esi+00],xmm1 ;f32_neg120
movss dword ptr[esi+04],xmm1 ;f32_neg120
movss dword ptr[esi+08],xmm4 ;f32_neg10
mov dword ptr[esi+12],0
movss dword ptr[esi+16],xmm7 ;f32_negSin45
movss dword ptr[esi+20],xmm6 ;f32_sin45

add esi,24
movss dword ptr[esi+00],xmm0 ;f32_120
movss dword ptr[esi+04],xmm1 ;f32_neg120
movss dword ptr[esi+08],xmm4 ;f32_neg10
mov dword ptr[esi+12],0
movss dword ptr[esi+16],xmm7 ;f32_negSin45
movss dword ptr[esi+20],xmm6 ;f32_sin45

add esi,24
movss dword ptr[esi+00],xmm2 ;f32_120
movss dword ptr[esi+04],xmm3 ;f32_neg120
mov dword ptr[esi+08],0
mov dword ptr[esi+12],0
movss dword ptr[esi+16],xmm7 ;f32_negSin45
movss dword ptr[esi+20],xmm6 ;f32_sin45

add esi,24
movss dword ptr[esi+00],xmm3 ;f32_neg120
movss dword ptr[esi+04],xmm3 ;f32_neg120
mov dword ptr[esi+08],0
mov dword ptr[esi+12],0
movss dword ptr[esi+16],xmm7 ;f32_negSin45
movss dword ptr[esi+20],xmm6 ;f32_sin45

;4 - East

add esi,24
movss dword ptr[esi+00],xmm0 ;f32_120
movss dword ptr[esi+04],xmm1 ;f32_neg120
movss dword ptr[esi+08],xmm4 ;f32_neg10
movss dword ptr[esi+12],xmm6 ;f32_sin45
mov dword ptr[esi+16],0
movss dword ptr[esi+20],xmm6 ;f32_sin45

add esi,24
movss dword ptr[esi+00],xmm0 ;f32_120
movss dword ptr[esi+04],xmm0 ;f32_120
movss dword ptr[esi+08],xmm4 ;f32_neg10
movss dword ptr[esi+12],xmm6 ;f32_sin45
mov dword ptr[esi+16],0
movss dword ptr[esi+20],xmm6 ;f32_sin45

add esi,24
movss dword ptr[esi+00],xmm2 ;f32_120
movss dword ptr[esi+04],xmm2 ;f32_120
mov dword ptr[esi+08],0
movss dword ptr[esi+12],xmm6 ;f32_sin45
mov dword ptr[esi+16],0
movss dword ptr[esi+20],xmm6 ;f32_sin45

add esi,24
movss dword ptr[esi+00],xmm2 ;f32_120
movss dword ptr[esi+04],xmm3 ;f32_neg120
mov dword ptr[esi+08],0
movss dword ptr[esi+12],xmm6 ;f32_sin45
mov dword ptr[esi+16],0
movss dword ptr[esi+20],xmm6 ;f32_sin45

xor eax,eax
ret
InitCaps endp


