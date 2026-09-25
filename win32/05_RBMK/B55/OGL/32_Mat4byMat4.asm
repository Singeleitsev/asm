Mat4byMat4 proc pMtxSrc0:DWORD,pMtxSrc1:DWORD,pMtxDst:DWORD

;Load the pointers
mov eax,pMtxSrc0
mov ecx,pMtxSrc1
mov edx,pMtxDst

;c[0] = a[0]*b[0] + a[4]*b[1] + a[08]*b[2] + a[12]*b[3]
;c[1] = a[1]*b[0] + a[5]*b[1] + a[09]*b[2] + a[13]*b[3]
;c[2] = a[2]*b[0] + a[6]*b[1] + a[10]*b[2] + a[14]*b[3]
;c[3] = a[3]*b[0] + a[7]*b[1] + a[11]*b[2] + a[15]*b[3]

;Column0
movaps xmm0,oword ptr[eax+00*4] ;a[00..03]
movaps xmm1,oword ptr[eax+04*4] ;a[04..07]
movaps xmm2,oword ptr[eax+08*4] ;a[08..11]
movaps xmm3,oword ptr[eax+12*4] ;a[12..15]

movss xmm4,dword ptr[ecx+00*4] ;b[00]
movss xmm5,dword ptr[ecx+01*4] ;b[01]
movss xmm6,dword ptr[ecx+02*4] ;b[02]
movss xmm7,dword ptr[ecx+03*4] ;b[03]

shufps xmm4,xmm4,0 ;broadcast b[00]
shufps xmm5,xmm5,0 ;broadcast b[01]
shufps xmm6,xmm6,0 ;broadcast b[02]
shufps xmm7,xmm7,0 ;broadcast b[03]

mulps xmm4,xmm0 ;a[00..03]*b[00] keeping xmm0
mulps xmm5,xmm1 ;a[04..07]*b[01] keeping xmm0
mulps xmm6,xmm2 ;a[08..11]*b[02] keeping xmm0
mulps xmm7,xmm3 ;a[12..15]*b[03] keeping xmm0

addps xmm4,xmm5
addps xmm4,xmm6
addps xmm4,xmm7

movaps oword ptr[edx+00*4],xmm4 ;Done

;c[4] = a[0]*b[4] + a[4]*b[5] + a[08]*b[6] + a[12]*b[7]
;c[5] = a[1]*b[4] + a[5]*b[5] + a[09]*b[6] + a[13]*b[7]
;c[6] = a[2]*b[4] + a[6]*b[5] + a[10]*b[6] + a[14]*b[7]
;c[7] = a[3]*b[4] + a[7]*b[5] + a[11]*b[6] + a[15]*b[7]

;Column1
movss xmm4,dword ptr[ecx+04*4] ;b[04]
movss xmm5,dword ptr[ecx+05*4] ;b[05]
movss xmm6,dword ptr[ecx+06*4] ;b[06]
movss xmm7,dword ptr[ecx+07*4] ;b[07]

shufps xmm4,xmm4,0 ;broadcast b[04]
shufps xmm5,xmm5,0 ;broadcast b[05]
shufps xmm6,xmm6,0 ;broadcast b[06]
shufps xmm7,xmm7,0 ;broadcast b[07]

mulps xmm4,xmm0 ;a[00..03]*b[04] keeping xmm0
mulps xmm5,xmm1 ;a[04..07]*b[05] keeping xmm0
mulps xmm6,xmm2 ;a[08..11]*b[06] keeping xmm0
mulps xmm7,xmm3 ;a[12..15]*b[07] keeping xmm0

addps xmm4,xmm5
addps xmm4,xmm6
addps xmm4,xmm7

movaps oword ptr[edx+04*4],xmm4 ;Done

;c[08] = a[0]*b[8] + a[4]*b[9] + a[08]*b[10] + a[12]*b[11]
;c[09] = a[1]*b[8] + a[5]*b[9] + a[09]*b[10] + a[13]*b[11]
;c[10] = a[2]*b[8] + a[6]*b[9] + a[10]*b[10]+ a[14]*b[11]
;c[11] = a[3]*b[8] + a[7]*b[9] + a[11]*b[10]+ a[15]*b[11]

;Column2
movss xmm4,dword ptr[ecx+08*4] ;b[08]
movss xmm5,dword ptr[ecx+09*4] ;b[09]
movss xmm6,dword ptr[ecx+10*4] ;b[10]
movss xmm7,dword ptr[ecx+11*4] ;b[11]

shufps xmm4,xmm4,0 ;broadcast b[08]
shufps xmm5,xmm5,0 ;broadcast b[09]
shufps xmm6,xmm6,0 ;broadcast b[10]
shufps xmm7,xmm7,0 ;broadcast b[11]

mulps xmm4,xmm0 ;a[00..03]*b[08] keeping xmm0
mulps xmm5,xmm1 ;a[04..07]*b[09] keeping xmm0
mulps xmm6,xmm2 ;a[08..11]*b[10] keeping xmm0
mulps xmm7,xmm3 ;a[12..15]*b[11] keeping xmm0

addps xmm4,xmm5
addps xmm4,xmm6
addps xmm4,xmm7

movaps oword ptr[edx+08*4],xmm4 ;Done

;c[12] = a[0]*b[12] + a[4]*b[13] + a[08]*b[14] + a[12]*b[15]
;c[13] = a[1]*b[12] + a[5]*b[13] + a[09]*b[14] + a[13]*b[15]
;c[14] = a[2]*b[12] + a[6]*b[13] + a[10]*b[14] + a[14]*b[15]
;c[15] = a[3]*b[12] + a[7]*b[13] + a[11]*b[14] + a[15]*b[15]

;Column3
movss xmm4,dword ptr[ecx+12*4] ;b[12]
movss xmm5,dword ptr[ecx+13*4] ;b[13]
movss xmm6,dword ptr[ecx+14*4] ;b[14]
movss xmm7,dword ptr[ecx+15*4] ;b[15]

shufps xmm4,xmm4,0 ;broadcast b[12]
shufps xmm5,xmm5,0 ;broadcast b[13]
shufps xmm6,xmm6,0 ;broadcast b[14]
shufps xmm7,xmm7,0 ;broadcast b[15]

mulps xmm4,xmm0 ;a[00..03]*b[12] keeping xmm0
mulps xmm5,xmm1 ;a[04..07]*b[13] keeping xmm0
mulps xmm6,xmm2 ;a[08..11]*b[14] keeping xmm0
mulps xmm7,xmm3 ;a[12..15]*b[15] keeping xmm0

addps xmm4,xmm5
addps xmm4,xmm6
addps xmm4,xmm7

movaps oword ptr[edx+12*4],xmm4 ;Done

ret
Mat4byMat4 endp

