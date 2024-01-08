lbl_wmpaint:
 rdtsc
 sub eax,clock
 cmp eax,0Ah
 jb lbl_animation_ok

 add clock,eax

 movd xmm0,aXY
 movd xmm1,aXZ
 movd xmm2,aYZ
 movd xmm3,one
 call glRotatef

lbl_animation_ok:
 mov rcx,4000h ;GL_COLOR_BUFFER_BIT
 call glClear
 
 include 41_DrawCap.asm 
 
 mov rcx,hdc
 call SwapBuffers
 
 xor eax,eax
 jmp lbl_finish
