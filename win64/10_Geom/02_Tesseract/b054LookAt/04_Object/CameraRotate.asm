;RotX aYZ
movd xmm0,da_R3_YZ ;Angle
mov eax,3F800000h ;1.0f
movd xmm1,eax
xorpd xmm2,xmm2 ;0.0f
xorpd xmm3,xmm3 ;0.0f
call glRotatef

;RotX aXZ
movd xmm0,da_R3_XZ ;Angle
xorpd xmm1,xmm1 ;0.0f
mov eax,3F800000h ;1.0f
movd xmm2,eax
xorpd xmm3,xmm3 ;0.0f
call glRotatef

;RotX aYZ
movd xmm0,da_R3_YZ ;Angle
xorpd xmm1,xmm1 ;0.0f
xorpd xmm2,xmm2 ;0.0f
mov eax,3F800000h ;1.0f
movd xmm3,eax
call glRotatef