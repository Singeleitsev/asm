;Comment style: little-endian, column-major

;1. Load lightPosition.xyz (world space)
movaps xmm4,lightPosition ;xmm4 = [Lw,Lz,Ly,Lx]

;2. Normalize (Lx, Ly, Lz)
movaps xmm5,xmm4
mulps xmm5,xmm5 ;xmm5 = [Lw*Lw,Lz*Lz,Ly*Ly,Lx*Lx]
movaps xmm6,xmm5
shufps xmm6,xmm6,11001001b ;xmm6 = [Lw*Lw,Lx*Lx,Lz*Lz,Ly*Ly]
movaps xmm7,xmm6
shufps xmm7,xmm7,11001001b ;xmm7 = [Lw*Lw,Ly*Ly,Lx*Lx,Lz*Lz]
addps xmm5,xmm6
addps xmm5,xmm7 ;xmm5 = [?,len*len,len*len,len*len]
rsqrtps xmm5,xmm5 ;xmm5 = [?,1/len,1/len,1/len]
mulps xmm4,xmm5 ;xmm4 = [?,Lnz,Lny,Lnx]
movaps xmm5,xmm4 ;xmm5 = [?,Lnz,Lny,Lnx]
movaps xmm6,xmm4 ;xmm6 = [?,Lnz,Lny,Lnx]
shufps xmm4,xmm4,0 ;xmm4 = [Lnx,Lnx,Lnx,Lnx]
shufps xmm5,xmm5,01010101b ;xmm5 = [Lny,Lny,Lny,Lny]
shufps xmm6,xmm6,10101010b ;xmm6 = [Lnz,Lnz,Lnz,Lnz]

;3. Transform by camera rotation (world > eye)
;Broadcast Lx, Ly, Lz and multiply by columns 0,1,2
;L_eye.x = m00*Lx + m04*Ly + m08*Lz
;L_eye.y = m01*Lx + m05*Ly + m09*Lz
;L_eye.z = m02*Lx + m06*Ly + m10*Lz
mulps xmm4,oword ptr[mtxCameraVolatile+0*4] ;[m03 m02 m01 m00]
mulps xmm5,oword ptr[mtxCameraVolatile+4*4] ;[m07 m06 m05 m04]
mulps xmm6,oword ptr[mtxCameraVolatile+8*4] ;[m11 m10 m09 m08]
addps xmm4,xmm5
addps xmm4,xmm6

;4. Store the result
movss xmm1,xmm4
shufps xmm4,xmm4,00111001b ;Rotate Right by 1 lane (little-endian)
movss xmm2,xmm4
shufps xmm4,xmm4,00111001b ;Rotate Right by 1 lane (little-endian)
movss xmm3,xmm4

;5. Set the light direction uniform
xor rcx,rcx
mov ecx,lightDirLocation
;xmm0 = lightDirX
;xmm1 = lightDirY
;xmm2 = lightDirZ
call qword ptr[gpGlUniform3f]

