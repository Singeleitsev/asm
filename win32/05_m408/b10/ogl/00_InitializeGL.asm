InitializeGL proc

LOG_TEXT szGetDC
invoke GetDC,ghWnd
test eax,eax
jz InitializeGL_Error
mov ghDC,eax
LOG_TEXT szOK

LOG_TEXT szChoosePixelFormat
invoke ChoosePixelFormat,ghDC,OFFSET_PFD
mov giPixelFormat,eax
test eax,eax
jz InitializeGL_Error
LOG_TEXT szOK

LOG_TEXT szSetPixelFormat
invoke SetPixelFormat,ghDC,giPixelFormat,OFFSET_PFD
test eax,eax
jz InitializeGL_Error
LOG_TEXT szOK

LOG_TEXT szWglCreateContext
invoke wglCreateContext,ghDC
test eax,eax
jz InitializeGL_Error
mov ghRC,eax
LOG_TEXT szOK

LOG_TEXT szWglMakeCurrent
invoke wglMakeCurrent,ghDC,ghRC
test eax,eax
jz InitializeGL_Error
LOG_TEXT szOK

;Ensure Counter-Clockwise Winding is on
invoke glFrontFace,901h ;GL_CCW

;Don't draw the unseen sides of polygons
invoke glEnable,0B44h ;GL_CULL_FACE

;Ensure back-facing polygons are culled
invoke glCullFace,405h ;GL_BACK

;Don't draw the overlayed polygons
invoke glEnable,0B71h ;GL_DEPTH_TEST

;Ensure Smooth (Gouraud) Shading is on
invoke glShadeModel,1D01h ;GL_SMOOTH

;Prefer quality over speed for perspective-correct interpolation
push 1102h ;GL_NICEST
push 0C50h ;GL_PERSPECTIVE_CORRECTION_HINT
call glHint

;Success
xor eax,eax
ret

InitializeGL_Error:
call SpellError
mov eax,-1
ret

InitializeGL endp


