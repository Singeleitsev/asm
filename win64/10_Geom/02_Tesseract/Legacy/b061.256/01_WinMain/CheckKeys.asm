lblWinMainCheckKeys:

cmp keys[57h],0 ;VK_W
je @f
fld a_R3_YZ
fsub da_R3_YZ ;Camera Pitch Up
fstp a_R3_YZ

@@:
cmp keys[53h],0 ;VK_S
je @f
fld a_R3_YZ
fadd da_R3_YZ ;Camera Pitch Down
fstp a_R3_YZ

@@:
cmp keys[41h],0 ;VK_A
je @f
fld a_R3_XY
fadd da_R3_YZ ;Camera Yaw Left
fstp a_R3_XY

@@:
cmp keys[44h],0 ;VK_D
je @f
fld a_R3_XY
fsub da_R3_YZ ;Camera Yaw Right
fstp a_R3_XY

;------------------------

@@:
cmp keys[26h],0 ;VK_UP
je @f
;xTrans += (float)sin(aXY * PI_div_180) * dL;
;yTrans += (float)cos(aXY * PI_div_180) * dL;
fld a_R3_XY
fmul f32_pi180
fsincos
fmul dL_Cam
fadd y3D_Trans
fstp y3D_Trans
fmul dL_Cam
fadd x3D_Trans
fstp x3D_Trans

@@:
cmp keys[28h],0 ;VK_DOWN
je @f
;xTrans -= (float)sin(aXY * PI_div_180) * dL;
;yTrans -= (float)cos(aXY * PI_div_180) * dL;
fld a_R3_XY
fmul f32_pi180
fsincos
fmul dL_Cam
fsub y3D_Trans
fchs
fstp y3D_Trans
fmul dL_Cam
fsub x3D_Trans
fchs
fstp x3D_Trans

@@:
cmp keys[25h],0 ;VK_LEFT
je @f
;xTrans -= (float)cos(aXY * PI_div_180) * dL;
;yTrans += (float)sin(aXY * PI_div_180) * dL;
fld a_R3_XY
fmul f32_pi180
fsincos
fmul dL_Cam
fsub x3D_Trans
fchs
fstp x3D_Trans
fmul dL_Cam
fadd y3D_Trans
fstp y3D_Trans

@@:
cmp keys[27h],0 ;VK_RIGHT
je @f
;xTrans += (float)cos(aXY * PI_div_180) * dL;
;yTrans -= (float)sin(aXY * PI_div_180) * dL;
fld a_R3_XY
fmul f32_pi180
fsincos
fmul dL_Cam
fadd x3D_Trans
fstp x3D_Trans
fmul dL_Cam
fsub y3D_Trans
fchs
fstp y3D_Trans

;-------------------------
@@:
cmp keys[20h],0 ;VK_SPACE
je @f
call InitGL
;-------------------------
@@:
cmp keys[1Bh],0 ;VK_ESCAPE
je @f
jmp lblWinMainDone
;-------------------------
@@: ;Default
jmp lblWinMainReDraw
;-------------------------


