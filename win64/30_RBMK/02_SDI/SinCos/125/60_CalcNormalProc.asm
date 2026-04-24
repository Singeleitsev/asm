;https://www.khronos.org/opengl/wiki/Calculating_a_Surface_Normal
;Begin Function CalculateSurfaceNormal (Input Triangle) Returns Vector
CalcNormalProc proc lpFace:QWORD

;Prologue:
push rbp
mov rbp,rsp

;and rsp,-16 ;Align the Stack
;sub rsp,100h ;Create the Buffer

movups xmm0,xmmword ptr[rcx] ;p1
movups xmm1,xmmword ptr[rcx+10h] ;p2
movups xmm2,xmmword ptr[rcx+20h] ;p3

;;Set Vector U to (Triangle.p2 minus Triangle.p1)
subps xmm1,xmm0
;;Set Vector V to (Triangle.p3 minus Triangle.p1)
subps xmm2,xmm0

;Set Normal.x to (multiply U.y by V.z) minus (multiply U.z by V.y)
;Set Normal.y to (multiply U.z by V.x) minus (multiply U.x by V.z)
;Set Normal.z to (multiply U.x by V.y) minus (multiply U.y by V.x)

pshufd xmm3,xmm1,11001001b ;xmm3 = uw,ux,uz,uy
pshufd xmm4,xmm2,11010010b ;xmm4 = vw,vy,vx,vz

pshufd xmm5,xmm1,11010010b ;xmm5 = uw,uy,ux,uz
pshufd xmm6,xmm2,11001001b ;xmm6 = vw,vx,vz,vy

mulps xmm3,xmm4 ;xmm3 = uw*vw,ux*vy,uz*vx,uy*vz
mulps xmm5,xmm6 ;xmm5 = uw*vw,uy*vx,ux*vz,uz*vy

subps xmm3,xmm5 ;xmm3 = 0,Normal.z,Normal.y,Normal.x

movups dword ptr [rcx+30h],xmm3 ;Normal

;Epilogue:
leave
ret
CalcNormalProc endp


