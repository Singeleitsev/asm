getReqObjRAM proc
PROLOG 100h

mov gnObjVertexArraySize,240000 ;(20000 * 12)

mov gnObjNormalArraySize,240000 ;(20000 * 12)

mov gnObjCombinedArraySize,480000 ;(20000 * 24)

mov gnObjIndexArraySize,480000 ;(60000 * 4)

mov gnMtlArraySize,480000 ;(60000 * 4) enough for 60000 faces

;Success
mov rax,1

EPILOG
getReqObjRAM endp