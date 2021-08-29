sub     rsp,8
sub     rsp,20
mov     rcx,0
call    qword ptr ds:[<&GetModuleHandleA>]
add     rsp,20
mov     qword ptr ds:[4020EE],rax
mov     eax,1
cpuid   
and     ecx,18001000
cmp     ecx,18001000
jne     pyramid.401048
lea     rdi,qword ptr ds:[40156F]
mov     qword ptr ds:[4021DA],rdi
jmp     pyramid.4010E6
sub     rsp,20
xor     rcx,rcx
lea     rdx,qword ptr ds:[402020]
lea     r8,qword ptr ds:[402000]
mov     r9,10
call    qword ptr ds:[<&MessageBoxA>]
add     rsp,20
mov     eax,1
cpuid   
and     ecx,18000000
cmp     ecx,18000000
jne     pyramid.4010A0
xor     ecx,ecx
xgetbv  
and     eax,6
cmp     eax,6
jne     pyramid.4010A0
lea     rdi,qword ptr ds:[40163C]
mov     qword ptr ds:[4021DA],rdi
jmp     pyramid.4010E6
sub     rsp,20
xor     rcx,rcx
lea     rdx,qword ptr ds:[402056]
lea     r8,qword ptr ds:[402000]
mov     r9,10
call    qword ptr ds:[<&MessageBoxA>]
add     rsp,20
lea     rdi,qword ptr ds:[40170F]
mov     qword ptr ds:[4021DA],rdi
jmp     pyramid.4010E6
lea     rdi,qword ptr ds:[4017C8]
mov     qword ptr ds:[4021DA],rdi
jmp     pyramid.4010E6
mov     eax,1
cpuid   
and     ecx,40000000
cmp     ecx,40000000
jne     pyramid.40110B
lea     rdi,qword ptr ds:[4018DF]
mov     qword ptr ds:[4021E2],rdi
jmp     pyramid.401163
sub     rsp,20
xor     rcx,rcx
lea     rdx,qword ptr ds:[402093]
lea     r8,qword ptr ds:[402000]
mov     r9,10
call    qword ptr ds:[<&MessageBoxA>]
add     rsp,20
jmp     pyramid.401143
lea     rdi,qword ptr ds:[4018DF]
mov     qword ptr ds:[4021E2],rdi
jmp     pyramid.401163
lea     rdi,qword ptr ds:[4018DF]
mov     qword ptr ds:[4021E2],rdi
jmp     pyramid.401163
lea     rdi,qword ptr ds:[4018DF]
mov     qword ptr ds:[4021E2],rdi
jmp     pyramid.401163
sub     rsp,20
mov     rcx,0
mov     rdx,7F00
call    qword ptr ds:[<&LoadIconA>]
add     rsp,20
mov     qword ptr ds:[4020F6],rax
sub     rsp,20
mov     rcx,0
mov     rdx,7F00
call    qword ptr ds:[<&LoadCursorA>]
add     rsp,20
mov     qword ptr ds:[4020FE],rax
sub     rsp,20
mov     rcx,pyramid.4020D6
call    qword ptr ds:[<&RegisterClassA>]
add     rsp,20
sub     rsp,60
mov     rcx,0
mov     rdx,pyramid.402013
mov     r8,pyramid.402000
mov     r9,16CF0000
mov     qword ptr ss:[rsp+20],10
mov     qword ptr ss:[rsp+28],10
mov     qword ptr ss:[rsp+30],1B0
mov     qword ptr ss:[rsp+38],1B0
mov     qword ptr ss:[rsp+40],0
mov     qword ptr ss:[rsp+48],0
mov     rax,qword ptr ds:[4020EE]
mov     qword ptr ss:[rsp+50],rax
mov     qword ptr ss:[rsp+58],0
call    qword ptr ds:[<&CreateWindowExA>]
add     rsp,60
sub     rsp,20
lea     rcx,qword ptr ds:[40212E]
mov     rdx,0
mov     r8,0
mov     r9,0
call    qword ptr ds:[<&GetMessageA>]
add     rsp,20
cmp     eax,1
jb      pyramid.401290
jne     pyramid.401233
sub     rsp,20
lea     rcx,qword ptr ds:[40212E]
call    qword ptr ds:[<&TranslateMessage>]
add     rsp,20
sub     rsp,20
lea     rcx,qword ptr ds:[40212E]
call    qword ptr ds:[<&DispatchMessageA>]
add     rsp,20
jmp     pyramid.401233
sub     rsp,20
mov     rcx,qword ptr ds:[40213E]
call    qword ptr ds:[<&RtlExitUserProcess>]
add     rsp,20



push    rbp
mov     rbp,rsp
sub     rsp,8
push    rbx
push    rsi
push    rdi
mov     qword ptr ss:[rbp+10],rcx
sub     rsp,20
cmp     edx,F
je      pyramid.401427
cmp     edx,100
je      pyramid.4018F6
cmp     edx,2
je      pyramid.401900
cmp     edx,5
je      pyramid.4013ED
cmp     edx,1
je      pyramid.4012EF
call    qword ptr ds:[<&NtdllDefWindowProc_A>]
jmp     pyramid.401941




;wmCreate:
call    qword ptr ds:[<&GetDC>]
mov     qword ptr ds:[40211E],rax

lea     rdi,qword ptr ds:[40216E]
mov     rcx,5
xor     eax,eax
rep stosq qword ptr ds:[rdi],rax
mov     word ptr ds:[40216E],28
mov     word ptr ds:[402170],1
mov     dword ptr ds:[402172],25
mov     byte ptr ds:[402188],0
mov     byte ptr ds:[402176],0
mov     byte ptr ds:[402177],10
mov     byte ptr ds:[402185],10
mov     byte ptr ds:[402180],0
mov     byte ptr ds:[402186],0

mov     rcx,qword ptr ds:[40211E]
lea     rdx,qword ptr ds:[40216E]
call    qword ptr ds:[<&ChoosePixelFormat>]

mov     rcx,qword ptr ds:[40211E]
mov     edx,eax
lea     r8,qword ptr ds:[40216E]
call    qword ptr ds:[<&SetPixelFormat>]

mov     rcx,qword ptr ds:[40211E]
call    qword ptr ds:[<&wglCreateContext>]

mov     qword ptr ds:[402126],rax
mov     rcx,qword ptr ds:[40211E]
mov     rdx,qword ptr ds:[402126]
call    qword ptr ds:[<&wglMakeCurrent>]

mov     rcx,qword ptr ss:[rbp+10]
lea     rdx,qword ptr ds:[40215E]
call    qword ptr ds:[<&GetClientRect>]

mov     rcx,0
mov     rdx,0
mov     r8d,dword ptr ds:[402166]
mov     r9d,dword ptr ds:[40216A]
call    qword ptr ds:[<&glViewport>]

call    qword ptr ds:[<&GetTickCount>]

mov     dword ptr ds:[402196],eax
xor     eax,eax
jmp     pyramid.401941




mov     rcx,qword ptr ss:[rbp+10]
lea     rdx,qword ptr ds:[40215E]
call    qword ptr ds:[<&GetClientRect>]

mov     rcx,0
mov     rdx,0
mov     r8d,dword ptr ds:[402166]
mov     r9d,dword ptr ds:[40216A]
call    qword ptr ds:[<&glViewport>]

xor     eax,eax
jmp     pyramid.401941




call    qword ptr ds:[<&GetTickCount>]
sub     eax,dword ptr ds:[402196]
cmp     eax,A
jb      pyramid.401465
add     dword ptr ds:[402196],eax

mov     eax,3F800000
movd    xmm0,eax
movd    xmm1,dword ptr ds:[4021AE]
movd    xmm2,dword ptr ds:[4021B6]
movd    xmm3,dword ptr ds:[4021B2]
call    qword ptr ds:[<&glRotatef>]

mov     rcx,4000
call    qword ptr ds:[<&glClear>]

mov     rcx,0
call    qword ptr ds:[<&glBegin>]

movd    xmm0,dword ptr ds:[403048]
movd    xmm1,dword ptr ds:[40304C]
movd    xmm2,dword ptr ds:[403050]
call    qword ptr ds:[<&glColor3f>]

movd    xmm0,dword ptr ds:[403038]
movd    xmm1,dword ptr ds:[40303C]
movd    xmm2,dword ptr ds:[403040]
call    qword ptr ds:[<&glVertex3f>]

movd    xmm0,dword ptr ds:[403068]
movd    xmm1,dword ptr ds:[40306C]
movd    xmm2,dword ptr ds:[403070]
call    qword ptr ds:[<&glColor3f>]

movd    xmm0,dword ptr ds:[403058]
movd    xmm1,dword ptr ds:[40305C]
movd    xmm2,dword ptr ds:[403060]
call    qword ptr ds:[<&glVertex3f>]

movd    xmm0,dword ptr ds:[403088]
movd    xmm1,dword ptr ds:[40308C]
movd    xmm2,dword ptr ds:[403090]
call    qword ptr ds:[<&glColor3f>]

movd    xmm0,dword ptr ds:[403078]
movd    xmm1,dword ptr ds:[40307C]
movd    xmm2,dword ptr ds:[403080]
call    qword ptr ds:[<&glVertex3f>]

movd    xmm0,dword ptr ds:[4030A8]
movd    xmm1,dword ptr ds:[4030AC]
movd    xmm2,dword ptr ds:[4030B0]
call    qword ptr ds:[<&glColor3f>]

movd    xmm0,dword ptr ds:[403098]
movd    xmm1,dword ptr ds:[40309C]
movd    xmm2,dword ptr ds:[4030A0]
call    qword ptr ds:[<&glVertex3f>]

vbroadcastss ymm4,dword ptr ds:[403004]
vmulps  ymm8,ymm4,yword ptr ds:[403038]
vmulps  ymm9,ymm4,yword ptr ds:[403058]
vmulps  ymm10,ymm4,yword ptr ds:[403078]
vmulps  ymm11,ymm4,yword ptr ds:[403098]
xor     rax,rax
mov     qword ptr ds:[4021A6],rax
rdrand  rax
xor     rdx,rdx
mov     rcx,4
div     rcx
cmp     rdx,2
jg      pyramid.4015D6
je      pyramid.4015CF
cmp     rdx,1
je      pyramid.4015C8
vfmadd213ps ymm3,ymm4,ymm8
jmp     pyramid.4015DB
vfmadd213ps ymm3,ymm4,ymm9
jmp     pyramid.4015DB
vfmadd213ps ymm3,ymm4,ymm10
jmp     pyramid.4015DB
vfmadd213ps ymm3,ymm4,ymm11
vmovups yword ptr ds:[4021BA],ymm3
movd    xmm0,dword ptr ds:[4021CA]
movd    xmm1,dword ptr ds:[4021CE]
movd    xmm2,dword ptr ds:[4021D2]
call    qword ptr ds:[<&glColor3f>]
movd    xmm0,dword ptr ds:[4021BA]
movd    xmm1,dword ptr ds:[4021BE]
movd    xmm2,dword ptr ds:[4021C2]
call    qword ptr ds:[<&glVertex3f>]
inc     qword ptr ds:[4021A6]
cmp     qword ptr ds:[4021A6],1000
jl      pyramid.4015A2
jmp     pyramid.4018DF
vbroadcastss ymm4,dword ptr ds:[403000]
vmovups ymm8,yword ptr ds:[403038]
vmovups ymm9,yword ptr ds:[403058]
vmovups ymm10,yword ptr ds:[403078]
vmovups ymm11,yword ptr ds:[403098]
xor     rax,rax
mov     qword ptr ds:[4021A6],rax
rdrand  rax
xor     rdx,rdx
mov     rcx,4
div     rcx
cmp     rdx,2
jg      pyramid.4016A3
je      pyramid.40169C
cmp     rdx,1
je      pyramid.401695
vaddps  ymm3,ymm3,ymm8
jmp     pyramid.4016A8
vaddps  ymm3,ymm3,ymm9
jmp     pyramid.4016A8
vaddps  ymm3,ymm3,ymm10
jmp     pyramid.4016A8
vaddps  ymm3,ymm3,ymm11
vdivps  ymm3,ymm3,ymm4
jmp     pyramid.4016AE
vmovups yword ptr ds:[4021BA],ymm3
movd    xmm0,dword ptr ds:[4021CA]
movd    xmm1,dword ptr ds:[4021CE]
movd    xmm2,dword ptr ds:[4021D2]
call    qword ptr ds:[<&glColor3f>]
movd    xmm0,dword ptr ds:[4021BA]
movd    xmm1,dword ptr ds:[4021BE]
movd    xmm2,dword ptr ds:[4021C2]
call    qword ptr ds:[<&glVertex3f>]
inc     qword ptr ds:[4021A6]
cmp     qword ptr ds:[4021A6],1000
jl      pyramid.40166F
jmp     pyramid.4018DF
movups  xmm5,xmmword ptr ds:[403008]
xor     rax,rax
mov     qword ptr ds:[4021A6],rax
rdrand  rax
xor     rdx,rdx
mov     rcx,4
div     rcx
mov     rax,rdx
mov     rcx,20
mul     cx
mov     rsi,pyramid.403038
add     rsi,rax
mov     rdi,rsi
add     rdi,10
movups  xmm0,xmmword ptr ds:[rsi]
addps   xmm3,xmm0
mulps   xmm3,xmm5
movups  xmmword ptr ds:[4021BA],xmm3
movups  xmm0,xmmword ptr ds:[rdi]
addps   xmm4,xmm0
mulps   xmm4,xmm5
movups  xmmword ptr ds:[4021CA],xmm4
movd    xmm0,dword ptr ds:[4021CA]
movd    xmm1,dword ptr ds:[4021CE]
movd    xmm2,dword ptr ds:[4021D2]
call    qword ptr ds:[<&glColor3f>]
movd    xmm0,dword ptr ds:[4021BA]
movd    xmm1,dword ptr ds:[4021BE]
movd    xmm2,dword ptr ds:[4021C2]
call    qword ptr ds:[<&glVertex3f>]
inc     qword ptr ds:[4021A6]
cmp     qword ptr ds:[4021A6],1000
jl      pyramid.401720
jmp     pyramid.4018DF
xor     rax,rax
mov     qword ptr ds:[4021A6],rax
rdrand  rax
xor     rdx,rdx
mov     rcx,4
div     rcx
mov     rax,rdx
mov     rcx,20
mul     cx
mov     rsi,pyramid.403038
add     rsi,rax
wait    
fninit  
fld     dword ptr ds:[4021BA]
fadd    dword ptr ds:[rsi]
fdiv    dword ptr ds:[403000]
fstp    dword ptr ds:[4021BA]
wait    
fninit  
fld     dword ptr ds:[4021BE]
fadd    dword ptr ds:[rsi+4]
fdiv    dword ptr ds:[403000]
fstp    dword ptr ds:[4021BE]
wait    
fninit  
fld     dword ptr ds:[4021C2]
fadd    dword ptr ds:[rsi+8]
fdiv    dword ptr ds:[403000]
fstp    dword ptr ds:[4021C2]
wait    
fninit  
fld     dword ptr ds:[4021CA]
fadd    dword ptr ds:[rsi+10]
fdiv    dword ptr ds:[403000]
fstp    dword ptr ds:[4021CA]
wait    
fninit  
fld     dword ptr ds:[4021CE]
fadd    dword ptr ds:[rsi+14]
fdiv    dword ptr ds:[403000]
fstp    dword ptr ds:[4021CE]
wait    
fninit  
fld     dword ptr ds:[4021D2]
fadd    dword ptr ds:[rsi+18]
fdiv    dword ptr ds:[403000]
fstp    dword ptr ds:[4021D2]
movd    xmm0,dword ptr ds:[4021CA]
movd    xmm1,dword ptr ds:[4021CE]
movd    xmm2,dword ptr ds:[4021D2]
call    qword ptr ds:[<&glColor3f>]
movd    xmm0,dword ptr ds:[4021BA]
movd    xmm1,dword ptr ds:[4021BE]
movd    xmm2,dword ptr ds:[4021C2]
call    qword ptr ds:[<&glVertex3f>]
inc     qword ptr ds:[4021A6]
cmp     qword ptr ds:[4021A6],1000
jl      pyramid.4017D2
jmp     pyramid.4018DF






call    qword ptr ds:[<&glEnd>]

mov     rcx,qword ptr ds:[40211E]
call    qword ptr ds:[<&SwapBuffers>]

xor     eax,eax
jmp     pyramid.401941





cmp     r8d,1B
jne     pyramid.4012E4



mov     rcx,0
mov     rdx,0
call    qword ptr ds:[<&wglMakeCurrent>]
mov     rcx,qword ptr ds:[402126]
call    qword ptr ds:[<&wglDeleteContext>]
mov     rcx,qword ptr ss:[rbp+10]
mov     rdx,qword ptr ds:[40211E]
call    qword ptr ds:[<&ReleaseDC>]
mov     rcx,0
call    qword ptr ds:[<&PostQuitMessage>]
xor     eax,eax
add     rsp,20
pop     rdi
pop     rsi
pop     rbx
leave   
ret     