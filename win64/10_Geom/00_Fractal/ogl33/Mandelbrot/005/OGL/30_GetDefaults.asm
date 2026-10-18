GetDefaults proc
PROLOG 100h

;1. Default Perspective is hardcoded in .data segment

;2. Default Model Matrix is hardcoded in .data segment

;3. Default Object Matrix is hardcoded in .data segment.

;4. Compute the Default Camera-Object Distance
;vecObjPos is the origin (mtxObjectDefault translation = 0,0,0)
;so distDefault = |vecCamPos|
lea rcx,mtxCameraDefault
lea rdx,vecCamPos
call GetGlobalOrigin

;xmm0 = vecCamPos.x ;xmm1 = vecCamPos.y ;xmm2 = vecCamPos.z
movss xmm0,dword ptr[vecCamPos+0]
movss xmm1,dword ptr[vecCamPos+4]
movss xmm2,dword ptr[vecCamPos+8]
mulss xmm0,xmm0
mulss xmm1,xmm1
mulss xmm2,xmm2
addss xmm0,xmm1
addss xmm0,xmm2
sqrtss xmm0,xmm0
movss f32DistDefault,xmm0

GetDefaults_End:
EPILOG
GetDefaults endp


