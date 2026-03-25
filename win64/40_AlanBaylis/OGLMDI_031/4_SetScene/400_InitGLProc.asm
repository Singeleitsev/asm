InitGL proc

;Since the Proc has NO parameters
;Assembler will NOT add this prologue automatically:
push rbp
mov rbp,rsp

;Align the Stack by 10h
and rsp,-16
sub rsp,100h

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

mov rcx,404H ;GL_FRONT
mov rdx,1200H ;GL_AMBIENT
lea r8,fMatAmbient
Call glMaterialfv

mov rcx,404H ;GL_FRONT
mov rdx,1201H ;GL_DIFFUSE
lea r8,fMatDiffuse
Call glMaterialfv

mov rcx,404H ;GL_FRONT
mov rdx,1202H ;GL_SPECULAR
lea r8,fMatSpecular
Call glMaterialfv

mov rcx,404H ;GL_FRONT
mov rdx,1600H ;GL_EMISSION
lea r8,fMatEmission
Call glMaterialfv

mov rcx,404H ;GL_FRONT
mov rdx,1601H ;GL_SHININESS
lea r8,fMatShininess
Call glMaterialfv

mov rcx,4000H ;GL_LIGHT0
mov rdx,1200H ;GL_AMBIENT
lea r8,fLightAmbient
Call glLightfv

mov rcx,4000H ;GL_LIGHT0
mov rdx,1203H ;GL_POSITION
lea r8,fLightPosition
Call glLightfv

mov rcx,0b50H ;GL_LIGHTING
Call glEnable

mov rcx,4000H ;GL_LIGHT0
Call glEnable

mov rcx,0de1H ;GL_TEXTURE_2D
Call glEnable

add rsp,100h
;Since the Proc has NO parameters
;Assembler will NOT add this epilogue automatically:
leave
ret
InitGL endp

