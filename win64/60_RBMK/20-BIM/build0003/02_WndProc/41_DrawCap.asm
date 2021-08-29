 mov rcx,5 ;GL_TRIANGLE_STRIP
 call glBegin
 
;Gray Color
 movups xmm0,c0_5
 movups xmm1,c0_5
 movups xmm2,c0_5
 call glColor3f

;Starting From South-West
;and setting
;vertices Counter-ClockWise
;faces Counter-ClockWise

;South Face
 movups xmm0,c_0_25
 movups xmm1,c_0_25
 movups xmm2,c_0_05
 call glVertex3f ;11

 movups xmm0,c_0_2
 movups xmm1,c_0_2
 movups xmm2,zero
 call glVertex3f ;21

 movups xmm0,c0_25
 movups xmm1,c_0_25
 movups xmm2,c_0_05
 call glVertex3f ;12

 movups xmm0,c0_2
 movups xmm1,c_0_2
 movups xmm2,zero
 call glVertex3f ;22

;East Face
 movups xmm0,c0_25
 movups xmm1,c0_25
 movups xmm2,c_0_05
 call glVertex3f ;13

 movups xmm0,c0_2
 movups xmm1,c0_2
 movups xmm2,zero
 call glVertex3f ;23

;North Face
 movups xmm0,c_0_25
 movups xmm1,c0_25
 movups xmm2,c_0_05
 call glVertex3f ;14

 movups xmm0,c_0_2
 movups xmm1,c0_2
 movups xmm2,zero
 call glVertex3f ;24

;West Face
 movups xmm0,c_0_25
 movups xmm1,c_0_25
 movups xmm2,c_0_05
 call glVertex3f ;11

 movups xmm0,c_0_2
 movups xmm1,c_0_2
 movups xmm2,zero
 call glVertex3f ;21

 call glEnd


 mov rcx,5 ;GL_TRIANGLE_STRIP
 call glBegin
 
;Gray Color
 movups xmm0,c0_5
 movups xmm1,c0_5
 movups xmm2,c0_5
 call glColor3f

;Top Face
 movups xmm0,c_0_2
 movups xmm1,c_0_2
 movups xmm2,zero
 call glVertex3f ;21

 movups xmm0,c0_2
 movups xmm1,c_0_2
 movups xmm2,zero
 call glVertex3f ;22

 movups xmm0,c_0_2
 movups xmm1,c0_2
 movups xmm2,zero
 call glVertex3f ;24

 movups xmm0,c0_2
 movups xmm1,c0_2
 movups xmm2,zero
 call glVertex3f ;23

 call glEnd