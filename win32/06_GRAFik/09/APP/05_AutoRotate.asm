;05_AutoRotate - медленно
cmp autoRotate, 0
je @NoAutoRotate

;advance outer angle: autoAngle += fRotOuter
movss xmm0, autoAngle
addss xmm0, fRotOuter
movss autoAngle, xmm0

;advance inner angle: autoAngle2 += fRotInner
movss xmm1, autoAngle2
addss xmm1, fRotInner
movss autoAngle2, xmm1

;wrap outer angle at 360
movss xmm0, autoAngle
comiss xmm0, f360_real
jbe @Check2 ;if autoAngle <= 360, skip subtraction

subss xmm0, f360_real ; autoAngle -= 360.0
movss autoAngle, xmm0

@Check2:
;wrap inner angle at 360
movss xmm1, autoAngle2
comiss xmm1, f360_real
jbe @DoneCheck ;if autoAngle2 <= 360, skip

subss xmm1, f360_real ;autoAngle2 -= 360.0
movss autoAngle2, xmm1

@DoneCheck:
mov isRefreshed, 0 ;signal redraw needed

@NoAutoRotate: