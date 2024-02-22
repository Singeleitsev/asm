lblWinMainCheckKeys:

cmp keys[57h],0 ;VK_W
je @f
fld aYZ
fsub dA_Cam ;Camera Pitch Up
fstp aYZ

@@:
cmp keys[53h],0 ;VK_S
je @f
fld aYZ
fadd dA_Cam ;Camera Pitch Down
fstp aYZ

@@:
cmp keys[41h],0 ;VK_A
je @f
fld aXY
fadd dA_Cam ;Camera Yaw Left
fstp aXY

@@:
cmp keys[44h],0 ;VK_D
je @f
fld aXY
fsub dA_Cam ;Camera Yaw Right
fstp aXY

;------------------------

@@:
cmp keys[26h],0 ;VK_UP
je @f
;xTrans += (float)sin(aXY * PI_div_180) * dL;
;yTrans += (float)cos(aXY * PI_div_180) * dL;
fld aXY
fmul f32_PIdiv180
fsincos
fmul dL_Cam
fadd yTrans
fstp yTrans
fmul dL_Cam
fadd xTrans
fstp xTrans

@@:
cmp keys[28h],0 ;VK_DOWN
je @f
;xTrans -= (float)sin(aXY * PI_div_180) * dL;
;yTrans -= (float)cos(aXY * PI_div_180) * dL;
fld aXY
fmul f32_PIdiv180
fsincos
fmul dL_Cam
fsub yTrans
fchs
fstp yTrans
fmul dL_Cam
fsub xTrans
fchs
fstp xTrans

@@:
cmp keys[25h],0 ;VK_LEFT
je @f
;xTrans -= (float)cos(aXY * PI_div_180) * dL;
;yTrans += (float)sin(aXY * PI_div_180) * dL;
fld aXY
fmul f32_PIdiv180
fsincos
fmul dL_Cam
fsub xTrans
fchs
fstp xTrans
fmul dL_Cam
fadd yTrans
fstp yTrans

@@:
cmp keys[27h],0 ;VK_RIGHT
je @f
;xTrans += (float)cos(aXY * PI_div_180) * dL;
;yTrans -= (float)sin(aXY * PI_div_180) * dL;
fld aXY
fmul f32_PIdiv180
fsincos
fmul dL_Cam
fadd xTrans
fstp xTrans
fmul dL_Cam
fsub yTrans
fchs
fstp yTrans

;-------------------------
@@:
cmp keys[20h],0 ;VK_SPACE
je @f
call SetupWorld
;-------------------------
@@:
cmp keys[1Bh],0 ;VK_ESCAPE
je @f
jmp lblWinMainEnd
;-------------------------
@@: ;Default
jmp lblWinMainReDraw
;-------------------------


