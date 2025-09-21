;void InitGL()

mov rcx,405H ;GL_BACK
Call glCullFace

mov rcx, 0b44H ;GL_CULL_FACE
Call glEnable

xorps xmm3,xmm3
xorps xmm2,xmm2
xorps xmm1,xmm1
xorps xmm0,xmm0
Call glClearColor

movsd xmm0,f64_1
Call glClearDepth

mov rcx,201H ;GL_LESS
Call glDepthFunc

mov rcx,0b71H ;GL_DEPTH_TEST
Call glEnable

mov rcx,1d01H ;GL_SMOOTH
Call glShadeModel

mov rcx,0ba1H ;GL_NORMALIZE
Call glEnable

;float fMatAmbient[] = {0.8, 0.8, 0.8, 1.0};
mov rcx,404H ;GL_FRONT
mov rdx,1200H ;GL_AMBIENT
lea r8,fMatAmbient
Call glMaterialfv

;float fMatDiffuse[] = {0.8, 0.8, 0.8, 1.0};
mov rcx,404H ;GL_FRONT
mov rdx,1201H ;GL_DIFFUSE
lea r8,fMatDiffuse
Call glMaterialfv

;float fMatSpecular[] = {0.9, 0.9, 0.9, 1.0};
mov rcx,404H ;GL_FRONT
mov rdx,1202H ;GL_SPECULAR
lea r8,fMatSpecular
Call glMaterialfv

;float fMatEmmision[] = {0.0, 0.0, 0.0, 1.0};
mov rcx,404H ;GL_FRONT
mov rdx,1600H ;GL_EMISSION
lea r8,fMatEmmision
Call glMaterialfv

;float fMatShininess[] = {100.0};
mov rcx,404H ;GL_FRONT
mov rdx,1601H ;GL_SHININESS
lea r8,fMatShininess
Call glMaterialfv

;float fLightAmbient[] = {0.2, 0.2, 0.2, 1.0};
mov rcx,4000H ;GL_LIGHT0
mov rdx,1200H ;GL_AMBIENT
lea r8,fLightAmbient
Call glLightfv

;float fLightPosition[] = {200.0, 0.0, 0.0, 1.0};
mov rcx,4000H ;GL_LIGHT0
mov rdx,1203H ;GL_POSITION
lea r8,fLightPosition
Call glLightfv

mov rcx,0b50H ;GL_LIGHTING
Call glEnable

mov rcx,4000H ;GL_LIGHT0
Call glEnable

;SetTextures(); - Not Necessary

mov rcx,0de1H ;GL_TEXTURE_2D
Call glEnable

